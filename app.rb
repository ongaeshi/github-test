# -*- coding: utf-8 -*-
#
# @file 
# @brief
# @author ongaeshi
# @date   2011/06/25

require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?
require 'haml'
require 'sass'

$LOAD_PATH.unshift 'lib'
require 'github-test/hello'

set :haml, :format => :html5

helpers do
  alias h escape_html
end

get '/' do
  # GithubTest::Hello.new.hello
  haml :index
end

get '/*.css' do |path|
  scss path.to_sym
end

get '/*.html' do |path|
  pass unless File.exist?(File.join(options.views, "#{path}.haml"))
  haml path.to_sym
end

