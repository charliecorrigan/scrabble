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

  def test_word_returns_array
    assert_equal Array, WordFinder.new.words.class
  end

  def test_words_respond_to_incude_method
    skip
    assert WordFinder.new.words.include?("dog")
  end
 
  def test_for_letters
    skip
    finder = WordFinder.new
    found_words = finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o'])
    assert_equal Array, found_words.class
    assert_equal "cat", found_words
  end

  def test_letters_combinations
    finder = WordFinder.new    
    combinations = finder.letters_combinations(['r', 'e', 'x', 'a', 'p', 't', 'o'])
    assert_equal Array, combinations.class
    assert_equal 49, combinations.length
  end

  def test_check_words_for_combination
    skip
    finder = WordFinder.new
    refute finder.check_words_for_combination("doggipity")
    assert finder.check_words_for_combination("dog")

  end
end

