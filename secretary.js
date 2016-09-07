var firstXeroxTime = 7
var secondXeroxTime = 3
var quantity = 13

// determine faster and accordingly slower copiers

var minTime = Math.min(firstXeroxTime, secondXeroxTime)
var maxTime = Math.max(firstXeroxTime, secondXeroxTime)

// we think taht first copy's made by faster copier 
// determine the variables for the minimum quantity of copies that will be completed at the same 
// time by both copiers and the time it will take
  
// determine how many such passes we can do to perform a predetermined number of copies

var limit = Math.floor((quantity - 1)/(minTime + maxTime))

var simultaneousQuantity = 1 + limit * (minTime + maxTime)
var simultaneousTime = minTime + limit * minTime * maxTime
var totalTime = 0

if (quantity - simultaneousQuantity !== 0) {
  var remainQuantity = quantity - simultaneousQuantity
   
  // if there are copies which remain after performing simultaneous finish passes
  // we will go through all the combinations of the numbers of starts of both copiers to perform 
  // the remaining copies

  // define the boundaries of the multipliers for the number of passes for each copiers
  // if remainder is even we'll start from equal multipliers, if remainder is odd multipliers for faster copies
  // will be halved and rounded up remainder, for slower copier - halved and rounded down remainder or
  // remainder minus multipliers for faster copies 


  // determine for each combination the necessary minimum time, which will equal maximum of two times
  // choose of the selected the values minimum and that it is time to complete the remaining copies

  // also we need two variables: to record combinations and for the time required to perform the remaining copies

  var tempTimes = []

  for (i = Math.ceil(remainQuantity/2); i <= remainQuantity; i++) {
    tempTimes.push(Math.max(i * minTime, (remainQuantity-i) * maxTime))
  }
  var remainTime = Math.min.apply(null, tempTimes)

  totalTime = simultaneousTime + remainTime
} else { totalTime = simultaneousTime }

alert ("it will take " + totalTime + "s to make " + quantity + " copies")
