require 'rspec'
require './src/model/Table.rb'
require './src/provider/MaxValueAnalysis.rb'

RSpec.describe MaxValueAnalysis do
  let(:instance) { MaxValueAnalysis.new }
  let(:table) { Table.new('./data/test.csv') }

  it '1. Deverá ser instanciável corretamente' do
    expect(instance).to be_a(MaxValueAnalysis)
  end

  it "2. 'analysis()' deverá ser válido caso possua parâmetros válidos" do
    value = instance.analysis(table.userInfoList)
    expect(value).to eq(10)
  end
end
