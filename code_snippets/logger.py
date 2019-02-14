#!/usr/bin/env python
import sys

# >>> from logger import Logger
# >>> log = Logger()
# >>> log.open('log.train.txt')
# >>> log.write('** training log start **\n')
# ** training log start **
# >>> log.write('** training log end **\n')
# ** training log end **

class Logger(object):
    def __init__(self):
        self.terminal = sys.stdout 
        self.file = None

    def open(self, file, mode='w'):
        self.file = open(file, mode)

    def write(self, message, is_terminal=True, is_file=True):
        if '\r' in message: is_file = False

        if is_terminal:
            self.terminal.write(message)
            self.terminal.flush()

        if is_file:
            self.file.write(message)
            self.file.flush()

    def flush(self):
        # this flush method is needed for python 3 compatibility.
        # this handles the flush command by doing nothing.
        # you might want to specify some extra behavior here.
        pass
        