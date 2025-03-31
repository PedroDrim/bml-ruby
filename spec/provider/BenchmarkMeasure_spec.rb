require 'rspec'
require './src/provider/BenchmarkMeasure.rb'
require './src/model/exception/BenchmarkException.rb'
require './src/model/exception/InvalidParameterException.rb'

RSpec.describe BenchmarkMeasure do
  let(:instance) { BenchmarkMeasure.new }

  it "1. Deverá lançar InvalidParameterException ao chamar 'startState' com 'tag' nil" do
    expect { instance.startState(nil) }.to raise_error(InvalidParameterException, "'tag' é nil")
  end

  it "2. Deverá lançar InvalidParameterException ao chamar 'endState' com 'tag' nil" do
    expect { instance.endState(nil) }.to raise_error(InvalidParameterException, "'tag' é nil")
  end

  it "3. Deverá lançar InvalidParameterException ao chamar 'resultByTag' com 'tag' nil" do
    expect { instance.resultByTag(nil, TimeFormat::SEGUNDOS) }.to raise_error(InvalidParameterException, "'tag' é nil")
  end

  it "4. Deverá lançar InvalidParameterException ao chamar 'resultByTag' com 'format' nil" do
    expect { instance.resultByTag("test", nil) }.to raise_error(InvalidParameterException, "'format' é nil")
  end

  it "5. Deverá lançar BenchmarkException ao chamar 'resultByTag' com tag não iniciada e finalizada" do
    expect { instance.resultByTag("test", TimeFormat::SEGUNDOS) }.to raise_error(BenchmarkException, "Não encontrado par 'inicio-fim' de:test")
  end

  it "6. Deverá chamar 'startState' e 'endState' corretamente e retornar o tempo de execução" do
    instance.startState("test")
    sleep(1)
    instance.endState("test")
    result = instance.resultByTag("test", TimeFormat::SEGUNDOS)
    expect(result).to be_between(1, 2)
  end

  it "7. Deverá exportar os resultados para um arquivo corretamente" do
    instance.startState("test")
    sleep(1)
    instance.endState("test")
    file_name = "benchmark_result.json"
    instance.export(file_name, TimeFormat::SEGUNDOS)
    expect(File).to exist(file_name)
    File.delete(file_name)
  end
end
