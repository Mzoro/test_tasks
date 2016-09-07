
var candyWeight = 15
var tangerineWeight = 10
var appleWeight = 25
var giftWeight = 40

// define the limits of the multipliers of each component to limit the number of cycles passes

var firstLimit = Math.floor(giftWeight/candyWeight)
var secondLimit = Math.floor(giftWeight/tangerineWeight)
var thirdLimit = Math.floor(giftWeight/appleWeight)
var numberOfOptions = 0
var sum = 0

// we will go through all the options of combinations of the gift components
// and chek the weight of each combination equals specified weight

// if answer is positive, increase the number of gift options by 1

for (i = 0; i <= firstLimit; i++) { 
  for (j = 0; j <= secondLimit; j++) { 
    for (k = 0; k <= thirdLimit; k++) { 
      sum = i * candyWeight + j * tangerineWeight + k * appleWeight
      if (sum === giftWeight) { numberOfOptions++ }
    }  
  }    
}

alert("Number of gift options equals " + numberOfOptions)