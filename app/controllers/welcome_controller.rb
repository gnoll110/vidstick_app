class WelcomeController < ApplicationController
  def index
  end

  def show
  end

  def loader
    puts "AAA"
    sources = Source.all
    sources.each do | source |
      puts source.path
      pattern = File.join(source.path, '*.mp4')
      list = Dir.glob(pattern)
      list.each do | filename |
        puts filename
        base = File.basename(filename)
        medium = Medium.new
        medium.filename = base
        medium.save
      end
    end
    render 'index'    
  end

  def builder
    puts "BBB"
    form_data = params[:stick]
    dest_array = form_data[:destination]
    final_dest_array = []
    dest_array.each do | dest |
      if dest.length > 0
        puts dest.to_i
        final_dest_array << dest
      end
    end
    puts "CCC"
    puts final_dest_array
    final_file_array = get_file_list(final_dest_array)
    build_stick(final_file_array)
    render 'index'    
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