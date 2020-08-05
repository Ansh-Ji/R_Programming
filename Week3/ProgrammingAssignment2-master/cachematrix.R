## This function are part of R programming week 3 assignment to help understand 
#lexical scoping.The below function reduced repeated computation by caching data

##This function creates a special "matrix" object i.e inv that cache its inverse.
makeCacheMatrix <- function(x = matrix()) { #set default to a matrix
  inv <- NULL #initialize inv as null, will hold the value of inverse
  set <- function(y) {
    x <<- y   #value of matrix in parent environmment
    inv <<- NULL #if there is a new matrix set inv to null
  }
  get <- function() x  #returns the value of matrix argument
  setinverse <- function(inverse) inv <<- inverse #assign the value of inverse in parent environment
  getinverse <- function() inv #assign the value of inverse where called
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



# This function computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above. If the inverse has already been calculated 
#(and the matrix has not changed), then the cachesolve should retrieve the 
#inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
