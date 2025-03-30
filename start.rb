require './src/model/UserInfo.rb'

# Classe inicial do sistema
class Start

    # Método de inicialização do projeto
    # @param args Lista de parametros obtidos via console
    def initialize(args)

        tamanho = self._getParam(args)

        antes = Time.now
        list = Array.new

        (0..tamanho).each do |index|
            user = "user#{index}"
            password = "password#{index}"
            list.push(UserInfo.new(user, password))
        end

        time = (Time.now - antes) * 1000.0

        p "[Start] Ruby_#{tamanho}"
        p "[OK]Tamanho: #{tamanho}"
        p "[OK]Tempo: #{time} ms"
        p "[End] Ruby_#{tamanho}"
    end

    private
    # Método para captura e tratamento dos parametros obtidos via console
    # @param codes Lista de parametros obtidos via console
    # @return Tamanho de usuários á serem gerados
    def _getParam(codes)
        if(codes.size != 1)
            p "Parametros inválidos."
            exit(-1)
        end
            
        line = codes[0].to_i

        if(line <= 0)
            p "Quantidade de linhas menor que 1."
            exit(-1)
        end
       
        return line    
    end
end

Start.new(ARGV)
