## Aloha from Kauai and thank you (Mahalo) for reviewing my code

## The function makeCacheMatrix returns a matrix object that, when called
## by makeCacheMatrix, will cache the matrix and compute and cache its
## inverse. 

## This function creates a "matrix" object that can cache its inverse.
## cacheSolve() uses this function
## cacheSolve() needs a makeCacheMatrix object as its argument

makeCacheMatrix <- function(x = matrix()) {
      invOfx <- NULL                             #initiallize the inverse
      set <- function(y) {                       #store matrix and initial inverse
            x <<- y                              #globally accessible
            invOfx <<- NULL                      #globally accessible
      }
      get <- function() x                        #cacheSolve can get matrix via funct
      setInv <- function(solve) invOfx <<- solve #funct to stor inverse
      getInv <- function() invOfx                #cacheSolve can ask for inverse
      list(set = set, get = get,                 #return values and functions
           setInv = setInv,
           getInv = getInv)
      
}


## This function computes the inverse of the special "matrix" returned 
##by makeCacheMatrix above. If the inverse has already been calculated 
##(and the matrix has not changed), then cacheSolve retrieves 
##the inverse from the cache.

cacheSolve <- function(x, ...) {   ## Return a matrix that is the inverse of 'x'
     
      invOfx <- x$getInv()          #get cached inverse
      if(!is.null(invOfx)) {        #check to see if inverse is null
            message("getting cached inverse data")
            return(invOfx)          #if not null, return invers
      }
                                    
      data <- x$get()                #if cached inv was null, then calc. for this
      invOfx <- solve(data, ...)     #data using Solve(x) function
      x$setInv(invOfx)               #store in cache new inverse
      invOfx                         #return inverse
}

#Code for testing verification:
#If you uncomment this code, you can test the functions
#
#n1 <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)
#specialm <- makeCacheMatrix(n1)
#cacheSolve(specialm)



