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
        super().__init__(title="Logout")

        self.set_border_width(10)
        self.set_default_size(640, 100)
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_resizable(False)

        frame1 = Gtk.Frame(label="Logout")
        
        grid1 = Gtk.Grid(row_spacing    = 10,
                         column_spacing = 10,
                         column_homogeneous = True)


        button1 = Gtk.Button(label="Shutdown")
        button1.set_hexpand(True)
        button1.connect("clicked", self.on_button1_clicked)

        button2 = Gtk.Button(label="Restart")
        button2.set_hexpand(True)
        button2.connect("clicked", self.on_button2_clicked)
        
        button3 = Gtk.Button(label="Logout")
        button3.set_hexpand(True)
        button3.connect("clicked", self.on_button3_clicked)
        

        
        grid1.attach(button1, 0, 7, 1, 1)
        grid1.attach(button2, 1, 7, 1, 1)
        grid1.attach(button3, 2, 7, 1, 1)


        
        self.add(frame1)
        frame1.add(grid1)

    def on_button1_clicked(self, widget):
        subprocess.run(["shutdown", "now"])

    def on_button2_clicked(self, widget):
        subprocess.run(["restart", "now"])
        
    def on_button3_clicked(self, widget):
        subprocess.run(["killall", "xmonad"])
        

win1 = MyWindow1()


win1.connect("destroy", Gtk.main_quit)


win1.show_all()
Gtk.main()
