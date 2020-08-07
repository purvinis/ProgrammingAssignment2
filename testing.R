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

ans = makeVector(c(2,3,4,5))

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


