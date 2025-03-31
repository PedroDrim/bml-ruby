require 'rspec'
require './src/model/DataReader.rb'

# Mock da interface DataReader
class MockDataReader
  include DataReader

  def readAll
    []
  end

  def read(startIndex, endIndex)
    []
  end
end

RSpec.describe DataReader do
  let(:mock_instance) { MockDataReader.new }

  it "1. Deverá ser instanciável corretamente" do
    expect(mock_instance).to be_a(MockDataReader)
  end

  it "2. Método 'readAll' deverá ser executado corretamente" do
    expect { mock_instance.readAll }.not_to raise_error
  end

  it "3. Método 'readAll' deverá retornar uma lista" do
    expect(mock_instance.readAll).to be_an(Array)
  end

  it "4. Método 'read' deverá ser executado corretamente" do
    expect { mock_instance.read(0, 10) }.not_to raise_error
  end

  it "5. Método 'read' deverá retornar uma lista" do
    expect(mock_instance.read(0, 10)).to be_an(Array)
  end
end
