# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/scraper'

class ScraperTest < Minitest::Test
  def test_scrap_this_url
    url = File.expand_path('../doubles/ad.html', __FILE__)

    first_result = Scraper.scrap_this_url(url).first

    assert_equal first_result.job_title, 'Job Title'
    assert_equal first_result.href, 'http://www.test-size.com/full-post/'
    assert_equal first_result.company, 'Company'
    assert_equal first_result.description, 'Mini job description.'
    assert_equal first_result.date, Date.parse('July 15, 2017')
  end

  def test_scrap_posts
    urls = [File.expand_path('../doubles/ad.html', __FILE__),
            File.expand_path('../doubles/ad.html', __FILE__)]

    result = Scraper.scrap_posts(urls)

    assert_equal result.size, 2
    assert_equal result.first.job_title, result.last.job_title
  end
end
