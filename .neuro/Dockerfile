FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

# Install system dependencies:
RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends \
        nano \
        vim

# Install pip dependencies:
RUN pip install -U --no-cache-dir \
        tqdm \
        numpy


# Project root on storage will be mounted to /project:
WORKDIR /project
