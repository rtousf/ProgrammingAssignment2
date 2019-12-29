## This file contains two functions in order to have a matrix and its inverse stored in cache


## Here we have a funtion defining the object that we will use in order to store at the same time the matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  ##I only changed here the original function for solve, and renamed the functions to setmean-> setInv and getmean->getInv
  setInv <- function(solve) m <<- solve(x)
  getInv <- function() m
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

## This function calculates the inverse if it has not been calculated before.

cacheSolve  <- function(x, ...) {
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  #I also chacged the code here
  m <- solve(data)
  x$setInv(m)
  m
}
