def count_time(first_time, second_time, quantity)
  
  # determine faster and accordingly slower copiers
  min_time = [first_time, second_time].min
  max_time = [first_time, second_time].max
 
  # we think taht first copy's made by faster copier 
  # determine the variables for the minimum quantity of copies that will be completed at the same 
  # time by both copiers and the time it will take
  
  # determine how many such passes we can do to perform a predetermined number of copies
  # let's check if maxtime is divisible by mintime

  if max_time.divmod(min_time)[1].zero?
    limit = (quantity - 1).div(1 + max_time.div(min_time))
    simultaneous_quantity = 1 + limit * (1 + max_time.div(min_time))
    simultaneous_time = min_time + limit * max_time
  else
    limit = (quantity - 1).div(min_time + max_time)
    simultaneous_quantity = 1 + limit * (min_time + max_time)
    simultaneous_time = min_time + limit * min_time * max_time
  end
  
  if quantity - simultaneous_quantity != 0
    remain_quantity = quantity - simultaneous_quantity
    
    # if there are copies which remain after performing simultaneous finish passes
    # we will go through all the combinations of the numbers of starts of both copiers to perform 
    # the remaining copies

    # define the boundaries of the multipliers for the number of passes for each copiers
    # if remainder is even we'll start from equal multipliers, if remainder is odd multipliers for faster copies
    # will be halved and rounded up remainder, for slower copier - halved and rounded down remainder or
    # remainder minus multipliers for faster copies 


    # determine for each combination the necessary minimum time, which will equal maximum of two times
    # choose of the selected the values minimum and that it is time to complete the remaining copies

    # also we need two variables: to record combinations and for the time required to perform the remaining copies
    temp_times = []

    for i in remain_quantity.fdiv(2).ceil..remain_quantity
      temp_times << [ i * min_time, (remain_quantity-i) * max_time].max
    end
    remain_time = temp_times.min

    total_time = simultaneous_time + remain_time
  else
    total_time = simultaneous_time
  end
  return total_time
end
puts count_time(3, 5, 20)