class DefaultSelector
  def initialize(stick)
    @stick = stick
  end

  def run
    dest_array = @stick["destination"]
    final_dest_array = Array.new
    dest_array.each do |dest|
      if dest.length > 0
        final_dest_array << dest
      end
    end
    final_dest_array
  end	
end