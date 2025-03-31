require 'rspec'
require './src/model/Table.rb'

RSpec.describe Table do
  let(:instance) { Table.new('./data/test.csv') }

  it '1. Deverá ser instanciável corretamente' do
    expect(instance).to be_a(Table)
  end

  it "2. Método 'fileName' deverá ser executado corretamente" do
    expect(instance.fileName).to eq('./data/test.csv')
  end

  it "3. Método 'userInfoList' deverá retornar valor corretamente" do
    expect(instance.userInfoList.size).to eq(10)
  end
end
