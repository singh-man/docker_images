#docker build -f Dockerfile --rm --force-rm -t singh/fedora/full .
FROM fedora:36
LABEL maintainer="Manish Singh"

ADD ./ /opt
RUN dnf update -y && dnf upgrade -y
RUN dnf install gcc -y
RUN dnf install findutils -y

RUN dnf install git nmap unzip zip wget curl ripgrep python3-pip elinks maxima pandoc poppler-utils ffmpeg-free.x86_64 nnn trash-cli sxiv -y
RUN curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
RUN pip install pytest
RUN dnf install nodejs -y

RUN sh -c '/opt/install/40-neovim.sh'
RUN echo "source ~/myAlias" >> ~/.bashrc
RUN sh -c '/opt/install/50-sdkman.sh'
RUN dnf clean all
