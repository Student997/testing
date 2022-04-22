#!/bin/bash
################################################################################
# This is a script for generating an installable app package

set -e   # Stop script on errors


# Set up build variables
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SRC_DIR=$SCRIPT_DIR/
PACKAGE_DIR=$SCRIPT_DIR/dist

rm -rf $PACKAGE_DIR/*
mkdir -p $PACKAGE_DIR

# Include the HEAD commit id in the package name
COMMIT_ID=`git rev-parse --short=6 HEAD`

##############################################################################
# Build the main SCADAfence-Fortinet app
FULL_APP_FOLDER="Test_Package"
FULLAPP_DIR=$PACKAGE_DIR/$FULL_APP_FOLDER
mkdir $FULLAPP_DIR
cp -R $SRC_DIR/README.md $FULLAPP_DIR/

# Creating a zip
cd $PACKAGE_DIR
tar -czvf $PACKAGE_DIR/$FULL_APP_FOLDER-${COMMIT_ID}.tgz $FULL_APP_FOLDER
rm -rf $FULLAPP_DIR
