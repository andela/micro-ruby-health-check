## Micro Ruby Health Check
This is a Gem file to implement Health Checks on Ruby Services
## Installation
run `gem install bundler`
Write a Gem file and add this line `gem 'health', :git=> "https://github.com/andela/micro-ruby-health-check.git", :tag => "v1.0.0"` then run `bundle install`
## Background information
it is important to `require bundler/setup` in your ruby file for ruby to discover gems installed from github.