require 'csv'

class CSVExporter

  def initialize(data)
    @data = data
  end

  def build_csv outfile = nil
    unless @data.empty?
      file_to = outfile ||= 'image_data.csv'
      CSV.open(file_to, 'w') do |csv|
        csv << @data.first.keys
        @data.each do |hsh|
          csv << hsh.values
        end
      end
    end
  end
end
