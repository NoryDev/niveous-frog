# frozen_string_literal: true

require_relative 'scraper'
require_relative 'notifier'

# WeeklyDigest is the executor: scrap the posts and email them
module WeeklyDigest
  DAYS = %i[monday tuesday wednesday thursday friday saturday sunday].freeze

  def self.retrieve_and_send(urls: ENV['PAGE'].split, email: ENV['MY_EMAIL'],
                             execution_day: :thursday)
    return if inactive?(execution_day)

    posts = Scraper.scrap_posts(urls)

    Notifier.email_me(posts, email)
  end

  def self.inactive?(execution_day = :thursday)
    today = DAYS.find { |day| day == execution_day }
    raise 'Invalid day' if today.nil?

    ENV['INACTIVE'] || !Date.today.public_send("#{execution_day}?")
  end
end
