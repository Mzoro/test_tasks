number_of_person = 2

# define a variable, which will record the numbers of found friends of the specified person
# at once add specified person's number
RESULTS = [] << number_of_person

MATRIX = [[0, 0, 0, 0, 0], 
          [0, 0, 1, 0, 0], 
          [0, 1, 0, 0, 1], 
          [0, 0, 0, 0, 1], 
          [0, 0, 1, 1, 0]]

# define a helper function that will return an array,
# its elements are numbers of direct friends of specified person.

# we think that two person are friends, if at least one of them is a friend with other. 
# to test this we will compare the respective elements of the matrix with 1.

def direct_friends_of(i)
  friends_of_current = []
  for j in 0..MATRIX.length-1
    if MATRIX[j][i-1] == 1 || MATRIX[i-1][j] == 1
      friends_of_current << j+1
    end  
  end
  return friends_of_current    
end

def all_friends_of(person_id)
  
  # by the helper function determine direct friends
  
  direct_friends = direct_friends_of(person_id)

  # to find friends of friends will use recursion
  # i.e., call the "all_friends_of" function for each found friend 
  # if its number isn't present in the results array

  direct_friends.each do |friend|
    if !RESULTS.include?(friend)  
      RESULTS << friend
      all_friends_of(friend)
    end  
  end
end

all_friends_of(number_of_person)

RESULTS.delete(number_of_person)

print "person #{number_of_person} has #{RESULTS.length} friends"
print ": #{RESULTS}" if !RESULTS.empty?
