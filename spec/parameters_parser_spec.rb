describe ParametersParser do

  describe "#parse" do
    context 'when there is only one argument' do
      context 'when html (downcase)' do
        it 'sets the html value to true' do
          expect(ParametersParser.new(["html"]).parse).to eq({ html: true })
        end
      end

      context 'when HTML (upcase)' do
        it 'sets the html value to true' do
          expect(ParametersParser.new(["HTML"]).parse).to eq({ html: true })
        end
      end

      context 'when not html' do
        it 'is assumed to be a directory' do
          expect(ParametersParser.new(["test"]).parse).to eq({ directory: "test" })
        end
      end
    end

    context 'when there are two arguments' do
      context 'when html is detected' do
        it 'sets html to true and sets the other as the directory' do
          expect(ParametersParser.new(["test", "html"]).parse).to eq({ html: true, directory: "test" })
        end
      end

      context 'when no html is detected' do
        it 'only sets the directory as the first arg' do
          expect(ParametersParser.new(["test", "something_else"]).parse).to eq({ directory: "test" })
        end
      end
    end
  end
end
