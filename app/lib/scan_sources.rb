class ScanSources
  def process
    sources = Source.all 
    sources.each do |source|
      puts source.path.to_s
      process_source(source.path)
    end
  end

  private

  def process_source(source)
  	puts "a"+source.to_s
    %w(mp4 mp3).each do |ext|
      process_extention(source, ext)
    end
  end

  def process_extention(source, ext)
  	puts "b"+source.to_s+ext.to_s
    pattern = File.join(source, '*.' + ext)
    puts pattern
    list = Dir.glob(pattern)
    list.each do |filename|
      process_file(filename)
    end
  end

  def process_file(filename)
  	puts "c"+filename.to_s
    base = File.basename(filename)
    medium = Medium.new
    medium.filename = base
    medium.save
  end
end
