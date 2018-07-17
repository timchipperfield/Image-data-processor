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
      filename = 'spec/sample_images/path_with_gps.jpg'
      extractor = GPSExtractor.new(filename)
      expect(extractor.extract_data[:filename]).to eq('path_with_gps.jpg')
    end

    context 'when the file has the gps data' do
      it 'returns the extracted data as a hash' do
        filename = 'spec/sample_images/path_with_gps.jpg'
        extractor = GPSExtractor.new(filename)
        expect(extractor.extract_data[:lat]).to eq(43.46715666666389)
        expect(extractor.extract_data[:lng]).to eq(11.885394999997223)
      end
    end

    context 'when the file does not have the gps data' do
      it 'creates the hash with nil values' do
        filename = 'spec/sample_images/bike_no_gps.jpeg'
        extractor = GPSExtractor.new(filename)
        expect(extractor.extract_data[:lat]).to eq(nil)
        expect(extractor.extract_data[:lng]).to eq(nil)
      end
    end
  end
end
