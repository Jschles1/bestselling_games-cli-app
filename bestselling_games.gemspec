# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bestselling_games/version'

Gem::Specification.new do |spec|
  spec.name          = "bestselling_games"
  spec.version       = BestsellingGames::VERSION
  spec.authors       = ["John Schlesinger"]
  spec.email         = ["jschles1@ramapo.edu"]

  spec.summary       = %q{Best Selling Games}
  spec.description   = %q{This gem allows you to list Gamestop's best selling games for each system, and the details of each game in CLI.}
  spec.homepage      = "https://github.com/Jschles1/bestselling_games-cli-app"
  spec.license       = "MIT"


  spec.files         = ["lib/bestselling_games.rb","lib/bestselling_games/cli.rb","lib/bestselling_games/game.rb", "lib/bestselling_games/version.rb"]
  spec.bindir        = "bin"
  spec.executables   << "bestselling_games"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "open_uri_redirections"
  spec.add_dependency "nokogiri"
end
