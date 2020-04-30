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
	line_count = ARGV[0].to_i unless ARGV[0].nil?
	paragraph_count = ARGV[1].to_i unless ARGV[1].nil?
	min_word_length = ARGV[2].to_i unless ARGV[2].nil?
	max_word_length = ARGV[3].to_i unless ARGV[3].nil?
	line_length = ARGV[4].to_i unless ARGV[4].nil?
	Generator.generate(line_count, paragraph_count, min_word_length, max_word_length, line_length)
end