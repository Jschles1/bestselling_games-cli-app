class BestsellingGames::Game
  attr_accessor :title, :price, :publisher, :rating, :url

  def self.xbox_scrape
    return_array = []
    doc = Nokogiri::HTML(open("http://www.gamestop.com/browse/games/xbox-one?nav=28-xu0,131e0-ffff2418"))
    games = doc.css("div.product.new_product")
    games.each_with_index do |game, i|
      game = self.new
      game.title = games.css(".ats-product-title-lnk")[i].text.gsub("- Only at GameStop", "").strip
    end
  end

  def self.ps4_scrape

  end

  def self.wiiu_scrape

  end

  def self.ds_scrape

  end

  def self.pc_scrape

  end

end
