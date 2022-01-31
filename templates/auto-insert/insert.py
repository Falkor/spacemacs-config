#!/usr/bin/env python3
# Time-stamp: <>
###############################################################################
### %f
### Author: %U %a
###
### Copyright (c) %y %U %a
### .             %o
###
###############################################################################

""" %@ """

import argparse
import datetime
import socket
import sys
import os


def main():
    ''' Main - command line argument parser and workflow execution '''

    # Parse command line arguments
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter,
                                     epilog='The UL HPC Management team <hpc-sysadmins@uni.lu> | http://hpc.uni.lu')
    parser.add_argument('-v', '--verbose', action='count', default=0, help='Set verbose mode, print debug messages.')
    parser.add_argument('-o', '--outfile', default=sys.stdout, type=argparse.FileType('w'), help="Output file")
    args = parser.parse_args()

if __name__ == '__main__':
    ''' Dispatch actual execution to main method '''
    main()
