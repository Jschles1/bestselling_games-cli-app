class BestsellingGames::Game
  attr_accessor :title, :price, :publisher, :url

  @@all = []

  def initialize(title, price, publisher, url)
    self.title = title
    self.price = price
    self.publisher = publisher
    self.url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.ps4_scrape
    return_array = []
    doc = Nokogiri::HTML(open("http://www.gamestop.com/browse/games/playstation-4?nav=28-xu0,131dc-ffff2418"))
    games = doc.css("div.product.new_product")
    games.each_with_index do |game, i|
      game = self.new
      game.title = games.css(".ats-product-title-lnk")[i].text.gsub("- Only at GameStop", "").strip

      price_scrape = games.css("p.pricing.ats-product-price")[i].text.strip
      if price_scrape.length > 7
        game.price = price_scrape.gsub("$", " ").split(" ")[1].insert(0, "$")
      else
        game.price = price_scrape
      end

      game.publisher = games.css(".publisher.ats-product-publisher")[i].text.gsub("by ", "").strip
      game.url = games.css(".ats-product-title-lnk")[i].attr("href").split.insert(0, "www.gamestop.com").join
      return_array << game
    end

    return_array

  end

  def self.wiiu_scrape
    return_array = []
    doc = Nokogiri::HTML(open("http://www.gamestop.com/browse/games/nintendo-wii-u?nav=131b0-ffff2418"))
    games = doc.css("div.product.new_product")
    games.each_with_index do |game, i|
      game = self.new
      game.title = games.css(".ats-product-title-lnk")[i].text.gsub("- Only at GameStop", "").strip

      price_scrape = games.css("p.pricing.ats-product-price")[i].text.strip
      if price_scrape.length > 7
        game.price = price_scrape.gsub("$", " ").split(" ")[1].insert(0, "$")
      else
        game.price = price_scrape
      end

      game.publisher = games.css(".publisher.ats-product-publisher")[i].text.gsub("by ", "").strip
      game.url = games.css(".ats-product-title-lnk")[i].attr("href").split.insert(0, "www.gamestop.com").join
      return_array << game
    end

    return_array

  end

  def self.ds_scrape
    return_array = []
    doc = Nokogiri::HTML(open("http://www.gamestop.com/browse/games/nintendo-3ds?nav=131a2-ffff2418"))
    games = doc.css("div.product.new_product")
    games.each_with_index do |game, i|
      game = self.new
      game.title = games.css(".ats-product-title-lnk")[i].text.gsub("- Only at GameStop", "").strip

      price_scrape = games.css("p.pricing.ats-product-price")[i].text.strip
      if price_scrape.length > 7
        game.price = price_scrape.gsub("$", " ").split(" ")[1].insert(0, "$")
      else
        game.price = price_scrape
      end

      game.publisher = games.css(".publisher.ats-product-publisher")[i].text.gsub("by ", "").strip
      game.url = games.css(".ats-product-title-lnk")[i].attr("href").split.insert(0, "www.gamestop.com").join
      return_array << game
    end

    return_array

  end

  def self.pc_scrape
    return_array = []
    doc = Nokogiri::HTML(open("http://www.gamestop.com/browse/games/pc?nav=138c-ffff2418"))
    games = doc.css("div.product.new_product")
    games.each_with_index do |game, i|
      game = self.new
      game.title = games.css(".ats-product-title-lnk")[i].text.gsub("- Only at GameStop", "").strip

      price_scrape = games.css("p.pricing.ats-product-price")[i].text.strip
      if price_scrape.length > 7
        game.price = price_scrape.gsub("$", " ").split(" ")[1].insert(0, "$")
      else
        game.price = price_scrape
      end

      game.publisher = games.css(".publisher.ats-product-publisher")[i].text.gsub("by ", "").strip
      game.url = games.css(".ats-product-title-lnk")[i].attr("href").split.insert(0, "www.gamestop.com").join
      return_array << game
    end

    return_array

  end

end
