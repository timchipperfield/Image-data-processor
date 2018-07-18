class ImageProcessor

  def initialize directory
    @directory = directory
  end

  def process
    selector = ImageSelector.new(@directory)
    files = selector.select_files
    data_array = extract_files files
    export_csv data_array
  end

  private

  def extract_files files
    data_array = Array.new
    files.each do |file|
      extractor = GPSExtractor.new(file)
      data_array << extractor.extract_data
    end
    data_array
  end

  def export_csv data_array
    csv_exporter = CSVExporter.new(data_array)
    csv_exporter.build_csv
  end
end
