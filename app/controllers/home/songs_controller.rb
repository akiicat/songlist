class Home::SongsController < Home::ApplicationController
  def index
    @songs = Song.search(params[:search])
    respond_to do |format|
      format.html
      format.js   { render :file => "home/songs/ajax/search.js.erb" }
      format.json { render :json => @songs.map{ |s| export_hash(s) }.to_json }
    end
  end

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

      cover: song.cover.to_s,
      feat: song.feat.to_s,

      description: song.description.to_s,

      lyric_url: song.lyric_url.to_s,
      video_url: song.video_url.to_s,
    }
  end
end
