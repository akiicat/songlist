module SonglistsHelper
  def songlist_info(songlist)


    info = {}

    time        = songlist.time.strftime("%H:%M:%S")
    singer      = song.singer.name_info
    composer    = song.composer.name_info
    title       = song.title_info
    description = song.description

    if singer.empty? and composer.empty? and title.empty?
    end
  end
end
