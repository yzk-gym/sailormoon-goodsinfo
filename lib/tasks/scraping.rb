require 'open-uri'
require 'kconv'

class Tasks::Scraping

  def self.goods_info

    url = 'http://sailormoon-official.com/goods/'
    html = open(url).read

    count = 0

    contents = Nokogiri::HTML.parse(html,url,nil,'Shift_JIS')
    @itemlist = contents.css("div.innerBox")

    @itemlist.each do | itemdata |

      count = count + 1

      name = itemdata.css("a.ellipsis").text
      date = itemdata.css("div.ellipsis").text
      image = itemdata.css("img.thumbnail").attribute("src").value

      name.slice!(%r{\s+})

      # 末尾に空白があればなくなるまで削除
      until name.slice!(%r{[\s]\z+}) == nil do
          name.slice!(%r{[\s]\z+})
      end

      date = date.slice(%r{\d+/\d+/\d+})


          item = Item.new({id:count,name:name,date:date,image:image})
          item.save

    end

    pp "db updated"
  end
end
