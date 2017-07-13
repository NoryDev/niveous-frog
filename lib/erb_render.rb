# frozen_string_literal: true

# ErbRender is necessary to use Sinatra helpers (like :erb) outside of
# controllers
module ErbRender
  include Sinatra::Templates
  include Sinatra::Helpers

  def settings
    @settings ||= begin
      settings = Sinatra::Application.settings
      settings.root = File.expand_path('../..', __FILE__)
      settings
    end
  end

  def template_cache
    @template_cache ||= Tilt::Cache.new
  end
end
