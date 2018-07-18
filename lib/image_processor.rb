require_relative './csv_exporter'
require_relative './image_selector'
require_relative './gps_extractor'

class ImageProcessor

  def initialize directory
    @directory = directory ||= Dir.pwd
  end

  def process
    selector = ImageSelector.new(@directory)
    selector.select_files
    files = selector.file_array
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
