require 'yaml'

APP_DATA = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'application.yml'))
