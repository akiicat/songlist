require 'json'
require 'awesome_print'

data = JSON.parse(open('songinfo.json').read)

# d['uta']  => Singer.name
# d['song'] => Singer.name
# d['songTitle'] => Song.title
# d['url'] => Song.lyric_url

# name
singer_list = []

# title, lyric_url
song_list = {}

data.each do |d|
  singer_name    = d['uta']
  composer_name  = d['song']
  song_title     = d['songTitle']
  song_lyric_url = d['url']

  
  singer_list.push(singer_name)   
  singer_list.push(composer_name) 

  song_list[song_title] = [singer_name, composer_name, song_title, song_lyric_url]
end

# ap singer_list.uniq
# ap song_list.uniq

singer_list.uniq.select{ |a| not a.empty? }.each do |name|
  puts "Singer.create!(name: \"#{name.strip}\")"
end

song_list.each do |key, value|
  singer    = value[0].strip
  composer  = value[1].strip
  title     = value[2].strip
  lyric_url = value[3].strip
  puts "s, c = [Singer.find_by_name(\"#{singer}\"), Singer.find_by_name(\"#{composer}\")]"
  puts "Song.create!(singer: s, composer: c, title: \"#{title}\", lyric_url: \"#{lyric_url}\")"
end

