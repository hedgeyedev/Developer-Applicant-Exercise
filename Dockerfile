FROM ubuntu:20.04

USER root
RUN adduser -u 1000 exercise_user
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get remove ruby -y
RUN apt-get install git vim software-properties-common curl ruby-build rbenv ruby-dev -y

RUN mkdir -p /opt/developer_applicant_exercise/current
COPY . /opt/developer_applicant_exercise/current
RUN chown -R exercise_user:exercise_user /opt

USER exercise_user
RUN mkdir -p "$(rbenv root)"/plugins
# RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
RUN echo 'export PATH="~/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
RUN echo 'export GEM_HOME=~/.ruby/' >> ~/.bashrc
RUN echo 'export PATH="$PATH:~/.ruby/bin"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

ENV PATH="/home/exercise_user/.rbenv/plugins/ruby-build/bin:$PATH"
ENV GEM_HOME=/home/exercise_user/.ruby/
ENV PATH="$PATH:/home/exercise_user/.ruby/bin"
RUN eval "$(rbenv init -)"
RUN rbenv install 3.0.2
RUN rbenv global 3.0.2
RUN gem install bundler
RUN rbenv rehash

WORKDIR /opt/developer_applicant_exercise/current
RUN bundle install

EXPOSE 5000
