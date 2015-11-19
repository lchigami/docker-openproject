#!/bin/bash
export RAILS_ENV="production"
source /etc/profile.d/ruby.sh
echo "export SECRET_KEY_BASE=`./bin/rake secret`" >> ~/.profile
source ~/.profile

# Execute the commands passed to this script
# e.g. "./env.sh bundle exec rake
exec $@
