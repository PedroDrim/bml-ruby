require 'rspec'
require './src/model/UserInfo.rb'

RSpec.describe UserInfo do
  describe UserInfo do
    it "1. Deverá ser instanciável corretamente" do
      instance = UserInfo.new("user", "password")
      expect(instance).to be_an_instance_of(UserInfo)
    end
  
    it "2. Método 'user=' deverá ser executado corretamente" do
      instance = UserInfo.new("user", "password")
      expect { instance.user = "newUser" }.not_to raise_error
    end
  
    it "3. Método 'password=' deverá ser executado corretamente" do
      instance = UserInfo.new("user", "password")
      expect { instance.password = "newPassword" }.not_to raise_error
    end
  
    it "4. Método 'user' deverá retornar valor corretamente" do
      instance = UserInfo.new("user", "password")
      expect(instance.user).to eq("user")
    end
  
    it "5. Método 'password' deverá retornar valor corretamente" do
      instance = UserInfo.new("user", "password")
      expect(instance.password).to eq("HASHdrowssap000")
    end
  end  
end