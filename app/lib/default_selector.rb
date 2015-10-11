class DefaultSelector
  def initialize(stick)
    @stick = stick
  end

  def run
    dest_array = builder
    file_array = get_file_list(dest_array)
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
end
