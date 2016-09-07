def count_number_of_options(first_weight, second_weight, third_weight, total_weight)

  # define the limits of the multipliers of each component to limit the number of cycles passes

  first_limit = total_weight.div(first_weight)
  second_limit = total_weight.div(second_weight)
  third_limit = total_weight.div(third_weight)
  number_of_options = 0

  # we will go through all the options of combinations of the gift components
  # and chek the weight of each combination equals specified weight

  # if answer is positive, increase the number of gift options by 1

  for i in 0..first_limit
    for j in 0..second_limit
      for k in 0..third_limit
        if i * first_weight + j * second_weight + k * third_weight == total_weight
          number_of_options += 1 
        end  
      end
    end
  end
  return number_of_options    
end

puts "Number of gift options equals #{count_number_of_options(10, 25, 15, 40)}"


  