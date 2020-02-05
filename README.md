# Singular-Value-Decomposition

#### SVD
Singular Value Decomposition (SVD) factorizes any real matrix A into a product of three matrices S, U and V.  Matrix S is a diagonal matrix containing the singular values matrix A arranged in descending form. Matrices U and V are orthogonal such as U contains the left singular vectors whereas V contains the right singular vectors. This work uses One Sided Jacobi algorithm to calculate SVD. The Jacobi rotations are calculated on every 2 × 2 submatrix to zero out all non-zero off-diagonal elements of the original matrix. Number of iterations implemented are 5 which are used to converge. The high accuracy of the algorithm can be seen from the error plot.

#### Error Range
1.	Floating Point function and MATLAB function: 10-16 – 10-15
2.	Floating Point function and Fixed Point function: 10-6 – 10-4

#### Error Plot
<img src="Images/svd.jpg">

#### QR Decompostion
Implemented QR Decomposition using Householder Reflections algorithm and Givens Rotations algorithm
<img src="Images/results.jpg">

#### Error Plot
n=4
<img src="Images/qr_n_4.jpg">

n=5
<img src="Images/qr_n_5.jpg">

n=10
<img src="Images/qr_n_10.jpg">
