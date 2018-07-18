require 'erb'

class HTMLExporter

  def initialize(data)
    @data = data
  end

  def build_html_doc outfile = nil
    unless @data.empty?
      file_to = outfile ||= 'image_data.html'

      @headers = @data.first.keys
      @rows = @data

      template = File.read('./public/template.html.erb')
      result = ERB.new(template).result(binding)

      File.open(file_to, 'w+') do |f|
        f.write result
      end
    end
  end
end
