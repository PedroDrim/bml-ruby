require 'rspec'
require './src/model/BenchmarkOutput.rb'
require './src/model/TimeFormat.rb'
require './src/model/exception/InvalidParameterException.rb'
require './src/model/exception/BenchmarkException.rb'

# Mock da interface BenchmarkOutput
class MockBenchmarkOutput
  include BenchmarkOutput

  def startState(tag); end
  def endState(tag); end
  def resultByTag(tag, format); return 0; end
  def result(format); return {}; end
  def export(fileName, format); end
end

RSpec.describe BenchmarkOutput do
  let(:mock_instance) { MockBenchmarkOutput.new }

  it "1. Deverá ser instanciável corretamente" do
    expect(mock_instance).to be_a(MockBenchmarkOutput)
  end

  it "2. Método 'startState' deverá ser executado corretamente" do
    expect { mock_instance.startState("test") }.not_to raise_error
  end

  it "3. Método 'endState' deverá ser executado corretamente" do
    expect { mock_instance.endState("test") }.not_to raise_error
  end

  it "4. Método 'resultByTag' deverá ser executado corretamente" do
    expect { mock_instance.resultByTag("test", TimeFormat::SEGUNDOS) }.not_to raise_error
  end

  it "5. Método 'result' deverá ser executado corretamente" do
    expect { mock_instance.result(TimeFormat::SEGUNDOS) }.not_to raise_error
  end

  it "6. Método 'export' deverá ser executado corretamente" do
    expect { mock_instance.export("output.json", TimeFormat::SEGUNDOS) }.not_to raise_error
  end
end
