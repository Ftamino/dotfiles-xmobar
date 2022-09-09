#!/usr/bin/env python

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

import os
from os.path import exists
from os.path import expanduser
from pathlib import Path

import shutil
import subprocess

home = expanduser("~")

class MyWindow1(Gtk.Window):
    def __init__(self):
        super().__init__(title="Theme Changer")

        self.set_border_width(10)
        self.set_default_size(640, 300)
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_resizable(False)

        frame1 = Gtk.Frame(label="Theme Changer")
        
        grid1 = Gtk.Grid(row_spacing    = 10,
                         column_spacing = 10,
                         column_homogeneous = True)


        button1 = Gtk.Button(label="About")
        button1.set_hexpand(True)
        button1.connect("clicked", self.on_button1_clicked)

        button2 = Gtk.Button(label="Change Color Scheme")
        button2.set_hexpand(True)
        button2.connect("clicked", self.on_button2_clicked)
        
        button3 = Gtk.Button(label="Display Settings")
        button3.set_hexpand(True)
        button3.connect("clicked", self.on_button3_clicked)
        
        button4 = Gtk.Button(label="Hotkeys")
        button4.set_hexpand(True)
        button4.connect("clicked", self.on_button4_clicked)
        
        button5 = Gtk.Button(label="Exit")
        button5.set_hexpand(True)
        button5.connect("clicked", Gtk.main_quit)
        
        
        grid1.attach(button1, 0, 7, 1, 1)
        grid1.attach(button2, 1, 7, 1, 1)
        grid1.attach(button3, 2, 7, 1, 1)
        grid1.attach(button4, 3, 7, 1, 1)
        grid1.attach(button5, 0, 8, 1, 2)

        
        self.add(frame1)
        frame1.add(grid1)

    def on_button1_clicked(self, widget):
        print("User chose: About")
        subprocess.run(["xdg-open", "https://github.com/Ftamino/dotfiles"])

    def on_button2_clicked(self, widget):
        print("User chose: Change Color Scheme")
        win1.hide()
        win2.show_all()
        
    def on_button3_clicked(self, widget):
        print("User chose: Display Settings")
        subprocess.run(["arandr"])
        
    def on_button4_clicked(self, widget):
        print("User chose: Hotkey List")
        win1.hide()
        win3.show_all()

class MyWindow2(Gtk.Window):
    def __init__(self):
        super().__init__(title="Change Color Scheme")

        self.set_border_width(10)
        self.set_default_size(640, 300)
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_resizable(False)

        frame4 = Gtk.Frame(label="Change Color Scheme")

        grid4 = Gtk.Grid(row_spacing    = 10,
                         column_spacing = 10,
                         column_homogeneous = True)

        label0 = Gtk.Label(label="Change default theme.")
        label0.set_hexpand(True)
        
        label1 = Gtk.Label(label="Change default theme.")
        label1.set_hexpand(True)

        label2 = Gtk.Label()
        label3 = Gtk.Label()

        colorBtn0 = Gtk.RadioButton(label="Don't change")
        colorBtn0.connect("clicked", self.on_clicked, "Don't change")

        colorBtn1 = Gtk.RadioButton.new_with_label_from_widget(colorBtn0, label="Standart")
        colorBtn1.connect("clicked", self.on_clicked, "Standart")

        colorBtn2 = Gtk.RadioButton.new_with_label_from_widget(colorBtn1, label="Standart Solid")
        colorBtn2.connect("clicked", self.on_clicked, "StandartSolid")

        colorBtn3 = Gtk.RadioButton.new_with_label_from_widget(colorBtn2, label="Nord")
        colorBtn3.connect("clicked", self.on_clicked, "Nord")

        colorBtn4 = Gtk.RadioButton.new_with_label_from_widget(colorBtn3, label="Nord Solid")
        colorBtn4.connect("clicked", self.on_clicked, "NordSolid")

        colorBtn5 = Gtk.RadioButton.new_with_label_from_widget(colorBtn4, label="Solarized")
        colorBtn5.connect("clicked", self.on_clicked, "Solarized")

        colorBtn6 = Gtk.RadioButton.new_with_label_from_widget(colorBtn5, label="Solarized Solid")
        colorBtn6.connect("clicked", self.on_clicked,"SolarizedSolid")
        
        colorBtn7 = Gtk.RadioButton.new_with_label_from_widget(colorBtn6, label="Material You")
        colorBtn7.connect("clicked", self.on_materialyou_clicked)

        colorBtn12 = Gtk.Button(label="Back To Main Menu")
        colorBtn12.set_hexpand(True)
        colorBtn12.connect("clicked", self.on_colorBtn12_clicked)

        colorBtn13 = Gtk.Button(label="Exit")
        colorBtn13.set_hexpand(True)
        colorBtn13.connect("clicked", Gtk.main_quit)


        grid4.attach(label1,     0, 2, 4, 2)
        grid4.attach(label2,     0, 4, 4, 2)
        grid4.attach(colorBtn0,  0, 6, 1, 1)
        grid4.attach(colorBtn1,  1, 6, 1, 1)
        grid4.attach(colorBtn2,  2, 6, 1, 1)
        grid4.attach(colorBtn3,  3, 6, 1, 1)
        grid4.attach(colorBtn4,  0, 7, 1, 1)
        grid4.attach(colorBtn5,  1, 7, 1, 1)
        grid4.attach(colorBtn6,  2, 7, 1, 1)
        grid4.attach(colorBtn7,  3, 7, 1, 1)
        grid4.attach(label3,     0, 9, 4, 1)
        grid4.attach(colorBtn12, 0, 10, 2, 1)
        grid4.attach(colorBtn13, 2, 10, 2, 1)

        self.add(frame4)
        frame4.add(grid4)

    def on_clicked(self, widget, choice):
        if widget.get_active():
            state = "on"

            if choice == "Don't change":
               print ("Choice is 'don't change'")
            else:
               subprocess.run(["sed", "-i", 's/import Colors.*/import Colors.' + choice + '/g', home + "/.xmonad/xmonad.hs"])
               subprocess.run(["xmonad", "--restart"])
        else:
            print("Something else:", choice)

    def on_materialyou_clicked(self, widget):
        mat_you = 'kitty /bin/bash ~/.xmonad/material-you/material-you.sh '
        os.system(mat_you)
        

    def on_colorBtn12_clicked(self, widget):
        print("Back To Main Menu")
        win2.hide()
        win1.show_all()  
        
