ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get update
RUN apt -y install gnupg2
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN bash -c "echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list"
RUN apt -y update
RUN apt -y install google-chrome-stable
RUN apt -y install ffmpeg

USER $NB_UID
RUN pip install selenium fake-useragent ffmpeg-python wget