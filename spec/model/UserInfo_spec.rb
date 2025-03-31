require 'rspec'
require './src/model/UserInfo.rb'

RSpec.describe UserInfo do
  let(:instance) { UserInfo.new('user', 'password', 0) }

  it '1. Deverá ser instanciável corretamente' do
    expect(instance).to be_a(UserInfo)
  end

  it "2. Método 'user' deverá ser executado corretamente" do
    expect { instance.user = 'newUser' }.not_to raise_error
  end

  it "3. Método 'password' deverá ser executado corretamente" do
    expect { instance.password = 'newPassword' }.not_to raise_error
  end

  it "4. Método 'credit' deverá ser executado corretamente" do
    expect { instance.credit = 1 }.not_to raise_error
  end

  it "5. Método 'user' deverá retornar valor corretamente" do
    expect(instance.user).to eq('user')
  end

  it "6. Método 'password' deverá retornar valor corretamente" do
    expect(instance.password).to eq('HASHdrowssap000')
  end

  it "7. Método 'credit' deverá retornar valor corretamente" do
    new_instance = UserInfo.new('user', 'password', 1)
    expect(new_instance.credit).to eq(1)
  end
end
