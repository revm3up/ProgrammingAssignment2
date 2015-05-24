###Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Computing the inverse of a square matrix can be done
with the `solve` function in R. For example, if `X` is a square invertible
matrix, then `solve(X)` returns its inverse. For our purposes, we assume
that the matrix supplied is always invertible.

The cachematrix.R script defines a pair of functions that efficiently
work with a matrix inverse and cache. The functions are as follows:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
    
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.