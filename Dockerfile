FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel


# Install system dependencies:
RUN pip install --progress-bar=off -U --no-cache-dir \
    nano \
    vim

# Cleanup system dependencies:
RUN apt-get -qq clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*


# Install pip dependencies:
COPY requirements.txt /tmp/requirements.txt
RUN pip install -U --no-cache-dir -r /tmp/requirements.txt


# Project root on storage will be mounted to /project:
WORKDIR /project
