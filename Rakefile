# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"
require_relative "./config/environment"
require 'sinatra/activerecord/rake'

RuboCop::RakeTask.new

task default: :rubocop
