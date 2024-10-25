#!/bin/bash

for g in 1;
do
    CUDA_VISIBLE_DEVICES=$g python ../examples/simple_trainer.py mcmc \
        --strategy.cap-max 2500000 \
        --max_steps 25000 \
        --eval_steps 30000 \
        --data_dir /home/zhusz/local/r/data6/remote_fastdata_2/tm/v/wriva/data/wriva/t01_v01_s08_r08_ImageDensity_A01_iPad_LTS \
        --data_factor 1 \
        --port $((8083+g)) \
        --result_dir /home/zhusz/local/r/tm/cache/play/oom/wriva/t01_v01_s08_r08_ImageDensity_A01_iPad_LTS_mcmc_"$HOSTNAME"_r"$g";
done
