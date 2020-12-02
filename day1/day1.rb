require 'set'

input_set = SortedSet[]
File.foreach('input.txt') { |line| input_set.add(line.chomp!.to_i) }

input_set.each do |number| 
    difference = (number - 2020).abs()
    if input_set.include? difference
        answer = number * difference
        puts "Answer to part one is #{answer}"
        break
    end
end

input_set.each do |number| 
    difference = (number - 2020).abs()
    input_set.each do |another_number|
        next if number == another_number or another_number == difference or number == 0
        another_difference = (another_number - difference).abs()
        
        if input_set.include? another_difference
            answer_as_number = number + another_number + another_difference
            answer = number * another_number * another_difference
            puts "Answer to part two is #{answer}"
            return
        end
    end
end