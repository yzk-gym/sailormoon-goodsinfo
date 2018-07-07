class GoodsController < ApplicationController

  require 'open-uri'
  require 'kconv'


  def goods

    @array = Array.new()
    @array = Item.all
  end
end
