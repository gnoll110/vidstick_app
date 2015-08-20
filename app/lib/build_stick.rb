require 'fileutils'
include FileUtils::Verbose

class BuildStick
  attr_reader :stick

  def initialize(stick)
    @stick = stick
    @sources = Source.all
  end

  def process
    dest_array = builder
    file_array = get_file_list(dest_array)
    build_stick(file_array)
  end

  private

  def builder
    dest_array = @stick["destination"]
    final_dest_array = Array.new
    dest_array.each do |dest|
      if dest.length > 0
        final_dest_array << dest
      end
    end
    final_dest_array
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
      paths = Medium.find_by_filename(file).destinations
      paths.each do |path|
        dest_file = File.join('/media/noel/USB DISK', path.path, file)
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

  def sump
    sources = Source.all
    destination = Destination.find_by_path('eco/permaculture')
    puts destination
      # destinations.each do | destination |
      puts destination.path
      destination.media.each do |medium|
        puts medium.filename
        puts medium.id
        sources.each do |source|
          puts source.path
          full_filename = File.join(source.path, medium.filename)
          puts full_filename
          if File.exist?(full_filename)
            puts '>>>' + full_filename
          end
        end
        medium.destinations.each do |final_dest|
          puts '>>>>>>' + final_dest.path
        end
      end
    # end
    render 'index'
  end
end
