require './src/model/SimpleTableAnalysis.rb'

# Classe de analise que implementa a interface "SimpleTableAnalysis"
class MeanAnalysis
    include SimpleTableAnalysis

    # Método responsável por obter a media de valores de credit na lista de usuarios
    # @param userInfoList Lista de usuarios
    # @return Valor máximo da lista
    def analysis(userInfoList)

        value = userInfoList.map do |userInfo| 
            userInfo.credit
        end

        value = value.inject(:+) / value.size
        return value
    end
end