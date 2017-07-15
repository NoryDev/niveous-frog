# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/notifier'
require_relative 'doubles/scraper_double'

class NotifierTest < Minitest::Test
  def test_email_me_sends_email
    Notifier.email_me(ScraperDouble.scrap_posts, 'me@test.com')

    assert_equal Mail::TestMailer.deliveries.length, 1

    Mail::TestMailer.deliveries.clear
  end

  def test_email_me_sends_correct_email
    Notifier.email_me(ScraperDouble.scrap_posts, 'me@test.com')

    mail = Mail::TestMailer.deliveries.first

    assert_includes mail.to, 'me@test.com'
    assert_includes mail.body.raw_source, 'company'
    assert_includes mail.body.raw_source, 'job_title'

    Mail::TestMailer.deliveries.clear
  end
end
