#!/usr/bin/env python3
from os.path import dirname, basename, isfile
import glob
modules = glob.glob(dirname(__file__)+"/*.py") # All modules (.py) in this directory (dirname) where '__file__' refers to THIS file.
__all__ = [ basename(f)[:-3] for f in modules if isfile(f) and not f.endswith('__init__.py')]