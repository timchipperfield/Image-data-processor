require_relative './csv_exporter'
require_relative './image_selector'
require_relative './gps_extractor'
require_relative './html_exporter'

class ImageProcessor

  def initialize parameters_hash = {}
    @html = parameters_hash[:html] ||= false
    @directory = parameters_hash[:directory] ||= Dir.pwd
  end

  def process
    selector = ImageSelector.new(@directory)
    selector.select_files
    files = selector.file_array
    data_array = extract_files files
    export_file data_array
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

  def export_file data_array
    if @html
      export_html data_array
    else
      export_csv data_array
    end
  end

  def export_html data_array
    html_exporter = HTMLExporter.new(data_array)
    html_exporter.build_html_doc
  end

  def export_csv data_array
    csv_exporter = CSVExporter.new(data_array)
    csv_exporter.build_csv
  end
end
