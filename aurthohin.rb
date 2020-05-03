#!/usr/bin/env ruby
require_relative "generator"

if ARGV.empty?
	puts "Please specify any arguments"
	puts "1. line count"
	puts "2. paragraph count"
	puts "3. minimum word length"
	puts "4. maximum word length"
	puts "5. line length"
else
	line_count = ARGV.shift.to_i
	paragraph_count = ARGV.shift.to_i
	min_word_length = ARGV.shift.to_i
	max_word_length = ARGV.shift.to_i
	line_length = ARGV.shift.to_i
	Generator.generate(line_count, paragraph_count, min_word_length, max_word_length, line_length)
end