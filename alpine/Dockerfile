# docker build --target nvim -t sa .
# docker build -t sa .
FROM node:17-alpine AS nvim
LABEL maintainer="Manish Singh"

RUN apk add --update bash git curl util-linux
RUN apk add neovim
# Neovim setup
# RUN cd /opt && \
#     curl -L https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz -s -o /opt/a.tar.gz && \
#     tar -xzf /opt/a.tar.gz && \
#     rm /opt/a.tar.gz && \
#     echo "alias nvim='/opt/nvim-linux64/bin/nvim'" >> ~/myAlias && \
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
    cd -
 
#Get singh-man IDE plugin setup
RUN mkdir -p ~/.config/nvim && \
    git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim
# RUN nvim --headless PlugInstall +q

FROM nvim
RUN apk update && apk upgrade
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
