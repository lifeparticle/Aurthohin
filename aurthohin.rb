#!/usr/bin/env ruby

class Aurthohin

	# Vowels
	# 'অ', 'আ', 'ই', 'ঈ', 'উ', 'ঊ', 'ঋ', 'এ', 'ঐ', 'ও', 'ঔ'
	SHORBORNO = [ "\u0985", "\u0986", "\u0987", "\u0988", "\u0989", "\u098A", "\u098B", "\u098F", "\u0990", "\u0993", "\u0994" ]

	# Consonants
	# 'ক', 'খ', 'গ', 'ঘ', 'ঙ',
	# 'চ', 'ছ', 'জ', 'ঝ', 'ঞ',
	# 'ট', 'ঠ', 'ড', 'ঢ', 'ণ',
	# 'ত', 'থ', 'দ', 'ধ', 'ন',
	# 'প', 'ফ', 'ব', 'ভ', 'ম',
	# 'য', 'র', 'ল', 'শ', 'ষ',
	# 'স', 'হ', 'ড়', 'ঢ়', 'য়',
	# 'ৎ',' ং',' ঃ'
	BANJONBORNO = [ "\u0995", "\u0996", "\u0997", "\u0998", "\u0999",
					"\u099A", "\u099B", "\u099C", "\u099D", "\u099E",
					"\u099F", "\u09A0", "\u09A1", "\u09A2", "\u09A3",
					"\u09A4", "\u09A5", "\u09A6", "\u09A7", "\u09A8",
					"\u09AA", "\u09AB", "\u09AC", "\u09AD", "\u09AE",
					"\u09AF", "\u09B0", "\u09B2", "\u09B6", "\u09B7",
					"\u09B8", "\u09B9", "\u09DC", "\u09DD", "\u09EF",
					"\u09CE", "\u0982", "\u0983" ]

	def self.generate(line_count, paragraph_count, min_word_length, max_word_length, line_length)
		all = []
		all += SHORBORNO
		all += BANJONBORNO

		paragraph_count.times do |pn|
			line_count.times do
				line = ""
				while true
					random_word = "#{all.sample(rand(min_word_length..max_word_length)).join('')} "
					if line.length + random_word.length <= line_length
						line += "#{random_word}"
					else
						break
					end
				end
				puts line.strip
			end
			puts "\n" if pn + 1 < paragraph_count
		end
	end
end

line_count = 3
paragraph_count = 5
min_word_length = 5
max_word_length = 10
line_length = 20

line_count = ARGV[0].to_i unless ARGV[0].nil?
paragraph_count = ARGV[1].to_i unless ARGV[1].nil?
min_word_length = ARGV[2].to_i unless ARGV[2].nil?
max_word_length = ARGV[3].to_i unless ARGV[3].nil?
line_length = ARGV[4].to_i unless ARGV[4].nil?

if (line_count <= 0 || paragraph_count <= 0 || min_word_length <= 0 || max_word_length <= 0 || line_length <= 0 || (min_word_length > max_word_length))
	puts "Invalid value found"
else
	Aurthohin.generate(line_count, paragraph_count, min_word_length, max_word_length, line_length)
end
