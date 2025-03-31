require './src/model/UserInfo.rb'
require './src/model/exception/InvalidParameterException.rb'
require './src/model/TableAnalysis.rb'

# Classe para ordenação usando QuickSort
class QuickSortAnalysis
  include TableAnalysis

  # Realiza a ordenação QuickSort
  # @param userInfoList [Array<UserInfo>] Lista de dados a ser analisada
  # @return [Array<UserInfo>] Lista ordenada
  def analysis(userInfoList)
    if(userInfoList.nil? || userInfoList.size == 0)
        raise InvalidParameterException.new("'userInfoList' é nil ou vazio")
    end

    self._quickSort(userInfoList)
  end

  private

  # Inicia o QuickSort
  # @param array [Array<UserInfo>] Lista a ser ordenada
  # @return [Array<UserInfo>] Lista ordenada
  def _quickSort(array)
    return array if array.length <= 1

    meio = array.length / 2
    pivot = array[meio]

    menores = array.select { |value| value.getCredit < pivot.getCredit }
    iguais = array.select { |value| value.getCredit == pivot.getCredit }
    maiores = array.select { |value| value.getCredit > pivot.getCredit }

    self._quickSort(maiores) + iguais + self._quickSort(menores)
  end
end