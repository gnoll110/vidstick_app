class ScanSources
  def process
    sources = Source.all
    sources.each do | source |
      proces_source
    end
  end

  private

  def process_source
    ['mp4','mp3'].each do | ext |
      process_extention
    end
  end

  def process_extention
    pattern = File.join(source.path, '*.'+ext)
    list = Dir.glob(pattern)
    list.each do | filename |
      process_file
    end
  end

  def process_file
    base = File.basename(filename)
    medium = Medium.new
    medium.filename = base
    medium.save
  end
end