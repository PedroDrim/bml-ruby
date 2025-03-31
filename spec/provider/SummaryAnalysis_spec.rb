require './src/provider/SummaryAnalysis.rb'
require './src/model/exception/InvalidParameterException.rb'
require './src/model/UserInfo.rb'

RSpec.describe SummaryAnalysis do
  let(:user_info_list) do
    [
      UserInfo.new("User_1", "Password_1", 1),
      UserInfo.new("User_2", "Password_2", 2),
      UserInfo.new("User_3", "Password_3", 3),
      UserInfo.new("User_4", "Password_4", 4),
      UserInfo.new("User_5", "Password_5", 5)
    ]
  end

  let(:analysis) { SummaryAnalysis.new }

  it "1. Deve retornar o valor mínimo correto" do
    result = analysis.analysis(user_info_list)
    expect(result[0]).to eq(1)  # Mínimo = 1
  end

  it "2. Deve retornar o valor máximo correto" do
    result = analysis.analysis(user_info_list)
    expect(result[1]).to eq(5)  # Máximo = 5
  end

  it "3. Deve retornar a média correta" do
    result = analysis.analysis(user_info_list)
    expect(result[2]).to eq(3.0)  # Média = (1+2+3+4+5)/5 = 3.0
  end

  it "4. Deve lançar exceção quando 'userInfoList' for nil" do
    expect { analysis.analysis(nil) }.to raise_error(InvalidParameterException, "'userInfoList' é nil ou vazio")
  end

  it "5. Deve lançar exceção quando 'userInfoList' for vazio" do
    expect { analysis.analysis([]) }.to raise_error(InvalidParameterException, "'userInfoList' é nil ou vazio")
  end
end
