describe ImageProcessor do

  context 'when no parameters passed' do
    let(:processor) { ImageProcessor.new }

    it 'calls ImageSelector, GPSExtractor creates CSV' do
      sample_image_array = ['spec/sample_images/path_with_gps.jpg']
      expect_any_instance_of(CSVExporter)
        .to receive(:build_csv)
      expect_any_instance_of(ImageSelector)
        .to receive(:file_array) { sample_image_array }
      expect_any_instance_of(GPSExtractor)
        .to receive(:extract_data) {{}}
      processor.process
    end
  end

  context 'when only the directory parameter is passed' do
    let(:processor) { ImageProcessor.new(directory: 'spec/sample_images')}

    it 'calls ImageSelector, GPSExtractor creates CSV' do
      sample_image_array = ['spec/sample_images/path_with_gps.jpg']
      expect_any_instance_of(CSVExporter)
        .to receive(:build_csv)
      expect_any_instance_of(ImageSelector)
        .to receive(:file_array) { sample_image_array }
      expect_any_instance_of(GPSExtractor)
        .to receive(:extract_data) {{}}
      processor.process
    end
  end

  context 'when only the html param is passed' do
    let(:processor) { ImageProcessor.new(html: true) }

    it 'calls ImageSelector, GPSExtractor creates CSV' do
      sample_image_array = ['spec/sample_images/path_with_gps.jpg']
      expect_any_instance_of(HTMLExporter)
        .to receive(:build_html_doc)
      expect_any_instance_of(ImageSelector)
        .to receive(:file_array) { sample_image_array }
      expect_any_instance_of(GPSExtractor)
        .to receive(:extract_data) {{}}
      processor.process
    end
  end

  context 'when both the directory and the html params are passed' do
    let(:processor) { ImageProcessor.new(directory: 'spec/sample_images', html: true)}

    it 'calls ImageSelector, GPSExtractor creates HTML doc' do
      sample_image_array = ['spec/sample_images/path_with_gps.jpg']
      expect_any_instance_of(HTMLExporter)
        .to receive(:build_html_doc)
      expect_any_instance_of(ImageSelector)
        .to receive(:file_array) { sample_image_array }
      expect_any_instance_of(GPSExtractor)
        .to receive(:extract_data) {{}}
      processor.process
    end
  end
end
