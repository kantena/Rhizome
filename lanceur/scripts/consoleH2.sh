#!/bin/sh
cp=lib/h2.jar


java -cp "$cp" org.h2.tools.Console $@ &

