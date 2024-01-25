#!/bin/bash
echo "file name:"
read filename
echo "enter path of file:"
read path
cd $path
ls -l | grep $filename
