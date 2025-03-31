require 'rspec'
require './src/model/UserInfo.rb'
require './src/model/exception/InvalidParameterException.rb'

RSpec.describe UserInfo do
  let(:instance) { UserInfo.new('user', 'password', 0) }

  it '1. Deverá ser instanciável corretamente' do
    expect(instance).to be_a(UserInfo)
  end

  it "2. Método 'setUser' deverá ser executado corretamente" do
    expect { instance.setUser('newUser') }.not_to raise_error
  end

  it "3. Método 'setPassword' deverá ser executado corretamente" do
    expect { instance.setPassword('newPassword') }.not_to raise_error
  end

  it "4. Método 'setCredit' deverá ser executado corretamente" do
    expect { instance.setCredit(1) }.not_to raise_error
  end

  it "5. Método 'getUser' deverá retornar valor corretamente" do
    expect(instance.getUser).to eq('user')
  end

  it "6. Método 'getPassword' deverá retornar valor corretamente" do
    expect(instance.getPassword).to eq('HASHdrowssap000')
  end

  it "7. Método 'getCredit' deverá retornar valor corretamente" do
    new_instance = UserInfo.new('user', 'password', 1)
    expect(new_instance.getCredit).to eq(1.0)
  end

  it "8. Deve lançar exceção ao criar com parâmetros nil" do
    expect { UserInfo.new(nil, 'password', 0) }.to raise_error(InvalidParameterException)
    expect { UserInfo.new('user', nil, 0) }.to raise_error(InvalidParameterException)
    expect { UserInfo.new('user', 'password', nil) }.to raise_error(InvalidParameterException)
  end

  it "9. Deve lançar exceção ao definir valores nil" do
    expect { instance.setUser(nil) }.to raise_error(InvalidParameterException)
    expect { instance.setPassword(nil) }.to raise_error(InvalidParameterException)
    expect { instance.setCredit(nil) }.to raise_error(InvalidParameterException)
  end
end