FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel


# ==================================================================
# Install system dependencies:
# ------------------------------------------------------------------
RUN apt-get -qq update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ssh \
        nano \
        vim


# ==================================================================
# Install pip dependencies
# ------------------------------------------------------------------
RUN pip install -U --no-cache-dir \
        tqdm \
        numpy


# ==================================================================
# Set up SSH for remote debug
# ------------------------------------------------------------------

# Setup environment for ssh session
RUN apt-get install -y --no-install-recommends openssh-server && \
 echo "export PATH=$PATH" >> /etc/profile && \
 echo "export LANG=$LANG" >> /etc/profile && \
 echo "export LANGUAGE=$LANGUAGE" >> /etc/profile && \
 echo "export LC_ALL=$LC_ALL" >> /etc/profile && \
 echo "export PYTHONIOENCODING=$PYTHONIOENCODING" >> /etc/profile

# Create folder for openssh fifos
RUN mkdir -p /var/run/sshd

# Disable password for root
RUN sed -i -re 's/^root:[^:]+:/root::/' /etc/shadow
RUN sed -i -re 's/^root:.*$/root::0:0:System Administrator:\/root:\/bin\/bash/' /etc/passwd

# Permit root login over ssh
RUN echo "Subsystem    sftp    /usr/lib/sftp-server \n\
PasswordAuthentication yes\n\
ChallengeResponseAuthentication yes\n\
PermitRootLogin yes \n\
PermitEmptyPasswords yes\n" > /etc/ssh/sshd_config

# ssh port
EXPOSE 22


# ==================================================================
# Cleanup
# ------------------------------------------------------------------
RUN apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*


# Project root on storage will be mounted to /project:
WORKDIR /project
