
#test with the following 2*2 matrix which returns the correct results
#mat.sample = matrix(c(3,-7,5,2), nrow=2, ncol=2)
#inverse of mat.sample = matrix(c(0.04878049,0.17073171,-0.12195122,0.07317073))
#test(mat.sample)

set.seed(1000000)
r = rnorm(1000000)
mat.sample = matrix(r, nrow=500, ncol=500)

testCache(mat.sample)

#The function testCache uses sample matrix data and invokes makeCacheMatrix and
#cacheSolve functions 
#and records the time taken to perform inverse of a matrix without Cache and with Cache
## mat: an invertible matrix
testCache = function(mat){
        
        temp = makeCacheMatrix(mat)
        
        start.time = Sys.time()
        cacheSolve(temp)
        dur = Sys.time() - start.time
        print(dur) #Time difference of 0.216012 secs noted on windows7
        
        #getting cached data
        start.time = Sys.time()
        cacheSolve(temp)
        dur = Sys.time() - start.time
        print(dur) #Time difference of 0 secs noted

}

## This function takes x, a square invertible matrix as the input
## returns: a list containing functions to
##              1. set the matrix
##              2. get the matrix
##              3. set the inverse
##              4. get the inverse
makeCacheMatrix <- function(x = matrix()) {
  
        inv = NULL
        set = function(y) {
          x <<- y
          inv <<- NULL
        }
        get = function() x
        setinv = function(inverse) inv <<- inverse 
        getinv = function() inv
        list(set=set, get=get, setinv=setinv, getinv=getinv)  # this list is the input to cacheSolve()   
}


## @x: output of makeCacheMatrix()
## return: inverse of the original matrix input to makeCacheMatrix()
cacheSolve <- function(x, ...) {
        
        inv = x$getinv()
        
        # if the inverse has already been calculated
        if (!is.null(inv)){
                # get it from the cache and skips the computation. 
                message("getting cached data")
                return(inv)
        }
        
        # otherwise, calculates the inverse 
        mat.data = x$get()
        inv = solve(mat.data, ...)
        
        # sets the value of the inverse in the cache via the setinv function.
        x$setinv(inv)
        
        return(inv) # Return a matrix that is the inverse of 'x'
}
