def count(string)
	@array = string.split(//)
	@unique_array = @array.uniq
	@high_count = @array.count(@array[0])
	@high_character = @array[0]
	@low_count = @array.count(@array[0])
	@low_character = @array[0]

	@unique_array.each_index do |index|
		@character = @unique_array[index]
		if @array.count(@character) > @high_count
			@high_count = @array.count(@character)
			@high_character = @character
		elsif @array.count(@character) == @high_count
			if @character.ord < @high_character.ord
				@high_count = @array.count(@character)
				@high_character = @character
			end
		elsif @array.count(@character) < @low_count
			@low_count = @array.count(@character)
			@low_character = @character
		elsif @array.count(@character) == @low_count
			if @character.ord < @low_character.ord
				@low_count = @array.count(@character)
				@low_character = @character
			end
		end
	end
	puts "Most Frequent Character: #{@high_character}"
	puts "Character Count: #{@high_count}"
	puts "Least Frequent Character: #{@low_character}"
	puts "Character Count: #{@low_count}"
end

@string = "bbAA!!!%%%"
count(@string)
