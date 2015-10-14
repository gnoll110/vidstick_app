class UnclassifiedSelector
  def run
    file_set = Set.new
    files = Medium.all
    files.each do |file|
      puts file
    end
    file_set
  end
end
