'''
Compile IMC source code and build executable mex file
Author: Yunan Luo
Date: July 29, 2018
'''
unzip leml-imf-src.zip
cd leml-imf
make matlab
cp matlab/train_mf.mexa64 ../
cd ..
rm -r leml-imf 


