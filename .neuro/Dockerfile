FROM neuromation/base:latest
# You can also use any other image:
#FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel


# Install system dependencies:
RUN apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ssh \
        nano \
        vim

# Install pip dependencies:
RUN pip install -U --no-cache-dir \
        jupyter \ 
        tqdm


# Project root on storage will be mounted to /project:
WORKDIR /project
