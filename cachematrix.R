## The function makeCacheMatrix returns a matrix object that, when called
## by makeCacheMatris, will cache the matrix and compute and cache its
## inverse. 

## This function creates a "matrix" object that can cache its inverse.
## cacheSolve() uses this function
## The function returns a list of functions

makeCacheMatrix <- function(x = matrix()) {
      invOfx <- NULL                                 #initiallize the inverse
      set <- function(y) {
            x <<- y                              #globally accessible
            invOfx <<- NULL                      #globally accessible
      }
      get <- function() x                        #cacheSolve can ask for matrix
      setInv <- function(solve) invOfx <<- solve
      getInv <- function() invOfx                #cacheSolve can ask for inverse
      list(set = set, get = get,
           setInv = setInv,
           getInv = getInv)
}


## This function computes the inverse of the special "matrix" returned 
##by makeCacheMatrix above. If the inverse has already been calculated 
##(and the matrix has not changed), then cacheSolve retrieves 
##the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

n1 <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)
