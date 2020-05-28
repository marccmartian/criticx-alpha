# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

@companies = JSON.parse(File.read('db/data_files/companies.json'))
@platforms = JSON.parse(File.read('db/data_files/platforms.json'))
@genres = JSON.parse(File.read('db/data_files/genres.json'))["genres"]   # []
@games = JSON.parse(File.read('db/data_files/games.json'))

@companies.each { |company| Company.create!(company) }  
  
@platforms.each { |platform| Platform.create!(platform) } 

@genres.each { |genre| Genre.create!(name: genre) } 

@games.each do |game|
  new_game = Game.new( game.slice("name", "summary", "release_date", "category", "rating") )
  parent_game = Game.find_by(name: game["parent"])
  new_game.parent = parent_game
  new_game.save!
  
  genres = Genre.where(name: game["genres"])
  genres.each { |genre| new_game.genre << genre }   

  if game["platforms"]
    game["platforms"].each do |platform|
      platform = Platform.find_by(name: platform["name"])
      new_game.platforms << platform
    end      
  end

  if game["involved_companies"]
    game["involved_companies"].each do |involved_company|
      company = Company.find_by(name: involved_company["name"])
      involved_company = InvolvedCompany.create!(
        company: company,
        game: new_game,
        developer: involved_company["developer"],
        publisher: involved_company["publisher"]
      )
    end    
  end
end