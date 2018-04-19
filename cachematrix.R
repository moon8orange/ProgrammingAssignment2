## Put comments here that give an overall description of what your
## functions do

## Takes a matrix object and returns a list object
## The list has all the functions required to
## cache a matrix and it's calculated inverse

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solved) s <<- solved
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Takes a "makeCacheMatrix" object then
## calculates the inverse of  matrix and
## caches the result

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
