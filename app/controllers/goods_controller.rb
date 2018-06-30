class GoodsController < ApplicationController

  require 'open-uri'
  require 'kconv'

  def goods

  url = 'http://sailormoon-official.com/goods/'
  charset = nil
    html = open(url).read

  @array = Array.new()
  count = 0

    contents = Nokogiri::HTML.parse(html,url,nil,'Shift_JIS')
    @itemlist = contents.css("div.innerBox")

    @itemlist.each do | itemdata |

      count = count + 1

      name = itemdata.css("a.ellipsis").text
      date = itemdata.css("div.ellipsis").text
      image = itemdata.css("img.thumbnail")

      name.slice!(%r{\s+})

      # ––”ö‚É‹ó”’‚ª‚ ‚ê‚Î‚È‚­‚È‚é‚Ü‚Åíœ
      until name.slice!(%r{[\s]\z+}) == nil do
        name.slice!(%r{[\s]\z+})
      end

      date = date.slice(%r{\d+/\d+/\d+})

      if Item.find(id = count) == nil
      item = Item.new({id:count,name:name,date:date,image:image})
      item.save
      end

      data_list = [name, date,image]

      @array.push(data_list)

    end

    end
end
