#!/bin/bash

for g in 2;
do
    CUDA_VISIBLE_DEVICES=$g python ../examples/simple_trainer.py mcmc \
        --strategy.cap-max 2500000 \
        --max_steps 25000 \
        --eval_steps 30000 \
        --data_dir /home/zhusz/local/r/data6/remote_fastdata_2/tm/v/wriva/data/wriva/t01_v01_s08_r08_ImageDensity_A01_iPad_LTS \
        --data_factor 1 \
        --port $((8083+g)) \
        --result_dir /home/zhusz/local/r/tm/cache/play/oom/wriva/t01_v01_s08_r08_ImageDensity_A01_iPad_LTS_mcmc_"$HOSTNAME"_r"$g" \
        --tiles_total_cap 300000000;
done
# settting tiles_total_cap to 300_000_000 is the best fit for a 3090 GPU - making as little accuracy loss as possible, while making sure there will be no OOM occurring.
