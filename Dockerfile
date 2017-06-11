# Dockerfile  
FROM consol/ubuntu-xfce-vnc

ENV DEBIAN_FRONTEND noninteractive  
RUN apt-get update && apt-get install -y unzip sudo libgtk2.0-0 libgconf2-4 libnss3 \  
            libasound2 libxtst6 libcanberra-gtk-module libgl1-mesa-glx && rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update
RUN sudo apt-get install curl

RUN sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN sudo apt-get update
RUN sudo apt-get install code # or code-insiders

RUN adduser --disabled-login --uid 1000 \--gecos 'dummy' dummy
