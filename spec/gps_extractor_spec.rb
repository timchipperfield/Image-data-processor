describe GPSExtractor do

  describe "#initialize" do
    it 'initializes with a file name' do
      filename = 'example/filename.jpeg'
      extractor = GPSExtractor.new(filename)
      expect(extractor.filename).to eq filename
    end
  end

  describe "#extract_data" do
    it 'has a hash with the filename (without full path)' do
      filename = 'spec/sample_images/image_a.jpg'
      extractor = GPSExtractor.new(filename)
      expect(extractor.extract_data[:filename]).to eq('image_a.jpg')
    end

    context 'when the file has the gps data' do
      it 'returns the extracted data as a hash' do
        filename = 'spec/sample_images/image_a.jpg'
        extractor = GPSExtractor.new(filename)
        expect(extractor.extract_data[:lat]).to eq(50.09133333333333)
        expect(extractor.extract_data[:lng]).to eq(122.94566666666667)
      end
    end

    context 'when the file does not have the gps data' do
      it 'creates the hash with nil values' do
        filename = 'spec/sample_images/image_d.jpg'
        extractor = GPSExtractor.new(filename)
        expect(extractor.extract_data[:lat]).to eq(nil)
        expect(extractor.extract_data[:lng]).to eq(nil)
      end
    end

    context 'when the file does not have any exif data' do
      it 'rescues the error and creates a hash with nil values for lat and lng' do
        filename = 'spec/sample_images/image_b.jpg'
        extractor = GPSExtractor.new(filename)
        expect(extractor.extract_data[:lat]).to eq(nil)
        expect(extractor.extract_data[:lng]).to eq(nil)
      end
    end
  end
end
