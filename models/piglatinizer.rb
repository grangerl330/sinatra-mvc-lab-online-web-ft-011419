class PigLatinizer

  def vowel?(char)
    ["a", "e", "i", "o", "u"].include?(char.downcase)
  end

  def consonant?(char)
    !vowel?(char)
  end

  def piglatinize_word(word)
    if vowel?(word[0])
      word + "way"
    elsif consonant?(word[1])
      if consonant?(word[2])
        word[3..-1] + word[0..2] + "ay"
      else
        word[2..-1] + word[0..1] + "ay"
      end
    else
      word[1..-1] + word[0] + "ay"
    end
  end

  def piglatinize_sentence(sentence)
    sentence.split(" ").collect {|word| piglatinize_word(word)}.join(" ")
  end

  def piglatinize(input)
    input_array = input.split(" ")
    if input_array.length == 1
      piglatinize_word(input)
    else
      piglatinize_sentence(input)
    end
  end

end
