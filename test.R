
# This checks cachematrix to see how it handles
# matrixs of different sizes. Since it calls
# cacheSolve several times it should show that
# the data is actually being cached.
# Good output looks like the following:

# [1] "Good Result"
# getting cached data
# [1] "Good Result"
# getting cached data
# [1] "Good Result"
# getting cached data
# [1] "Good Result"


source("cachematrix.R")

m_size = 2:10
m_size = lapply(m_size, function(n) n*n)
set.seed(20)

for(i in m_size){
    l = sqrt(i)
    x <- matrix(rpois(i, 100), nrow = l, ncol = l)
    m <- makeCacheMatrix(x)
    invisible(cacheSolve(m))

    if( all(cacheSolve(m) == solve(x)) ){
        print("Good Result")
    }
}