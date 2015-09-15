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
    selector = DefaultSelector.new(stick: stick)
    build_stick = BuildStick.new({ selector: selector, stick: stick })
    build_stick.process
    render 'index'
  end

  def random_builder
    selector = RandomSelector.new
    build_stick = BuildStick.new({ selector: selector })
    build_stick.process
    render 'index'
  end

  def unclassified_builder
    selector = UnclassifiedSelector.new
    build_stick = BuildStick.new({ selector: selector })
    build_stick.process
    render 'index'
  end

  private

  def stick_params
    params.require(:stick) # .permit(:destination)
  end
end
