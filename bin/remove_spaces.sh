#!/bin/bash

MDIR=$1
echo $DIR
for file in $MDIR/*
do 
  newname=$(echo $file | tr [:blank:] _)
  echo $newname
  mv "$file" $newname
done

