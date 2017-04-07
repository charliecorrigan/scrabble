class WordFinder
  
  def words
    File.read('/usr/share/dict/words').split("\n")
  end
  
  def letters_combinations(letters)
    all_combinations = []
    (1..letters.length).map do |num|
      combination = letters.combination(num).to_a
      all_combinations.push(*combination)
    end
    all_combinations.map do |combinations|
      combinations.join
    end
  end

  def for_letters(letters)
    all_combinations = letters_combinations(letters)
    words_included = all_combinations.map do |combination|
      is_a_word = words.any? do |word|
        word == combination
      end
    if is_a_word
      combination
    end
  end
  words_included.compact
  end

  def check_words_for_combination(combination)
    words.any? do |word|
      word == combination
    end
  end
end
