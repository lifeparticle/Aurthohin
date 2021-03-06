class Generator
	# 11 Vowels
	# 'অ', 'আ', 'ই', 'ঈ', 'উ', 'ঊ', 'ঋ', 'এ', 'ঐ', 'ও', 'ঔ'
	SHORBORNO = [ "\u0985", "\u0986", "\u0987", "\u0988", "\u0989", "\u098A", "\u098B", "\u098F", "\u0990", "\u0993", "\u0994" ]

	# 39 Consonants
	# 'ক', 'খ', 'গ', 'ঘ', 'ঙ',
	# 'চ', 'ছ', 'জ', 'ঝ', 'ঞ',
	# 'ট', 'ঠ', 'ড', 'ঢ', 'ণ',
	# 'ত', 'থ', 'দ', 'ধ', 'ন',
	# 'প', 'ফ', 'ব', 'ভ', 'ম',
	# 'য', 'র', 'ল', 'শ', 'ষ',
	# 'স', 'হ', 'ড়', 'ঢ়', 'য়',
	# 'ৎ', 'ং', 'ঃ', '‍ঁ'
	BANJONBORNO = [ "\u0995", "\u0996", "\u0997", "\u0998", "\u0999",
					"\u099A", "\u099B", "\u099C", "\u099D", "\u099E",
					"\u099F", "\u09A0", "\u09A1", "\u09A2", "\u09A3",
					"\u09A4", "\u09A5", "\u09A6", "\u09A7", "\u09A8",
					"\u09AA", "\u09AB", "\u09AC", "\u09AD", "\u09AE",
					"\u09AF", "\u09B0", "\u09B2", "\u09B6", "\u09B7",
					"\u09B8", "\u09B9", "\u09DC", "\u09DD", "\u09DF",
					"\u09CE"]

	# Add this in version 2
	# "\u0982", "\u0983", "\u0981"


	def self.data_validation(line_count, paragraph_count, min_word_length, max_word_length, line_length)

		if (line_count <= 0)
			return "line number can't be zero or less than zero"
		elsif (paragraph_count <= 0)
			return "paragraph count can't be zero or less than zero"
		elsif(min_word_length <= 0)
			return "minimum word length can't be zero or less than zero"
		elsif(max_word_length <= 0)
			return "maximum word length can't be zero or less than zero"
		elsif(line_length <= 0)
			return "line length can't be zero or less than zero"
		elsif(min_word_length > max_word_length)
			return "maximum word length can't be smaller than minimum word length"
		elsif(line_length < max_word_length)
			return "line length can't smaller than minimum word length"
		else
			return true
		end

	end

	def self.generate(line_count, paragraph_count, min_word_length, max_word_length, line_length)
		is_valid = data_validation(line_count, paragraph_count, min_word_length, max_word_length, line_length)

		if (is_valid.kind_of? TrueClass)
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
		else
			puts "Error: #{is_valid}"
			return is_valid
		end
	end
end