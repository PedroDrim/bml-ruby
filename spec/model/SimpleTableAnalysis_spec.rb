require 'rspec'
require './src/model/SimpleTableAnalysis.rb'

class MockSimpleTableAnalysis include SimpleTableAnalysis
  def analysis(user_info_list)
    0
  end
end

RSpec.describe SimpleTableAnalysis do
  let(:instance) { MockSimpleTableAnalysis.new }

  it "1. Integração do 'analysis()'" do
    expect { instance.analysis([]) }.not_to raise_error
  end
end
