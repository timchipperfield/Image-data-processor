require 'tempfile'

describe HTMLExporter do

  describe '#build_html_doc' do
    context 'when the data array is empty' do
      it 'does not create the html page' do
        hash_array = []

        expect(File).to_not receive(:open)

        exporter = HTMLExporter.new(hash_array)
        exporter.build_html_doc
      end
    end

    context 'when the data array has hashes in it' do
      it 'creates the csv' do
        hash_array = [{lat: '092', lng: '254', filename: 'text.jpg'},
                      {lat: '123', lng: '892', filename: 'text.tiff'}]

        exporter = HTMLExporter.new(hash_array)

        file = Tempfile.new('image_test')

        # passing the tempfile path to the csv builder, overrides default save path
        exporter.build_html_doc(file.path)

        html = file.read

        # header expectations
        expect(html).to match(/lat/)
        expect(html).to match(/lng/)
        expect(html).to match(/filename/)

        # data expectations
        expect(html).to match(/092/)
        expect(html).to match(/254/)
        expect(html).to match(/text.jpg/)

        expect(html).to match(/123/)
        expect(html).to match(/892/)
        expect(html).to match(/text.tiff/)

        # teardown of tempfile
        file.close
        file.unlink
      end
    end
  end
end
