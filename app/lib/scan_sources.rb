class ScanSources
  def process
    sources = Source.all
    sources.each do | source |
      ['mp4','mp3'].each do | ext |
        pattern = File.join(source.path, '*.'+ext)
        list = Dir.glob(pattern)
        list.each do | filename |
          base = File.basename(filename)
          medium = Medium.new
          medium.filename = base
          medium.save
        end
      end
    end
  end
end