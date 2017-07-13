# frozen_string_literal: true

# The Scraper module scraps the job posting pages and returs an array of
# job posts from the last 7 days.
module Scraper
  require 'nokogiri'
  require 'open-uri'

  URLS = [ENV['PAGE_1'], ENV['PAGE_2'], ENV['PAGE_3']].freeze

  def self.scrap_posts
    posts = URLS.flat_map do |url|
      scrap_this_url(url)
    end

    posts.compact.sort { |d1, d2| d2.date <=> d1.date }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.scrap_this_url(url)
    page = Nokogiri::HTML(open(url))

    page.search('.product-listing-link-block').map do |post|
      date_txt = post.search('.product-listing-date').text
      date = Date.parse(date_txt)

      next if Date.today > date + 7

      title = post.search('.product-listing-h2 a').first

      job_title = title.text
      company = post.search('.category-tag a').first.text

      href = title.attr('href')

      desc = post.search('.product-listing-p p').first.text

      JobPost.new(job_title: job_title,
                  company: company,
                  date: date,
                  description: desc,
                  href: href)
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
