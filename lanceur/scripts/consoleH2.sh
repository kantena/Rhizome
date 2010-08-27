#!/bin/sh
cp=/home/kantena/rhizome/lanceur/lib/h2.jar


java -cp "$cp" org.h2.tools.Console $@ &

