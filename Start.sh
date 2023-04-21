#!/bin/bash

echo $(chmod +x bandithelper.sh)

directory=echo $(pwd)

echo -e $(gnome-terminal -- /bin/bash -c "cd $pwd;./bandithelper.sh")