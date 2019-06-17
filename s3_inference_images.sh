#!/bin/bash

# -- 1. Move trained weight file to weights/yolo_trained.ckpt
mv checkpoints/yolov3_ckpt_100.pth weights/yolo_trained.pth 2>/dev/null || :

# -- 2. Select one of the 3 data sources by commenting out the other two

# data_source="webcam"
# image_data_path="none"

# data_source="folder"
# image_data_path="data/custom1_eval/"

data_source="video"
image_data_path="data/custom1_eval/video.avi"

# -- 3. Start detecting

python src/detect_images.py \
    --weights_path "weights/yolo_trained.pth" \
    --conf_thres 0.9 \
    --nms_thres 0.3 \
    --batch_size 1 \
    --data_source $data_source \
    --image_data_path $image_data_path