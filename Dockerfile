FROM ubuntu:20.04

USER root
RUN adduser -u 1000 exercise_user
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get remove ruby -y
RUN apt-get install git vim software-properties-common curl rbenv ruby-build ruby-dev nginx sudo nodejs npm -y
RUN apt-get upgrade ruby-build -y
RUN echo 'exercise_user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN mkdir -p /opt/developer_applicant_exercise/current
COPY . /opt/developer_applicant_exercise/current
RUN cp /opt/developer_applicant_exercise/current/simple_public_timeline/nginx/nginx.conf /etc/nginx/nginx.conf
RUN chown -R exercise_user:exercise_user /opt

USER exercise_user
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
RUN echo 'export GEM_HOME="/home/exercise_user/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

ENV PATH="$PATH:/home/exercise_user/.gem/ruby/2.7.0/bin"
RUN eval "$(rbenv init -)"
RUN rbenv install 2.7.4
RUN rbenv global 2.7.4
RUN gem install bundler --user-install
RUN rbenv rehash

WORKDIR /opt/developer_applicant_exercise/current
RUN bundle install --path /home/exercise_user/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems
RUN npm install

EXPOSE 80
ENTRYPOINT [ "sudo service nginx start && bundle exec ruby simple_public_timeline/twitter_timeline_app.rb" ]
