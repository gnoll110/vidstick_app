class BuildStick
  attr_reader :stick

  def initialize(params)
    pp params
    @stick = params[:stick] || []
    pp @stick
  end

  def process
    dest_array = builder
    file_array = get_file_list(dest_array)
    build_stick(file_array)
  end

  def builder
    puts '>'
    pp @stick
    #form_data =
    puts '>>'+@stick[:destination]
    #puts '>>'
    #puts form_data
    dest_array = form_data[:destination]
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
    puts '?'+file_set.to_s
    file_set.each do | file |
      paths = Medium.find_by_filename(file).destinations
      paths.each do | path |
        puts '>>>'+path.path+'>>'+file
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
   def stick_params
      params.require(:stick).permit(:destination)
    end  
end