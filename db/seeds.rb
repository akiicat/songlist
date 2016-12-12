# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

songs = JSON.parse(File.open("#{Rails.root}/db/songs.json").read)

songs.each do |s|
  s['singer']   = Singer.find_singer(s['singer']['name'], s['singer']['name_translation'])
  s['composer'] = Singer.find_singer(s['composer']['name'], s['composer']['name_translation'])
  s
end
Song.create!(songs)
