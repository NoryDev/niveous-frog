# frozen_string_literal: true

require 'bundler/setup'
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
Dotenv.load

configure :production do
  Mail.defaults do
    delivery_method :smtp, address: 'smtp.sendgrid.net',
                           port: 587,
                           domain: 'herokuapp.com',
                           user_name: ENV['SENDGRID_USERNAME'],
                           password: ENV['SENDGRID_PASSWORD'],
                           authentication: :plain,
                           enable_starttls_auto: true
  end
end

# rubocop:disable Metrics/LineLength
configure :development do
  require 'letter_opener'
  Mail.defaults do
    delivery_method(LetterOpener::DeliveryMethod,
                    location: File.expand_path('../tmp/letter_opener', __FILE__))
  end
end
# rubocop:enable Metrics/LineLength

configure :test do
  Mail.defaults do
    delivery_method :test
  end
end

get '/' do
  erb(:home)
end
