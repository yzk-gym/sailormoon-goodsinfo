class UsersController < ApplicationController
  before_action :client

  def index
    @user = User.new
  end

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "Pg1MaqymBgzXxtL1r6JWGabCW"
      config.consumer_secret = "EsVuRYP6mkXL7hO6eqfFouayvEEhESen7EwdLf8RoNANJv4E40"
      config.access_token = "920764129-hc4q82PJDunzv4pbU6OMoSw96iPRBubDqCtfg45P"
      config.access_token_secret = "pF4ihD1GuC08fKiLLZ40cIRkV9d6ufGPYESU7SsF6lVkr"
    end
  end

  def user
        target = "differem7 アイテム　exclude:retweets"
    render :Action => search(target,10)
  end
  def target_timel
    ine
    @tweet = client.user_timeline("sailormoon_25th")
  end



  def get_name(target)
    @tweet = client.user(target).timeline
  end


  def update
    client.update("test")
    render plain: "Twitter.update"
  end

  def search(word,count)
    puts word
    @tweet  = client.search(word,result_type: "mixed").take(count)
  end


  def timeline
    @user = client.user
    @tweets = client.home_timeline(include_entities: true)
  end

end
