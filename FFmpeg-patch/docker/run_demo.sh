set -e

export DATA_PATH=~/ffva/data
cd ~/ffva/data/models/intel/

cat yolov3_coco_model.tar.gz* | tar zvxf -

cd ~/ffva/FFmpeg-patch/docker/

sudo ./run_docker_container.sh --video-examples-path=$DATA_PATH/video --intel-models-path=$DATA_PATH/models/intel --models-path=$DATA_PATH/models/common --image-name=lgz235/ffmpeg-video-analytics-package:v1.2
