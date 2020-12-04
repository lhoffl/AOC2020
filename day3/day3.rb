input_file = File.read('input.txt').gsub("\n", '').split('')

line_length = 31
right_move_amount = 3

number_of_trees = 0
next_index = 0

input_file.each_with_index do |character, index|

    if index == 0
        number_of_trees += 1 if character == '#'
        next_index = line_length + right_move_amount

    elsif index == next_index 
        number_of_trees += 1 if character == '#'
    
        next_index = index + right_move_amount
        remainder = index % line_length

        if remainder < (line_length - right_move_amount)
            next_index += line_length
        end
    end
end

puts number_of_trees