# docker build -t sf .
FROM node:alpine
LABEL maintainer="Manish Singh"

RUN apk update && apk upgrade
RUN apk add --update bash git curl util-linux 
#MISC tools
RUN apk add openssh-client openssh-server
RUN apk add git nmap unzip zip wget curl ripgrep elinks poppler-utils nnn trash-cli sxiv
RUN apk add python3 py3-pip && pip3 install pytest
# RUN apk add pandoc maxima
# RUN apk-get install software-properties-common -y && \
#     add-apk-repository ppa:lazygit-team/release -y && \
#     apk-get update -y && \
#     apk-get install lazygit -y
 
RUN apk add ffmpeg
RUN apk add openjdk11
RUN apk add maven
RUN echo "source ~/myAlias" >> ~/.bashrc
#Add user and add to groups to run with local volume mount
# RUN adduser -S manish -u 1000 -G users
# RUN adduser -S msingh -G users
RUN echo "change the users as needed --> docker run --rm --user=\"$(id -u):$(id -g)\" -t sa"
CMD ["bash"]
