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
    puts params[:stick]
    puts "CCC"
    render 'index'    
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