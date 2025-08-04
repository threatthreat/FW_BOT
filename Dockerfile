FROM python:3.8-slim-buster

# Set environment to avoid some interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

# Create app directory
RUN mkdir /fwdbot
WORKDIR /fwdbot

COPY start.sh /start.sh

CMD ["/bin/bash", "/start.sh"]
