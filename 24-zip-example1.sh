#!/bin/bash

DIRECTORY=' /tmp/applogs'          # directory to be zipped
ZIPFILE='output.zip'
zip -r $ZIPFILE $DIRECTORY

