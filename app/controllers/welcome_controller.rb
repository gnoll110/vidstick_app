class WelcomeController < ApplicationController
  def index
  end

  def show
  end

  def loader
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
    stick = stick_params
    build_stick = BuildStick.new(stick)
    build_stick.process
    render 'index'
  end

private
  def stick_params
    params.require(:stick) #.permit(:destination)
  end  
end