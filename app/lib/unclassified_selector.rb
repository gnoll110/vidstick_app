class UnclassifiedSelector
  def run
    file_set = Set.new
    files = Medium.all
    files.each do |file|
      if file.relations.empty?
      	file_set << file.filename
      end
    end
    file_set
  end
end
