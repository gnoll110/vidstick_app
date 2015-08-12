require 'fileutils'
include FileUtils::Verbose

class BuildStick
  attr_reader :stick

  def initialize(stick)
    pp stick
    @stick = stick
    pp @stick
    puts '.'
    @sources = Source.all
  end

  def process
    dest_array = builder
    file_array = get_file_list(dest_array)
    build_stick(file_array)
  end

  def builder
    pp @stick
    puts '..'
    #form_data =
    @stick.each do |key, value|
      puts ' : ' + key.class.to_s
      puts '.: ' + key.to_s + ' : ' + value.to_s
    end
    puts '...'
    pp @stick["destination"]
    puts '....'
    #puts '>>'
    #puts form_data
    dest_array = @stick["destination"]
    final_dest_array = Array.new
    dest_array.each do | dest |
      if dest.length > 0
        puts dest.to_i
        final_dest_array << dest
      end
    end
    puts final_dest_array
    final_dest_array
  end

  def get_file_list(dest_array)
    puts dest_array.size
    puts '>'+dest_array.to_s
    file_set = Set.new
    dest_array.each do | dest |
      files = Destination.find(dest).media
      files.each do | file |
        puts '>>'+file.filename
        file_set << file.filename
      end
    end
    file_set
  end

  def build_stick(file_set)
    puts file_set.size
    file_set.each do | file |
      first = true

      found = false
      source_file = nil
      @sources.each do | source |
        source_file = File.join(source.path, file)
        found = File.exists?(source_file)
        puts source_file+' '+found.to_s
        break if found
      end
      break if !found
      puts '??'+source_file

      paths = Medium.find_by_filename(file).destinations
      paths.each do | path |
        puts '>>>'+path.path+'>>'+file+'>'+first.to_s 
        dest_file = File.join('/media/noel/USB DISK', path.path, file)
        dest_dir  = File.dirname(dest_file)
        if !Dir.exists?(dest_dir)
          puts 'made dir '+dest_dir
          mkdir_p dest_dir
          #FileUtils.mkdir_p dest_dir
        end
        comd = 'cp "'+source_file.to_s+'" "'+dest_file+'"'
        puts '>>>>'+comd
        if first
          FileUtils.cp(source_file.to_s, dest_file.to_s)
          old = dest_file.to_s
        else
          FileUtils.ln(old, source_file.to_s)
        end
        first = false
      end
    end
  end

  def sump  
    sources = Source.all
    destination = Destination.find_by_path('eco/permaculture')
    puts destination
    #destinations.each do | destination |
      puts destination.path
      destination.media.each do | medium |
        puts medium.filename
        puts medium.id
        sources.each do | source |
          puts source.path
          full_filename = File.join(source.path, medium.filename)
          puts full_filename
          if File.exists?(full_filename)
            puts '>>>'+full_filename
          end
        end
        medium.destinations.each do | final_dest |
          puts '>>>>>>'+final_dest.path
        end
      end
    #end
    render 'index'    
  end
private
  #def stick_params
  #  stick.require(:destination)
  #end  
end