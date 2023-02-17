#!/usr/bin/env python3
import gi
gi.require_version("Gdk", "3.0")
from gi.repository import Gdk

def count():
    gdkdsp = Gdk.Display.get_default()
    return gdkdsp.get_n_monitors()
