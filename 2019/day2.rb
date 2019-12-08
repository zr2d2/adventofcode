input = '1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,10,19,1,19,6,23,2,23,13,27,1,27,5,31,2,31,10,35,1,9,35,39,1,39,9,43,2,9,43,47,1,5,47,51,2,13,51,55,1,55,9,59,2,6,59,63,1,63,5,67,1,10,67,71,1,71,10,75,2,75,13,79,2,79,13,83,1,5,83,87,1,87,6,91,2,91,13,95,1,5,95,99,1,99,2,103,1,103,6,0,99,2,14,0,0'.split(',')

def puzzle(inputs,noun,verb)
    answer = inputs.dup

    answer[1] = noun

    answer[2] = verb

    answer.map!{ |e| e = e.to_i }

    answer.each_with_index do |number, index|
        next unless index%4 == 0

        index1 = answer[index+1]
        index2 = answer[index+2]
        index3 = answer[index+3]

        case number
        when 1
            answer[index3] = answer[index1] + answer[index2]
        when 2
            answer[index3] = answer[index1] * answer[index2]
        when 99
            return answer
        else
            puts "index:#{index} unknown opcode #{number}"
            
            return answer
        end
    end
end

limit = 100

(0..limit).each do |noun|
    (0..limit).each do |verb|
        results = puzzle input, noun, verb
        
        if results[0] == 19690720
            puts 100 * noun + verb

            exit
        end
    end
end