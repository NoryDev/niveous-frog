# frozen_string_literal: true

require 'rake/testtask'
require_relative 'app'

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
end

desc 'scrap and send notification'
task :weekly_digest do
  next if WeeklyDigest.inactive?

  WeeklyDigest.retrieve_and_send
end

desc 'Look for style guide offenses in your code'
task :rubocop do
  sh 'rubocop --format simple || true'
end

task default: %i[rubocop test]
