#!/bin/bash
sudo service nginx start
bundle exec ruby /opt/developer_applicant_exercise/current/simple_public_timeline/lib/twitter_timeline_app.rb
sleep infinity