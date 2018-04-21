## Put comments here that give an overall description of what your
## functions do

## Takes a matrix object and returns a list object
## The list has all the functions required to
## cache a matrix and it's calculated inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- x
  I <- NULL
  
  set <- function(y) {
      m <<- y
      I <<- NULL
  }
  get <- function() m
  setsolve <- function(solved) I <<- solved
  getsolve <- function() I
  
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Takes a "makeCacheMatrix" object then
## calculates the inverse of  matrix and
## caches the result

cacheSolve <- function(mo, ...) {
  solution <- mo$getsolve()
  if(!is.null(solution)) {
      message("getting cached data")
      return(solution)
  }else{
      solution <- solve( mo$get(), ...)
      mo$setsolve(solution)
      return(solution)
  }
}
