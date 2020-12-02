valid_password_count1 = 0
valid_password_count2 = 0

File.foreach('input.txt') do |line|
    tokens = line.split
    
    numbers = tokens[0].split('-')
    first_number = numbers[0].to_i
    second_number = numbers[1].to_i
    
    required_character = tokens[1].gsub(/:/, '')
    password = tokens[2].split('')

    character_counts = password.each_with_object(Hash.new(0)) { |character, count| count[character] += 1 }
    
    if (first_number .. second_number).include?(character_counts[required_character])
        valid_password_count1 += 1
    end
    
    required_character_count = 0
    required_character_count += 1 if (password[first_number - 1] == required_character)
    required_character_count += 1 if (password[second_number - 1] == required_character)
    
    if required_character_count == 1
        valid_password_count2 += 1
    end
end

puts "Answer for part one is #{valid_password_count1}"
puts "Answer for part two is #{valid_password_count2}"