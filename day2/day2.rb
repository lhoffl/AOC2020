input_file = File.read('input.txt')

valid_password_count = 0
input_file.each_line do |line|
    tokens = line.split
    range = tokens[0].split('-')
    range = range[0].to_i .. range[1].to_i

    required_character = tokens[1].gsub(/:/, '')
    password = tokens[2].split('')

    counts = password.each_with_object(Hash.new(0)) { |character, count| count[character] += 1 }
    
    if range.include?(counts[required_character])
        valid_password_count += 1
    end

end
puts "Answer for part one is #{valid_password_count}"

valid_password_count = 0
input_file.each_line do |line|
    tokens = line.split
    range = tokens[0].split('-')
    first_position = range[0].to_i - 1
    second_position = range[1].to_i - 1

    required_character = tokens[1].gsub(/:/, '')
    password = tokens[2].split('')

    count = 0
    count += 1 if (password[first_position] == required_character)
    count += 1 if (password[second_position] == required_character)
    
    if count == 1
        valid_password_count += 1
    end
end
puts "Answer for part two is #{valid_password_count}"