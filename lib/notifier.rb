# frozen_string_literal: true

require_relative 'erb_render'

# Send the job posts by email
class Notifier
  require 'mail'

  extend ErbRender

  def self.email_me(job_posts, email_address = ENV['MY_EMAIL'])
    email_body = erb :index, locals: { job_posts: job_posts }
    Mail.deliver do
      to email_address
      from 'alert@niveous-frog.com'
      subject 'Niveous Frog: weekly digest'
      content_type 'text/html; charset=UTF-8'
      body email_body
    end
  end
end
