class ImageSelector

  attr_reader :directory, :file_array

  def initialize directory = nil
    @directory = directory ||= Dir.pwd
    @file_array = []
  end

  def select_files
    files = Dir.glob("#{@directory}/*")
    files.each do |file|
      if included_types.any? { |type| file.match(type) }
        @file_array << file
      end
    end
  end

  private

  def included_types
    ['.jpeg', '.tiff', '.png']
  end
end
