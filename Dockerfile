# ======================================================
#
# Build image
#
# 	$ sudo docker build -t mu .
#
#
# Run container
#
# 	$ sudo docker run -i mu:latest
#
#
# SSH into container
#
# 	$ sudo docker exec -it mu:latest /bin/bash
#
# ======================================================


# Base image.

FROM ubuntu:18.04

LABEL name = "μ"
LABEL version="1.0"
LABEL description="Manufacturing Utility" 


# Update and upgrade linux systems within the container.

RUN apt-get update && apt-get install -y --no-install-recommends locales\
	software-properties-common \
    ca-certificates \
	git \
	make

# Adds openscad repository to the apt-get package manager.

RUN add-apt-repository ppa:openscad/releases


# Installs openscad.

RUN apt install -y openscad \
    && rm -rf /var/lib/apt/lists/*


# 

RUN mkdir -p /root/.local/share /.local/share


# Copy in python3 project src code.

COPY . home
WORKDIR /home/src


# Allows for unicode printing.

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'


# Allows commands like 'clear' to work properly.

ENV TERM=xterm


# Install python3 project using setup.py.

# RUN setup.py install


# Execute the command line interface.

CMD [ "python3", "-m", "src/muterm/cli.py" ]
