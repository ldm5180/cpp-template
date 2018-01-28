FROM ubuntu:17.10
MAINTAINER Lenny Maiorani <lenny@colorado.edu>
ENV LLVM_VERSION=5.0

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget && rm -rf /var/lib/apt/lists/*
RUN wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|apt-key add - && \
    echo "deb http://llvm.org/apt/artful/ llvm-toolchain-artful-${LLVM_VERSION} main" >> /etc/apt/sources.list.d/llvm.list 

RUN apt-get update && apt-get -y --no-install-recommends install \
  aptitude \
  bash-completion \
  build-essential \
  ccache \
  clang-5.0 \
  clang-format-5.0 \
  clang-tidy-5.0 \
  clang-tools-5.0 \
  cmake \
  cmake-curses-gui \
  coreutils \
  emacs \
  gcc \
  g++ \
  gdb \
  git-all \
  htop \
  less \
  libbz2-dev \
  libc++-dev \
  libc++1 \
  libc++abi-dev \
  libc++abi1 \
  liblld-5.0 \
  libllvm5.0 \
  lld-5.0 \
  llvm-5.0-tools \
  python \
  python-dev \
  python-pip \
  python-software-properties \
  ssh \
  software-properties-common \
  tmux \
  tree \
  unzip \
  vim \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.bash && cd /root/.bash && wget https://github.com/jimeh/git-aware-prompt/archive/master.zip && \
  unzip master.zip && \
  echo "export GITAWAREPROMPT=~/.bash/git-aware-prompt-master" >> /root/.bashrc && \
  echo 'source "${GITAWAREPROMPT}/main.sh"' >> /root/.bashrc && \
  echo 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]docker\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> /root/.bashrc && \
  rm -f master.zip && \
  echo "export TERM=xterm-256color" >> /root/.bashrc

RUN echo "cd $HOME" >> /root/.bashrc

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang-5.0 40
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-5.0 40
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN printf "unbind C-b\nset -g prefix C-a\nbind a send-prefix\nunbind r\nbind r source-file ~/.tmux.conf\nbind-key C-a 'last-window'\nset -g history-limit 50000\nset -g set-titles on\n" > /root/.tmux.conf

COPY .emacs /root/.emacs
RUN mkdir /root/.emacs-files \
  && wget -O - https://raw.githubusercontent.com/ldm5180/modern-cpp-font-lock/master/modern-cpp-font-lock.el >> /root/.emacs-files/modern-cpp-font-lock.el \
  && wget -O - https://raw.githubusercontent.com/ldm5180/modern-cpp-font-lock/master/gtest-cpp-font-lock.el >> /root/.emacs-files/gtest-cpp-font-lock.el

# Make bash the default shell (useful for when using tmux in the container)
RUN chsh --shell /bin/bash root