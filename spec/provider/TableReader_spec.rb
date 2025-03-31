require 'rspec'
require './src/provider/TableReader.rb'
require './src/model/exception/InvalidParameterException.rb'
require './src/model/exception/DataReaderException.rb'

RSpec.describe TableReader do
  let(:file_name) { './data/test.csv' }
  let(:reader) { TableReader.new(file_name) }

  it '1. Deverá ser instanciável corretamente' do
    expect(reader).to be_a(TableReader)
  end

  it '2. Deverá retornar o nome do arquivo corretamente' do
    expect(reader.getFileName).to eq(file_name)
  end

  it '3. Deverá ler todos os dados corretamente' do
    expect(reader.readAll.length).to be > 0
  end

  it '4. Deverá ler um intervalo específico corretamente' do
    expect(reader.read(1, 3).length).to eq(3)
  end

  it '5. Deverá lançar exceção ao instanciar com nome de arquivo nil' do
    expect { TableReader.new(nil) }.to raise_error(InvalidParameterException)
  end

  it '6. Deverá lançar exceção ao tentar ler com startIndex menor que 0' do
    expect { reader.read(-1, 2) }.to raise_error(InvalidParameterException)
  end

  it '7. Deverá lançar exceção ao tentar ler com endIndex menor que 0' do
    expect { reader.read(1, -2) }.to raise_error(InvalidParameterException)
  end

  it '8. Deverá lançar exceção ao tentar ler com startIndex maior ou igual a endIndex' do
    expect { reader.read(3, 3) }.to raise_error(InvalidParameterException)
  end

  it '9. Deverá lançar exceção ao tentar ler um arquivo inexistente' do
    expect { TableReader.new('inexistent_file.csv') }.to raise_error(DataReaderException)
  end
end
