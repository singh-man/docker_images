FROM ubuntu:20.04
LABEL maintainer="Manish Singh"

ADD ./install /opt/install

#User root
RUN apt update -y && apt upgrade -y

#TZdata to run in this way for non-interactive; tzdata needed by openssh-server
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC 
RUN apt-get -y install tzdata
RUN apt install openssh-client openssh-server -y
RUN apt install git curl wget unzip zip -y
RUN apt install clang -y
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash - && \
    apt-get install -y nodejs
RUN sh -c '/opt/install/40-neovim.sh'

RUN cd /opt && \
    curl -L https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz -s -o /opt/a.tar.gz && \
    tar -xzf /opt/a.tar.gz && \
    rm /opt/a.tar.gz && \
    echo "alias nvim='/opt/nvim-linux64/bin/nvim'" >> ~/myAlias && \
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
    cd -

#Get singh-man IDE plugin setup
RUN mkdir -p ~/.config/nvim && \
    git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim && \
    #nvim --headless PlugInstall +q

#MISC tools
#RUN apt install git nmap unzip zip wget curl ripgrep python3 python3-pip elinks maxima pandoc poppler-utils nnn trash-cli sxiv -y
#RUN apt-get install software-properties-common -y && \
#    add-apt-repository ppa:lazygit-team/release -y && \
#    apt-get update -y && \
#    apt-get install lazygit -y

# RUN curl -s "https://get.sdkman.io" | bash && \
#     source "$HOME/.sdkman/bin/sdkman-init.sh" && \
#     sdk install java 11.0.12-open && \
#     sdk install maven 3.6.3
 
RUN echo "source ~/myAlias" >> ~/.bashrc
RUN apt autoremove
# CMD ["echo use 'docker run --rm -it -u $(id -u ${USER}):$(id -g ${USER}) -v <src>:<dest> su' do remember to volume mount the dirs as needed!!"]
