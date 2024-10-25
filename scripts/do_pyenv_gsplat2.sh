#!/bin/bash

# do this script under the gsplat2 python env!
# gsplat2 can only be running with python 3.12 or lower!
# Usage:
#   sudo apt update
#   sudo apt install libglm-dev
#   conda create -n gsplat2 python=3.12
#   conda activate gsplat2
#   bash do_pyenv_gsplat2.sh


if [[ $(which python | awk -F'/' '{print $(NF-2)}') != "gsplat2" ]]; then
    echo "Please use the gsplat2 pyenv!"
    exit 1
else
    echo "Working on the gsplat2 pyenv"
fi

pip install gsplat
pip uninstall gsplat  # this is to make sure we use this modified version of the gsplat, while still keep all the other packages other than "gsplat"

pip install -r /home/zhusz/local/r/gsplat_no_oom/examples/requirements.txt
pip install -U torchmetrics  # force to the newer version for torchmetrics.image utilities

ENVLIB_DIR=/home/zhusz/local/Installations/anaconda3/envs/gsplat2/lib
rm $ENVLIB_DIR/libstdc++.so.6.0.29
rm $ENVLIB_DIR/libstdc++.so.6
rm $ENVLIB_DIR/libstdc++.so
ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.33 $ENVLIB_DIR/libstdc++.so.6
ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.33 $ENVLIB_DIR/libstdc++.so