class MyWindow3(Gtk.Window):
    def __init__(self):
        super().__init__(title="Hotkey List")

        self.set_border_width(10)
        self.set_default_size(700, 300)
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_resizable(False)

        frame3 = Gtk.Frame(label="Hotkeys")

        grid3 = Gtk.Grid(row_spacing    = 10,
                         column_spacing = 10,
                         column_homogeneous = True)

        label0 = Gtk.Label(label="Open Terminal : Mod+T")
        label0.set_hexpand(True)
        
        label1 = Gtk.Label(label="Open Launcher : Mod+Y")
        label1.set_hexpand(True)

        label2 = Gtk.Label(label="Open Browser  :  Mod+C")
        label2.set_hexpand(True)
        
        label3 = Gtk.Label(label="Make a Screenshot : Print")
        label3.set_hexpand(True)
        
        label4 = Gtk.Label(label="Control Volume : Media Keys")
        label4.set_hexpand(True)
        
        label5 = Gtk.Label(label="Close active Window : Mod + Q")
        label5.set_hexpand(True)
        
        label6 = Gtk.Label(label="Toggle Fullscreen : Mod + F11")
        label6.set_hexpand(True)
        
        label7 = Gtk.Label(label="Restart xmonad : Mod + Z")
        label7.set_hexpand(True)
        
        colorBtn1 = Gtk.Button(label="Back To Main Menu")
        colorBtn1.set_hexpand(True)
        colorBtn1.connect("clicked", self.on_colorBtn1_clicked)

        colorBtn2 = Gtk.Button(label="Exit")
        colorBtn2.set_hexpand(True)
        colorBtn2.connect("clicked", Gtk.main_quit)

        
        grid3.attach(label0,  0, 6, 1, 1)
        grid3.attach(label1,  1, 6, 1, 1)
        grid3.attach(label2,  2, 6, 1, 1)
        grid3.attach(label3,  3, 6, 1, 1)
        grid3.attach(label4,  0, 7, 1, 1)
        grid3.attach(label5,  1, 7, 1, 1)
        grid3.attach(label6,  2, 7, 1, 1)
        grid3.attach(label7,  3, 7, 1, 1)
        grid3.attach(colorBtn1, 0, 10, 2, 1)
        grid3.attach(colorBtn2, 2, 10, 2, 1)

        self.add(frame3)
        frame3.add(grid3)

    def on_colorBtn1_clicked(self, widget):
        print("Back To Main Menu")
        win3.hide()
        win1.show_all()

win1 = MyWindow1()
win2 = MyWindow2()
win3 = MyWindow3()

win1.connect("destroy", Gtk.main_quit)
win2.connect("destroy", Gtk.main_quit)

win1.show_all()
Gtk.main()
