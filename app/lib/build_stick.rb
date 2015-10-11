require 'fileutils'
include FileUtils::Verbose

class BuildStick
  attr_reader :stick

  def initialize(p)
    @stick    = p[:stick]
    @selector = p[:selector]
    @sources = Source.all
  end

  def process
    #dest_array = builder
    #file_array = get_file_list(dest_array)
    file_array = @selector.run
    build_stick(file_array)
  end

  private

  def builder
    final_dest_array = @selector.run
  end

  def get_file_list(dest_array)
    file_set = Set.new
    dest_array.each do |dest|
      files = Destination.find(dest).media
      files.each do |file|
        file_set << file.filename
      end
    end
    file_set
  end

  def build_stick(file_set)
    file_set.each do |file|
      first = true

      found = false
      source_file = nil
      @sources.each do |source|
        source_file = File.join(source.path, file)
        found = File.exists?(source_file)
        break if found
      end
      break if !found
  
      old = ''
      medium = Medium.find_by_filename(file)
      paths = Medium.find_by_filename(file).destinations
      paths.each do |path|
        if medium.modified_filename != '' && medium.filename != medium.modified_filename
          final_dest_file = medium.modified_filename
        else
          final_dest_file = file
        end
        dest_file = File.join('/media/noel/USB DISK', path.path, final_dest_file)
        dest_dir  = File.dirname(dest_file)
        if !Dir.exist?(dest_dir)
          FileUtils.mkdir_p(dest_dir, :verbose => true)
        end
        if first
          FileUtils.cp(source_file.to_s, dest_file.to_s, :verbose => true)
          old = dest_file.to_s
        else
          FileUtils.ln(old, dest_file.to_s, :verbose => true)
        end
        first = false
      end
    end
  end
end
