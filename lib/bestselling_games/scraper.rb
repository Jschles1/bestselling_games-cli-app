class BestsellingGames::Scraper
  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    games = doc.css("div.product.new_product")
    # Scrapes text from elements and uses it to create Game objects with associated attributes.
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
