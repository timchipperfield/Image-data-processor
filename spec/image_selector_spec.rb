describe ImageSelector do

  describe '#initialize' do
    let(:directory) { '/example/path' }
    let(:selector) { ImageSelector.new(directory) }

    context 'when no directory name is passed' do
      let(:selector) { ImageSelector.new }

      it 'defaults to the current directory' do
        expect(selector.directory).to eq Dir.pwd
      end
    end

    context 'when a directory name is passed' do
      it 'uses the directory name parameter' do
        expect(selector.directory).to eq directory
      end
    end

    it 'creates a filename array' do
      expect(selector.file_array).to eq []
    end
  end

  describe '#select_files' do
    let(:selector) { ImageSelector.new("/random_files") }

    context 'when there are files in the #directory' do
      context 'when they are valid images' do
        def create_image_files
          FakeFS do
            FileUtils.mkdir("/random_files")
            File.open("/random_files/image.jpeg", "w")
            File.open("/random_files/image.tiff", "w")
            File.open("/random_files/image.png", "w")
          end
        end

        it 'adds the filenames to the file_array', fakefs: true do
          create_image_files
          selector.select_files

          expect(selector.file_array).to include("/random_files/image.jpeg")
          expect(selector.file_array).to include("/random_files/image.tiff")
          expect(selector.file_array).to include("/random_files/image.png")
        end
      end

      context 'when there are other files in a directory' do
        def create_other_files
          FakeFS do
            FileUtils.mkdir("/random_files")
            File.open("/random_files/file.doc", "w")
            File.open("/random_files/file.rb", "w")
          end
        end

        it 'ignores the files', fakefs: true do
          create_other_files
          selector.select_files

          expect(selector.file_array).to be_empty
        end
      end
    end
  end
end
