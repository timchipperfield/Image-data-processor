require 'tempfile'

describe CSVExporter do

  describe "#build_csv" do
    context 'when the data array is empty' do
      it 'still creates a blank csv' do
        hash_array = []

        expect(CSV).to_not receive(:open)

        exporter = CSVExporter.new(hash_array)
        exporter.build_csv
      end
    end

    context 'when the data array has hashes in it' do
      it 'creates the csv' do
        hash_array = [{lat: '092', lng: '254', filename: 'text.jpg'},
                      {lat: '123', lng: '892', filename: 'text.tiff'}]

        exporter = CSVExporter.new(hash_array)

        file = Tempfile.new('image_test')

        # passing the tempfile path to the csv builder, overrides default save path
        exporter.build_csv(file.path)

        csv = file.read

        # header expectations
        expect(csv).to match(/lat/)
        expect(csv).to match(/lng/)
        expect(csv).to match(/filename/)

        # data expectations
        expect(csv).to match(/092/)
        expect(csv).to match(/254/)
        expect(csv).to match(/text.jpg/)

        expect(csv).to match(/123/)
        expect(csv).to match(/892/)
        expect(csv).to match(/text.tiff/)

        # teardown of tempfile
        file.close
        file.unlink
      end
    end
  end
end
