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

end
