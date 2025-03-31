require 'rspec'
require './src/model/exception/DataReaderException.rb'

RSpec.describe DataReaderException do
  it "1. Deverá ser uma subclasse de StandardError" do
    expect(DataReaderException).to be < StandardError
  end

  it "2. Deverá ser lançada corretamente com uma mensagem" do
    expect { raise DataReaderException.new("Erro de benchmark") }
      .to raise_error(DataReaderException, "Erro de benchmark")
  end
end
