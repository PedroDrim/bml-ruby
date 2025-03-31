require "./src/provider/TableReader.rb"
require "./src/model/BenchmarkOutput.rb"
require "./src/provider/BenchmarkMeasure.rb"
require "./src/model/TableAnalysis.rb"
require "./src/provider/SummaryAnalysis.rb"
require "./src/provider/MergeSortAnalysis.rb"
require "./src/provider/QuickSortAnalysis.rb"
require "./src/provider/LanguageSortAnalysis.rb"
require "./src/model/UserInfo.rb"
require "./src/model/TimeFormat.rb"
require "./src/model/exception/InvalidParameterException.rb"

require "json"

class Start

    def initialize

        configFile = ARGV[0]
        properties = self.getConfig(configFile)

        input = properties["INPUT_FILENAME_LIST"]
        output = properties["OUTPUT_FILENAME"]

        benchmark = BenchmarkMeasure.new

        summaryAnalysis = SummaryAnalysis.new
        mergeSortAnalysis = MergeSortAnalysis.new
        quickSortAnalysis = QuickSortAnalysis.new
        languageSortAnalysis = LanguageSortAnalysis.new

        for index in 0...input.size do
            print("[START] Arquivo: #{index}\n")
            fileName = input[index]

            #==================================================
            # Leitura dos dados
            print("\t[LOG] Read\n")
            benchmark.startState("Read@#{index}")
            tableReader = TableReader.new(fileName)
            list = tableReader.readAll
            benchmark.endState("Read@#{index}")
            #==================================================
            # Analise dos dados (Summary)
            print("\t[LOG] Summary\n")
            benchmark.startState("SummaryAnalysis@#{index}")
            summary = summaryAnalysis.analysis(list)
            benchmark.endState("SummaryAnalysis@#{index}")
            #==================================================
            # Analise dos dados (Merge)
            print("\t[LOG] Merge\n")
            benchmark.startState("MergeAnalysis@#{index}")
            merge =  mergeSortAnalysis.analysis(list)
            benchmark.endState("MergeAnalysis@#{index}")
            #==================================================
            # Analise dos dados (Quick)
            print("\t[LOG] Quick\n")
            benchmark.startState("QuickAnalysis@#{index}")
            quick =  quickSortAnalysis.analysis(list)
            benchmark.endState("QuickAnalysis@#{index}")
            #==================================================
            # Analise dos dados (Language)
            print("\t[LOG] Language\n")
            benchmark.startState("LanguageAnalysis@#{index}")
            lang = languageSortAnalysis.analysis(list)
            benchmark.endState("LanguageAnalysis@#{index}")
            #==================================================
            print("[END] Arquivo: #{index}\n")
        end

        benchmark.export(output, TimeFormat::MILLISEGUNDOS)
    end

    def getConfig(fileName)
        lines = File.read(fileName)
        return JSON.parse(lines)
    end
    
end

Start.new
