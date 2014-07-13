#!/bin/bash

hexdump -ve '1/1 "%.2x\n"' $1 > $1.hexdump
