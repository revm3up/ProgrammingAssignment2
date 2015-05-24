## The following R script creates two functions:  
## makeCacheMatrix() and cacheSolve().


## The makeCacheMatrix function creates a special "matrix" object which can 
## cache its own inverse. In addition, four defined functions are returned
## making them available to be called by other functions:
##
## 1. set or create a special matrix object
## 2. get or fetch a special matrix object
## 3. set a cached inverse of a special matrix object
## 4. get a cached inverse of a special matrix object

makeCacheMatrix <- function(x = matrix()) {
    
    ## Start with a cleaned out cache. 
        
    cachedInverse <- NULL
    
    ## If set is called, create a special `matrix` object using the calling
    ## function's passed argument `y` and assign it to `x`. Keep the cache
    ## cleared out.      
    
    set <- function(y) {
        x <<- y
        cachedInverse <<- NULL
        }
    
    ## Retrieve the calling function's return and assign it to `x`.    
    
    get <- function() x
    
    ## Store the inverse in a cached location.
        
    setInverse <- function(inverse) cachedInverse <<- inverse
    
    ## Retrieve the inverse from its cached location.
    
    getInverse <- function() cachedInverse
    
    ## Make these functions available to calling functions.
        
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The cacheSolve function returns an inverse for the special "matrix"
## object of the makeCacheMatrix function. A call to cacheSolve() will
## initially retrieve the cached inverse of an unchanged matrix if it exists.
## Otherwise, cacheSolve() will compute the inverse of the special
## "matrix" object made available by the makeCacheMatrix function.



cacheSolve <- function(x, ...) {
	
	## Return a matrix that is the inverse of 'x'
	        
    inversion <- x$getInverse()
    
    ## Check for a valid cache inverse. If it exists, return it.
    
        if (!is.null(inversion)) {
                
            message("getting cached data")
            return(inversion)
        }
    
    ## Retrieve the special `matrix` object `x` and assign to `data`. 
    
    data <- x$get()
    
    ## Compute the inverted matrix.
    
    inversion <- solve(data, ...)
    
    ## Store the inverted matrix in a cached location.
    
    x$setInverse(inversion)
    
    ## Make the inverted matrix available to the calling function.
    
    inversion
}