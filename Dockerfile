FROM colmap/colmap
ARG GROUPID=1000
ARG USERID=1000
ARG PROJECT_GROUP=appgrop
ARG PROJECT_USER=appuser

RUN apt-key del 7fa2af80 && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub && \
    apt-get update && \
    apt-get install -y python3-dev python3-pip ffmpeg

VOLUME ["/src"]
WORKDIR /src
COPy requirements.txt /src/requirements.txt

#RUN apt-get install -y ffmpeg
RUN groupadd -g ${GROUPID} ${PROJECT_GROUP}
RUN useradd -G ${PROJECT_GROUP} -r -m -u ${USERID} ${PROJECT_USER}
USER ${PROJECT_USER}

#RUN pip3 install --upgrade pip && pip3 install -r requirements.txt
#python3 scripts/colmap2nerf.py --video_in data/nerf/test/VideoNerf.mp4 --video_fps 2 --run_colmap --aabb_scale 32


# sudo docker run --gpus all -v $PWD:/src -w /src -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD/cache:/home/appuser/.cache -it instantngp bash