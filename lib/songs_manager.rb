module SongsManager

  @path = "#{Rails.root}/tmp/songs"

  def self.path
    @path
  end

  def self.git_init
    `mkdir -p #{@path}`
    self.exec "git init"

    config = <<~EOF
      [user]
              name = System
              email = System
    EOF
    ignore = <<~EOF
      *.DS_Store
    EOF
    File.write("#{@path}/.gitconfig", config)
    File.write("#{@path}/.gitignore", ignore)

    self.exec "git config --local include.path .gitconfig"
  end

  def self.git_commit msg = "System Commit at #{Time.now}"
    @songs = JSON.pretty_generate(Song.all.map{ |s| self.export_hash(s) })
    File.write("#{@path}/songs.json", @songs)
    self.exec "git add -A", "git commit -m '#{msg}'"
  end

  def self.git_log
    self.exec "git log"
  end

  def self.zip
    zip_path = "#{Rails.root}/tmp/songs.zip"
    self.exec "zip -r #{zip_path} ."
    zip_path
  end

private

  def self.exec *command
    `cd #{@path} && #{command.join(" && ")}`
  end

  def self.export_hash song
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
