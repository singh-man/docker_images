#docker build -f Dockerfile --rm --force-rm -t singh/fedora/full .
FROM fedora:36 AS sfbase
LABEL maintainer="Manish Singh"

ADD ./ /opt
RUN dnf update -y && dnf upgrade -y
RUN dnf install gcc -y
RUN dnf install findutils git -y
RUN dnf install nodejs python3-pip -y
RUN pip install pytest
RUN dnf clean all

FROM sfbase AS nvim
# RUN sh -c '/opt/install/40-neovim.sh'
RUN dnf install neovim python3-neovim -y
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN mkdir -p ~/.config/nvim && \
    git clone https://github.com/singh-man/nvim-IDE.git ~/.config/nvim
#nvim --headless --cmd +PlugInstall +q
RUN dnf clean all

FROM sfbase AS utils
RUN dnf install iputils nmap unzip zip wget curl ripgrep elinks maxima pandoc poppler-utils ffmpeg-free.x86_64 nnn trash-cli sxiv -y
RUN curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
RUN dnf clean all

FROM sfbase AS java
RUN echo "source ~/myAlias" >> ~/.bashrc
RUN sh -c '/opt/install/50-sdkman.sh'
RUN dnf clean all
