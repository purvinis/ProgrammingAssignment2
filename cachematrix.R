## The function makeCacheMatrix returns a matrix object that, when called
## by makeCacheMatrix, will cache the matrix and compute and cache its
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

cacheSolve <- function(x, ...) {   ## Return a matrix that is the inverse of 'x'
      invOfx <- x$getInv()
      if(!is.null(invOfx)) {
            message("getting cached inverse data")
            return(invOfx)
      }
      data <- x$get()
      invOfX <- solve(data, ...)
      x$setInv(m)
      invOfX
}

n1 <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)
n1$get()              # retrieve the value of matix n1
n1$getInv()           # retrieve the value of n1, which should be NULL
n1$set(matrix(c(1,2,3,4),nrow=2, ncol=2))          # reset value with a new n1
cachemean(n1)          # notice new inverse
n1$getInv()           # retrieve it directly, now that it has been cached