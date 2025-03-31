require './src/model/UserInfo.rb'
require './src/model/exception/InvalidParameterException.rb'
require './src/model/TableAnalysis.rb'

# Classe para ordenação usando MergeSort
class MergeSortAnalysis
  include TableAnalysis

  # Realiza a ordenação MergeSort
  # @param userInfoList [Array<UserInfo>] Lista de dados a ser analisada
  # @return [Array<UserInfo>] Lista ordenada
  def analysis(userInfoList)
    if(userInfoList.nil? || userInfoList.size == 0)
      raise InvalidParameterException.new("'userInfoList' é nil ou vazio")
  end

    self._mergeSort(userInfoList)
  end

  private

  # Inicia o MergeSort
  # @param array [Array<UserInfo>] Lista a ser ordenada
  # @return [Array<UserInfo>] Lista ordenada
  def _mergeSort(array)
    return array if array.length <= 1

    meio = array.length / 2
    esquerda = self._mergeSort(array[0...meio])
    direita = self._mergeSort(array[meio..-1])
    self._merge(esquerda, direita)
  end

  # Unifica os vetores ordenados
  # @param esquerda [Array<UserInfo>] Vetor da esquerda
  # @param direita [Array<UserInfo>] Vetor da direita
  # @return [Array<UserInfo>] Lista unificada
  def _merge(esquerda, direita)
    response = []
    while !esquerda.empty? && !direita.empty?
      if esquerda.first.getCredit > direita.first.getCredit
        response << esquerda.shift
      else
        response << direita.shift
      end
    end
    response + esquerda + direita
  end
end
