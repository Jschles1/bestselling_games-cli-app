class BestsellingGames::Scraper

  def self.xbox_scrape
    doc = Nokogiri::HTML(open("http://www.gamestop.com/browse/games/xbox-one?nav=28-xu0,131e0-ffff2418"))
    games = doc.css("div.product.new_product")
    games.each_with_index do |game, i|

      title = games.css(".ats-product-title-lnk")[i].text.gsub("- Only at GameStop", "").strip

      price_scrape = games.css("p.pricing.ats-product-price")[i].text.strip
      if price_scrape.length > 7
        price = price_scrape.gsub("$", " ").split(" ")[1].insert(0, "$")
      else
        price = price_scrape
      end

      publisher = games.css(".publisher.ats-product-publisher")[i].text.gsub("by ", "").strip
      url = games.css(".ats-product-title-lnk")[i].attr("href").split.insert(0, "www.gamestop.com").join

      BestsellingGames::Game.new(title, price, publisher, url)
    end
  end

end