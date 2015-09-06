class ScanSources
  def process
    sources = Source.all 
    sources.each do |source|
      process_source(source.path)
    end
  end

  private

  def process_source(source)
    %w(mp4 mp3).each do |ext|
      process_extention(source, ext)
    end
  end

  def process_extention(source, ext)
    pattern = File.join(source, '*.' + ext)
    list = Dir.glob(pattern)
    list.each do |filename|
      process_file(filename)
    end
  end

  def process_file(filename)
    base = File.basename(filename)
    medium = Medium.new
    medium.filename = base
    medium.save
  end
end
