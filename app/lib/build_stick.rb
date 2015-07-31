class BuildStick
  def initialize(params)
    @params = params
  end

  def process
    dest_array = builder
    file_array = get_file_list(dest_array)
    build_stick(file_array)
  end

  def builder
    #puts '>'+@params.to_s
    form_data = @params[:stick]
    #puts '>>'+form_data.to_s
    dest_array = form_data[:destination]
    final_dest_array = []
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
  end

  def build_stick(file_array)
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
end