# docker build --target sunvim -t sunvim .
# docker build --target su -t su .
FROM node:17 as sunvim
LABEL maintainer="Manish Singh"

#TZdata to run in this way for non-interactive; tzdata needed by openssh-server
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC 
# RUN apt-get -y install tzdata # not needed for node image

ARG NVIM_VERSION=v0.6.1
ARG NVIM_PATH=/opt/nvim-linux64/bin/nvim
# Neovim setup
RUN cd /opt && \
    curl -L https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-linux64.tar.gz -s -o /opt/a.tar.gz && \
    tar -xzf /opt/a.tar.gz && \
    rm /opt/a.tar.gz && \
    echo "alias nvim='${NVIM_PATH}'" >> ~/myAlias && \
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
    cd -

#Get singh-man IDE plugin setup
RUN mkdir -p ~/.config/nvim && \
    git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim
RUN sh -c '${NVIM_PATH} --headless +PlugInstall +qall'
RUN echo "source ~/myAlias" >> ~/.bashrc
RUN useradd manish
RUN usermod -a -G root,manish manish
RUN apt autoremove
CMD [ "nvim" ]
RUN echo "DO --> PlugInstall after nvim and install lsp's as needed"
RUN echo "use to run as host user -->  'docker run --rm -it --user=\"$(id -u):$(id -g)\" -v <src>:<dest> sunvim bash' do remember to volume mount the dirs as needed!!"

FROM sunvim as su
#User root
RUN apt update -y && apt upgrade -y
#MISC tools
RUN apt install openssh-client openssh-server -y
# RUN apt install clang -y
RUN apt install git nmap unzip zip wget curl ripgrep python3 python3-pip elinks maxima pandoc poppler-utils nnn trash-cli sxiv -y
RUN apt-get install software-properties-common -y && \
    add-apt-repository ppa:lazygit-team/release -y && \
    apt-get update -y && \
    apt-get install lazygit -y

RUN curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install java 11.0.12-open && \
    sdk install maven 3.6.3
 
RUN echo "source ~/myAlias" >> ~/.bashrc
#Add user and add to groups
RUN useradd manish
RUN usermod -a -G root,manish manish
RUN apt autoremove
RUN echo "use to run as host user -->  'docker run --rm -it --user=\"$(id -u):$(id -g)\" -v <src>:<dest> su' do remember to volume mount the dirs as needed!!"
CMD [bash]
