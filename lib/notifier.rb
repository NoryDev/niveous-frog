# frozen_string_literal: true

# Send the job posts by email
class Notifier
  require 'mail'

  extend ErbRender

  def self.email_me(email_address, job_posts)
    email_body = erb :index, locals: { job_posts: job_posts }
    Mail.deliver do
      to email_address
      from 'alert@awesomescrapper.com'
      subject "#{ENV['SITE_NAME']} weekly digest"
      content_type 'text/html; charset=UTF-8'
      body email_body
    end
  end
end
