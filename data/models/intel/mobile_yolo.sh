#!/bin/bash
# ==============================================================================
# Copyright (C) 2018-2019 Intel Corporation
#
# SPDX-License-Identifier: MIT
# ==============================================================================

set -e

#BASEDIR=$(dirname "$0")/../..
#if [ -n ${FFVA_SAMPLES_DIR} ]
#then
#    source $BASEDIR/scripts/setup_env.sh
#fi
source setup_env.sh
source setlocale.sh

#import GET_MODEL_PATH
#source $BASEDIR/scripts/path_extractor.sh

MODEL=mobile_yolo

DEVICE=HDDL

#DETECT_MODEL_PATH=./yolov3_coco_newversion

#if [ -z ${1} ]; then
#  echo "ERROR set path to video"
#  echo "Usage: ./object_detection_ssd.sh <path/to/your/video/sample>"
#  exit
#fi

#FILE=./1.mp4

#ffmpeg -flags unaligned -hwaccel vaapi -hwaccel_output_format vaapi -hwaccel_device /dev/dri/renderD128 \
ffmpeg -i 1.mp4 \
-vf "detect=model=mobile_yolo.xml:model_proc=mobile_yolo.json:device=$DEVICE: \
nireq=48:threshold=0.5:interval=1:batch_size=1:async_preproc=1,ocv_overlay, \
metaconvert=converter=json:method=all:source=1.mp4" \
-f metapublish -output_format batch mobile_yolo.json 
#-y output.h264 \
#-f iemetadata -y yolov3_coco_newversion_result.json
#-an -f null -
