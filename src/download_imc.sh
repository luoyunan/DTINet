'''
Download IMC source code and build executable mex file
Author: Yunan Luo
'''
wget http://www.cs.utexas.edu/~dshin/software/IMC/leml-imf-src.zip
unzip leml-imf-src.zip
cd leml-imf
make matlab
cp matlab/train_mf.mexa64 ../
cd ..
rm leml-imf-src.zip
rm -r leml-imf 


