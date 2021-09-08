# frozen_string_literal: true
require_relative "./course_app/cli.rb"
require_relative "./course_app/course.rb"
require_relative "./course_app/scraper.rb"
require_relative "./course_app/version.rb"
require 'nokogiri'
require 'open-uri'


module CourseApp
  class Error < StandardError; end
  # Your code goes here...
end
