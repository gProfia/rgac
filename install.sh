#!/bin/bash

#create virtual env to the project
VENV_PATH=$(pwd)
if [ "$?" -ne 0 ]; then
    echo "err1: could not set VENV_PATH";
    exit 1;
fi
#install venv dependency 
sudo apt-get install python3-venv -y
/usr/bin/python3 -m venv "$VENV_PATH";

#activate virtual env
source bin/activate

#install project dependencies
python -m pip install selenium
python -m pip install beautifulsoup4
python -m pip install webdriver-manager
python -m pip install pandas

deactivate

echo -e  "function rgac(){\n\tsource $VENV_PATH/bin/activate\n\tpython3 $VENV_PATH/rgac.py \"\$@\"\n\tdeactivate\n}"  >> ~/.bashrc
