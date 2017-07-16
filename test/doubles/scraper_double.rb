# frozen_string_literal: true

require_relative 'job_post_double'

# Mocks the Scraper
module ScraperDouble
  def self.scrap_posts
    scrap_this_url
  end

  def self.scrap_this_url
    [JobPostDouble.new, JobPostDouble.new]
  end
end
