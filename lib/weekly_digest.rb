# frozen_string_literal: true

# WeeklyDigest is the executor: scrap the posts and email them
module WeeklyDigest
  def self.retrieve_and_send
    posts = Scraper.scrap_posts

    Notifier.email_me(ENV['MY_EMAIL'], posts)
  end

  def self.inactive?
    ENV['INACTIVE'] || !Date.today.thursday?
  end
end
