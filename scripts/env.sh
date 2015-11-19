#!/bin/bash
export RAILS_ENV="production"
source /etc/profile.d/ruby.sh
source /home/openproject/.profile

# Execute the commands passed to this script
# e.g. "./env.sh bundle exec rake
exec $@
