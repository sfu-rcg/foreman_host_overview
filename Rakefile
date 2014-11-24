# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = 'foreman_host_overview'
  gem.authors = ["Riley Shott"]
  gem.email = 'rshott@sfu.ca'
  gem.homepage = "https://github.com/sfu-rcg/foreman_host_overview.git"
  gem.license = 'GPL-3'
  gem.summary = %Q{Modifies the properties table for all hosts in the Foreman}
  gem.description = %Q{Extends the properties table for a host to include VNC & RDP links, as well as the host's certificate name}
  gem.required_ruby_version = '>= 2.0.0'
end

task :default => :test
