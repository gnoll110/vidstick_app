class WelcomeController < ApplicationController
  def index
  end

  def show
  end

  def loader
    scan_sources = ScanSources.new
    scan_sources.process
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
    params.require(:stick) # .permit(:destination)
  end
end
