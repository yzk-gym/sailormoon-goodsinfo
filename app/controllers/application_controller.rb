class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "Pg1MaqymBgzXxtL1r6JWGabCW"
      config.consumer_secret = "EsVuRYP6mkXL7hO6eqfFouayvEEhESen7EwdLf8RoNANJv4E40"
      config.access_token = "920764129-hc4q82PJDunzv4pbU6OMoSw96iPRBubDqCtfg45P"
      config.access_token_secret = "pF4ihD1GuC08fKiLLZ40cIRkV9d6ufGPYESU7SsF6lVkr"
    end
  end
end
