# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/weekly_digest'

class WeeklyDigestTest < Minitest::Test
  def test_inactive?
    WeeklyDigest.inactive?
  end

  def test_retrieve_and_send
    urls = [File.expand_path('../doubles/ad.html', __FILE__)]
    today = Date.today.strftime('%A').downcase.to_sym

    WeeklyDigest.retrieve_and_send(urls: urls,
                                   email: 'me@test.com',
                                   execution_day: today)

    assert_equal Mail::TestMailer.deliveries.length, 1

    Mail::TestMailer.deliveries.clear
  end
end
