class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private

  def export_hash song
    {
      singer: {
        name: song.singer.name.to_s,
        name_translation: song.singer.name_translation.to_s,
      },

      composer: {
        name: song.composer.name.to_s,
        name_translation: song.composer.name_translation.to_s,
      },

      title: song.title.to_s,
      title_translation: song.title_translation.to_s,

      description: song.description.to_s,

      lyric_url: song.lyric_url.to_s,
      video_url: song.video_url.to_s,
    }
  end
end
