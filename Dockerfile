FROM ubuntu:16.04

ENV HOME /root
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y \
      automake \
      autoconf \
      curl \
      git \
      libreadline-dev \
      libncurses-dev \
      libssl-dev \
      libyaml-dev \
      libxslt-dev \
      libffi-dev \
      libtool \
      make \
      unixodbc-dev \
      unzip \
      wget \
      locales \
      ssh

# Setup SSH
RUN mkdir -p $HOME/.ssh && \
    touch $HOME/.ssh/known_hosts && \
    ssh-keygen -t rsa -N '' -C '' -f $HOME/.ssh/id_rsa && \
    cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0
ENV PATH $HOME/.asdf/bin:$HOME/.asdf/shims:$PATH
RUN echo '\nPATH='$PATH >> $HOME/.profile

# Install Erlang
ENV ERLANG_VERSION 20.0
RUN asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang $ERLANG_VERSION && \
    asdf global erlang $ERLANG_VERSION

# Install Elixir
ENV ELIXIR_VERSION 1.5.0-otp-20
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir $ELIXIR_VERSION && \
    asdf global elixir $ELIXIR_VERSION

# Remove VM locale warning
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# Create App folder
COPY . /var/src/app
WORKDIR /var/src/app
RUN chmod +x ./entrypoint.sh

EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]
