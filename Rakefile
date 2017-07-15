# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
  t.warning = false
end

desc 'scrap and send notification'
task :weekly_digest do
  require_relative 'app'
  require_relative 'lib/weekly_digest'

  WeeklyDigest.retrieve_and_send
end

desc 'Look for style guide offenses in your code'
task :rubocop do
  sh 'rubocop --format simple || true'
end

task default: %i[rubocop test]
