#!/bin/bash
if [ "$1" == "build" ]
then
  flutter pub run build_runner build --delete-conflicting-outputs
else
  flutter pub run build_runner watch --delete-conflicting-outputs
fi