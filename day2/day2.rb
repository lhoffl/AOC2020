input_file = File.read('input.txt')

valid_password_count1 = 0
valid_password_count2 = 0
input_file.each_line do |line|
    tokens = line.split
    numbers = tokens[0].split('-')
    range = numbers[0].to_i .. numbers[1].to_i
    
    first_position = numbers[0].to_i - 1
    second_position = numbers[1].to_i - 1

    required_character = tokens[1].gsub(/:/, '')
    password = tokens[2].split('')

    counts = password.each_with_object(Hash.new(0)) { |character, count| count[character] += 1 }
    
    if range.include?(counts[required_character])
        valid_password_count1 += 1
    end
    
    count = 0
    count += 1 if (password[first_position] == required_character)
    count += 1 if (password[second_position] == required_character)
    
    if count == 1
        valid_password_count2 += 1
    end
end
puts "Answer for part one is #{valid_password_count1}"
puts "Answer for part two is #{valid_password_count2}"