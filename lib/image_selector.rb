class ImageSelector

  attr_reader :directory, :file_array

  def initialize directory = nil
    @directory = directory ||= Dir.pwd
    @file_array = []
  end

  def select_files
    files = recursive_search
    files.each do |file|
      if included_types.any? { |type| file.match(type) }
        @file_array << file
      end
    end
  end

  private

  def included_types
    ['.jpeg', '.tiff', '.png', '.jpg']
  end

  def recursive_search
    Dir.chdir(directory) do
      @files = Dir.glob("**/*.*").map {|path| File.expand_path(path) }
    end
    @files
  end
end
