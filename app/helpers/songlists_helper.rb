module SonglistsHelper
  def songlist_info(songlist)
    info = {}

    info["time"] = songlist.time.strftime("%H:%M:%S")

    song = songlist.song
    if song.singer
      info["singer"] = song.singer.name
      info["singerT"] = song.singer.name_translation
    end

    if song.composer
      info["composer"] = song.composer.name
      info["composerT"] = song.composer.name_translation
    end

    info["title"] = song.title
    info["titleT"] = song.title_translation
    info["dscp"] = song.description


  end

  def option_info(prefix, data)
    prefix.to_s + data.to_s if not data.empty?
  end
end
