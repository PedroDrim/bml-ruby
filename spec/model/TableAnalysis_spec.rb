require 'rspec'
require './src/model/TableAnalysis.rb'

# Mock da interface TableAnalysis
class MockTableAnalysis
  include TableAnalysis

  def analysis(userInfoList)
    []
  end
end

RSpec.describe TableAnalysis do
  let(:mock_instance) { MockTableAnalysis.new }

  it "1. Deverá ser instanciável corretamente" do
    expect(mock_instance).to be_a(MockTableAnalysis)
  end

  it "2. Método 'analysis' deverá ser executado corretamente" do
    expect { mock_instance.analysis([]) }.not_to raise_error
  end

  it "3. Método 'analysis' deverá retornar uma lista vazia" do
    expect(mock_instance.analysis([])).to eq([])
  end
end
