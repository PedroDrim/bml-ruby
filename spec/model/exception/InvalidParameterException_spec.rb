require 'rspec'
require './src/model/exception/InvalidParameterException.rb'

RSpec.describe InvalidParameterException do
  it "1. Deverá ser uma subclasse de StandardError" do
    expect(InvalidParameterException).to be < StandardError
  end

  it "2. Deverá ser lançada corretamente com uma mensagem" do
    expect { raise InvalidParameterException.new("Erro de benchmark") }
      .to raise_error(InvalidParameterException, "Erro de benchmark")
  end
end
