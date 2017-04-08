class WordFinder
  
 def words
    File.read('/usr/share/dict/words').split("\n")
  end
  
  def is_in_dictionary?(letter_combination, dictionary)
    dictionary.any? do |word|
      word == letter_combination
    end
  end

  def assemble_all_combinations(available_letters)
    combinations = (1..available_letters.length).map do |number|
      combo_set = available_letters.permutation(number).to_a.map do |combo|
        combo.join
      end
    end
    all_combinations = combinations.join(", ")
    all_combinations.split(", ")
  end

  def for_letters(available_letters)
    dictionary = words
    all_combinations = assemble_all_combinations(available_letters)
    possible_words = all_combinations.map do |letter_combination|
      if is_in_dictionary?(letter_combination, dictionary)
        letter_combination
      else
        next
      end
    end
    possible_words.compact.sort
  end

end
