### Introduction
This repository contains R source code in the file cachematrix.R
that is required for the second programming assignment.
The functions written in R will take advantage of the scoping rules of
the R language and how they can be manipulated to preserve state inside
of an R object.

### Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. 

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` retrieves the inverse from the cache.

Computing the inverse of a square matrix is done with the `solve`
function in R.
