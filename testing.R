#THIS IS JUST A TEST FILE FOR UNDERSTANDING THE EXAMPLE FOR VECTOR MEAN

makeVector <- function(x = numeric()) {
      m <- NULL
      set <- function(y) {
            x <<- y       #x will have the vector 2 3 4 5 from makeVector(c(2, 3, 4, 5))
            m <<- NULL
      }
      #browser()
      get <- function() x
      setmean <- function(mean) m <<- mean
      getmean <- function() m
      list(set = set, get = get,
           setmean = setmean,
           getmean = getmean)
      #browser()
}

cachemean <- function(x, ...) {
      m <- x$getmean()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- mean(data, ...)
      x$setmean(m)
      m
}

aVector <- makeVector(1:10)
aVector$get()               # retrieve the value of x
aVector$getmean()           # retrieve the value of m, which should be NULL
aVector$set(30:50)          # reset value with a new vector
cachemean(aVector)          # notice mean calculated is mean of 30:50, not 1:10
aVector$getmean()           # retrieve it directly, now that it has been cached


counter <- function() {   #function with no arguments
      x <- 0
      print(ls())    #ls returns string of objects in environment
      
      function() {
            x <<- x+1  #defined in this env, but stored up/out
            x
      }
}

ans <- counter

#https://www.youtube.com/watch?v=OpNFDi4mvgI
#https://stat.ethz.ch/R-manual/R-patched/library/base/html/assignOps.html


