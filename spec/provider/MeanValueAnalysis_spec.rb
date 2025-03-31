require 'rspec'
require './src/model/Table.rb'
require './src/provider/MeanAnalysis.rb'

RSpec.describe MeanAnalysis do
  let(:instance) { MeanAnalysis.new }
  let(:table) { Table.new('./data/test.csv') }

  it '1. Deverá ser instanciável corretamente' do
    expect(instance).to be_a(MeanAnalysis)
  end

  it "2. 'analysis()' deverá ser válido caso possua parâmetros válidos" do
    value = instance.analysis(table.userInfoList)
    expect(value).to eq(5.5)
  end
end
