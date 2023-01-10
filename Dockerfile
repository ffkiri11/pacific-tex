# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN apt-get update 
RUN apt-get install -y --download-only locales texlive-xetex
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install -y texlive-xetex
RUN apt-get install -y texlive-fonts-extra
RUN apt-get install -y fonts-cmu
RUN  rm -rf /var/lib/apt/lists/*
CMD cd /mnt && xelatex index.latex

