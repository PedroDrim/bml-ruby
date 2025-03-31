require 'rspec'
require './src/model/TimeFormat.rb'

RSpec.describe TimeFormat do
  it "1. Deverá conter a constante SEGUNDOS corretamente" do
    expect(TimeFormat::SEGUNDOS).to eq(1)
  end

  it "2. Deverá conter a constante MILLISEGUNDOS corretamente" do
    expect(TimeFormat::MILLISEGUNDOS).to eq(1000)
  end

  it "3. Deverá conter a constante NANOSSEGUNDOS corretamente" do
    expect(TimeFormat::NANOSSEGUNDOS).to eq(1000000)
  end
end