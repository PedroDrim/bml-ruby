require 'rspec'
require './src/model/exception/BenchmarkException.rb'

RSpec.describe BenchmarkException do
  it "1. Deverá ser uma subclasse de StandardError" do
    expect(BenchmarkException).to be < StandardError
  end

  it "2. Deverá ser lançada corretamente com uma mensagem" do
    expect { raise BenchmarkException.new("Erro de benchmark") }
      .to raise_error(BenchmarkException, "Erro de benchmark")
  end
end
