#!/usr/bin/python3

#from itertools import takewhile
#from pprint import pprint

import i3ipc # https://github.com/acrisci/i3ipc-python
import sys

from urllib3 import Retry
i3 = i3ipc.Connection()

def det_gap():
    i3.command('gaps left current set 640')
    i3.command('gaps right current set 640')

def remove_gaps():
    i3.command('gaps left current set 0')
    i3.command('gaps right current set 0')    

if(sys.argv[1] == 'on'):
    det_gap()
       
if(sys.argv[1] == 'off'):
    remove_gaps()