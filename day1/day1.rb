require 'set'

input_set = SortedSet[]
File.foreach('input.txt') { |line| input_set.add(line.chomp!.to_i) }

input_set.each do |number| 
    difference = (number - 2020).abs()
    if(input_set.include? difference)
        puts "#{number} + #{difference} = 2020"
        answer = number * difference
        puts "Answer is #{answer}"
    end
end