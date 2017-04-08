gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test
  
  
  def test_it_exists
    word_finder = WordFinder.new
    assert_equal WordFinder, word_finder.class
  end

  def test_words_return_attributes
    word_finder = WordFinder.new
    words = word_finder.words
    assert_equal Array, words.class
    assert_equal String, words.first.class
    assert_equal 235886, words.count 
    assert_equal "abalienate", words[40] 
    assert_equal "anticreep", words[10020]
  end
  
  def test_is_in_dictionary_returns_predictable_values
    word_finder = WordFinder.new
    words = word_finder.words
    word_found = word_finder.is_in_dictionary?("awesome", words)
    assert word_found
    word_found = word_finder.is_in_dictionary?("garbelahhsk", words)
    refute word_found
  end

  def test_assemble_all_combinations
    word_finder = WordFinder.new
    available_letters = ['r', 'e', 'x', 'a', 'p', 't', 'o']
    all_combinations = word_finder.assemble_all_combinations(available_letters)
    assert_equal Array, all_combinations.class
    assert_equal String, all_combinations.first.class
    assert_equal "r", all_combinations.first
    assert_equal "xe", all_combinations[20]
  end

  def test_for_letters_return
    word_finder = WordFinder.new
    available_letters = ['r', 'e', 'x', 'a']
    possible_words = word_finder.for_letters(available_letters)
    assert_equal Array, possible_words.class
    assert_equal String, possible_words.first.class
    assert_equal 21, possible_words.count
    assert_equal ["aer", "aero", "aper", "apert", "aport", "ar", "are", "art", "arx", "ear", "er", "era", "export", "extra"], possible_words
  end
  
end

