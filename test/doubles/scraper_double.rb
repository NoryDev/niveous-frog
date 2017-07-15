# frozen_string_literal: true

require_relative '../../lib/job_post'

# Mocks the Scraper
module ScraperDouble
  def self.scrap_posts
    scrap_this_url
  end

  def self.scrap_this_url
    [JobPost.new(job_title: 'job_title',
                 company: 'company',
                 date: Date.today,
                 description: 'description',
                 href: 'http://www.url.com'),
     JobPost.new(job_title: 'job_title_2',
                 company: 'company',
                 date: Date.today,
                 description: 'description',
                 href: 'http://www.url.com')]
  end
end
