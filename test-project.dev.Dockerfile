FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt -qq update && apt-get -yqq dist-upgrade
RUN dpkg --configure -a
RUN apt-get install -yqq ruby-full
RUN gem install bundler:2.4.5

# Add ubuntu user.
RUN adduser --disabled-password --gecos '' ubuntu

# Run as ubuntu.
USER ubuntu

# Set the base home path.
ENV HOME_PATH /home/ubuntu
ENV INSTALL_PATH $HOME_PATH/test-project
ENV PATH $HOME_PATH/bundle/bin:$PATH

WORKDIR $HOME_PATH

RUN mkdir -p $INSTALL_PATH
RUN mkdir -p $HOME_PATH/bundle

WORKDIR $INSTALL_PATH

#COPY --chown=ubuntu:ubuntu Gemfile Gemfile
#COPY --chown=ubuntu:ubuntu Gemfile.lock Gemfile.lock

CMD ["bash"]
