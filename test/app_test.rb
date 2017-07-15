# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../app'

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home
    get '/'

    assert last_response.ok?
  end
end
