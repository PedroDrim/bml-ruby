require './src/model/SimpleTableAnalysis.rb'

# Classe de analise que implementa a interface "SimpleTableAnalysis"
class MaxValueAnalysis
    include SimpleTableAnalysis

    # Método responsável por obter o maior valor de credit na lista de usuarios
    # @param userInfoList Lista de usuarios
    # @return Valor máximo da lista
    def analysis(userInfoList)

        value = userInfoList.map do |userInfo| 
            userInfo.credit
        end

        return value.max()
    end
end