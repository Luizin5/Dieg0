class Textgen
  def initialize src
    @palavras = {}
    src = src.downcase

    create_arrays src
    src = src.split(" ")
      src.each_with_index { |word,i|
        @palavras[word] << if src[i+1] != nil
                                src[i+1]
                              else
                                src[rand(0..i)]
                              end
      }
    #p @palavras
  end

  def create_arrays src
    src.split.each { |a| @palavras[a] = [] }
  end

  def generate_sentence
    sentence = []
    palavra = @palavras[@palavras.keys.sample].sample
    rand(5..15).times {
      palavra = @palavras[palavra].sample
      sentence << palavra
    }
    sentence.join(" ")
  end

end

