#!/bin/bash -e

OTS_IMG_TAG="$GO_PIPELINE_LABEL-$GO_STAGE_COUNTER"
sh docker-image-build.sh $OTS_ENV $OTS_IMG_TAG

