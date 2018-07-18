describe ImageProcessor do

  let(:processor) { ImageProcessor.new('spec/sample_images') }

  context 'selecting images' do
    it 'calls ImageSelector, GPSExtractor creates CSV' do
      sample_image_array = ['spec/sample_images/path_with_gps.jpg']
      expect_any_instance_of(CSVExporter)
        .to receive(:build_csv)
      expect_any_instance_of(ImageSelector)
        .to receive(:select_files) { sample_image_array }
      expect_any_instance_of(GPSExtractor)
        .to receive(:extract_data) {{}}
      processor.process
    end
  end
end
