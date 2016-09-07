
var matrix = [[0, 1, 0], 
              [1, 0, 1], 
              [0, 1, 0]]
var numberOfPerson = 1

// define a variable, which will record the numbers of found friends of the specified person
// at once add specified person's number

var results = []
results.push(numberOfPerson)

// define a helper function that will return an array,
// its elements are numbers of direct friends of specified person.

// we think that two person are friends, if at least one of them is a friend with other. 
// to test this we will compare the respective elements of the matrix with 1.

function directFriendsOf(i) {
  var friendsOfCurrent = []
  for (j = 0; j < matrix.length; j++) {
    if ((matrix[j][i-1] === 1) || (matrix[i-1][j] === 1)){
      friendsOfCurrent.push(j+1)
    }
  }
  return friendsOfCurrent
}

function allFriendsOf(person_id) {

 // by the helper function determine direct friends

  directFriends = directFriendsOf(person_id)
  for (j = 0; j < directFriends.length; j++) {
    friend = directFriends[j]
    if (results.indexOf(friend) === -1 ) {  
      results.push(friend)
      allFriendsOf(friend)
    }
  }
}

allFriendsOf(numberOfPerson)

results.splice(0, 1)

if (results.length !== 0) {
  alert("person " + numberOfPerson + " has " + results.length + " friends: " + results)  
} else alert("person " + numberOfPerson + " has " + results.length + " friends")
