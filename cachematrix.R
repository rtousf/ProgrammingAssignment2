## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#I mostly based on the original code and made the minimum change, in order to keep the code working
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

## Write a short comment describing this function

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
