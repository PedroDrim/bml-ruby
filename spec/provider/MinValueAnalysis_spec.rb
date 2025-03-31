require 'rspec'
require './src/model/Table.rb'
require './src/provider/MinValueAnalysis.rb'

RSpec.describe MinValueAnalysis do
  let(:instance) { MinValueAnalysis.new }
  let(:table) { Table.new('./data/test.csv') }

  it '1. Deverá ser instanciável corretamente' do
    expect(instance).to be_a(MinValueAnalysis)
  end

  it "2. 'analysis()' deverá ser válido caso possua parâmetros válidos" do
    value = instance.analysis(table.userInfoList)
    expect(value).to eq(1)
  end
end
