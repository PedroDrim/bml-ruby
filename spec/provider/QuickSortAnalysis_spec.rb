require './src/provider/QuickSortAnalysis.rb'
require './src/model/exception/InvalidParameterException.rb'
require './src/model/UserInfo.rb'

RSpec.describe QuickSortAnalysis do
  let(:user_info_list) do
    [
      UserInfo.new("User_1", "Password_1", 1),
      UserInfo.new("User_2", "Password_2", 5),
      UserInfo.new("User_3", "Password_3", 3),
      UserInfo.new("User_4", "Password_4", 4),
      UserInfo.new("User_5", "Password_5", 2)
    ]
  end

  let(:analysis) { QuickSortAnalysis.new }

  it "1. Deve lançar exceção quando 'userInfoList' for nil" do
    expect { analysis.analysis(nil) }.to raise_error(InvalidParameterException, "'userInfoList' é nil ou vazio")
  end

  it "2. Deve lançar exceção quando 'userInfoList' for vazio" do
    expect { analysis.analysis([]) }.to raise_error(InvalidParameterException, "'userInfoList' é nil ou vazio")
  end

  it "3. A lista deve estar ordenada em ordem decrescente" do
    sorted_list = analysis.analysis(user_info_list)
    expect(sorted_list.map(&:getCredit)).to eq([5, 4, 3, 2, 1])  # Ordem decrescente
  end
end
