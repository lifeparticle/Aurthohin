require "../generator"
require "test/unit"

class TestGenerator < Test::Unit::TestCase

	def test_all_param_zero
		ARGV.replace [0, 0, 0, 0, 0]
		assert_equal("line number can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_all_param_negativie
		ARGV.replace [-1, -1, -1, -1, -1]
		assert_equal("line number can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_all_line_count
		ARGV.replace [-1, 1, 1, 1, 1]
		assert_equal("line number can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
		ARGV.replace [0, 1, 1, 1, 1]
		assert_equal("line number can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_paragraph_count
		ARGV.replace [1, -1, 1, 1, 1]
		assert_equal("paragraph count can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
		ARGV.replace [1, 0, 1, 1, 1]
		assert_equal("paragraph count can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_min_word_length
		ARGV.replace [1, 1, -1, 1, 1]
		assert_equal("minimum word length can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
		ARGV.replace [1, 1, 0, 1, 1]
		assert_equal("minimum word length can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_max_word_length
		ARGV.replace [1, 1, 1, -1, 1]
		assert_equal("maximum word length can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
		ARGV.replace [1, 1, 1, 0, 1]
		assert_equal("maximum word length can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_min_max
		ARGV.replace [1, 1, 20, 10, 1]
		assert_equal("maximum word length can't be smaller than minimum word length", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_line_length
		ARGV.replace [1, 1, 1, 1, -1]
		assert_equal("line length can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
		ARGV.replace [1, 1, 1, 1, 0]
		assert_equal("line length can't be zero or less than zero", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

	def test_line_length_max_word_length
		ARGV.replace [1, 1, 1, 100, 99]
		assert_equal("line length can't smaller than minimum word length", Generator.generate(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4]))
	end

end