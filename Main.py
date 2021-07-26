# This homework was produced by Jesus Garcia for class CSE 881 Assignment 1

# Notes: JT I have manually re-named the eigen_face files but used your script to produce them after some matrix manipulation
import scipy.io
import numpy as np
import matlab.engine

eng = matlab.engine.start_matlab()
mat = scipy.io.loadmat('mnist_all.mat')
data = []

# QUESTION 5A CONCATENATING DATA
data.append(mat.get('train0')[0:50][0:784])
data.append(mat.get('train1')[0:50][0:784])
data.append(mat.get('train2')[0:50][0:784])
data.append(mat.get('train3')[0:50][0:784])
X = np.concatenate(data)

# QUESTION 5B PLOTTING IMAGES USING MATLAB WITH script_runner file AND GENERATING digit_image.jpg
X = matlab.single(X.tolist())
U = np.array(eng.script_runner(X))

# QUESTION 5C PLOTTING IMAGES OF FIRST TWO PRINCIPLE COMPONENTS
u1 = U[:,0]
u2 = U[:,1]
temp1 = matlab.single(u1.tolist())
temp2 = matlab.single(u2.tolist())

#Eigenface Production
eng.script_runner_postPCA(temp1, "_first_eigenface.jpg", nargout=0) # stored in file digit_image_postPCA_first_eigenface.jpg
eng.script_runner_postPCA(temp2, "_second_eigenface.jpg", nargout=0) # stored in file digit_image_postPCA_second_eigenface.jpg

# QUESTION 5D REDUCE DIMENSIONALITY AND GENERATING reduced_dimensions.jpg
Z = scipy.io.loadmat('MAT-Z.mat')
Z = np.array(Z.get('Z'))
Z = Z[:, 0:2]
Z = matlab.single(Z.tolist())
eng.dimensionality_reduction(Z, nargout=0)

# QUESTION 5E AND 5F REDUCE MATRIX RANK AND PRINT NEW IMAGES
# Rank 2
W = scipy.io.loadmat('MAT-W.mat')
W = np.array(W.get('W'))
W = matlab.single(W.tolist())
eng.Ranked(W, "_rank2.jpg",nargout=0)

# Rank 50
W50 = scipy.io.loadmat('MAT-W50.mat')
W50 = np.array(W50.get('W50'))
W50 = matlab.single(W50.tolist())
eng.Ranked(W50, "_rank50.jpg",nargout=0)
