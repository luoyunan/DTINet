## DTINet: A Network Integration Approach for Drug-Target Interaction Prediction
DTINet is a computational pipeline to predict novel drug-target interactions (DTIs) from heterogeneous network. DTINet focuses on learning a low-dimensional vector representation of features for each node in the heterogeneous network, and then predicts the likelihood of a new DTI based on these representations via a vector space projection scheme. See our paper on [Nature Communications](https://www.nature.com/articles/s41467-017-00680-8).

### Quick start
We provide an example script to run experiments on our dataset: 

- Run `run_DTINet.m`: predict drug-target interactions, and evaluate the results with cross-validation. 

**Note:** See the "Tutorial" section below for a detailed instruction on how to specify parameters of DTINet, or how to run DTINet on your own dataset.

### Code and data
#### `src/` directory
- `DTINet.m`: predict drug-target interactions (DTIs)
- `DCA.m`: compact feature learning by integrating heterogeneous network
- `diffusionRWR.m`: network diffusion algorithm (random walk with restart)
- `compute_similarity.m`: compute Jaccard similarity based on interaction/association network
- `auc.m`: evaluation script
- `run_DCA.m`: example code of running `DCA.m` for feature learning
- `run_DTINet.m`: example code of running `DTINet.m` for drug-target prediction
- `train_mf.mexa64`: pre-built binary file of inductive matrix completion algorithm (downloaded from [here](http://bigdata.ices.utexas.edu/software/inductive-matrix-completion/))
- `download_imc.sh`: download the inductive matrix completion source and build the executable library from source.

#### `data/` directory
- `drug.txt`: list of drug names
- `protein.txt`: list of protein names
- `disease.txt`: list of disease names
- `se.txt`: list of side effect names
- `drug_dict_map`: a complete ID mapping between drug names and DrugBank ID
- `protein_dict_map`: a complete ID mapping between protein names and UniProt ID
- `mat_drug_se.txt` 		: Drug-SideEffect association matrix
- `mat_protein_protein.txt` : Protein-Protein interaction matrix
- `mat_protein_drug.txt` 	: Protein-Drug interaction matrix
- `mat_drug_protein.txt` 	: Drug_Protein interaction matrix (transpose of the above matrix)
- `mat_drug_protein_remove_homo.txt`: Drug_Protein interaction matrix, in which homologous proteins with identity score >40% were excluded (see the paper).
- `mat_drug_drug.txt` 		: Drug-Drug interaction matrix
- `mat_protein_disease.txt` : Protein-Disease association matrix
- `mat_drug_disease.txt` 	: Drug-Disease association matrix
- `Similarity_Matrix_Drugs.txt` 	: Drug similarity scores based on chemical structures of drugs
- `Similarity_Matrix_Proteins.txt` 	: Protein similarity scores based on primary sequences of proteins
**Note**: drugs, proteins, diseases and side-effects are organized in the same order across all files, including name lists, ID mappings and interaction/association matrices.

#### `feature/` directory
We provided the pre-trained vector representations for drugs and proteins, which were used to produce the results in our paper.
- `drug_vector_d100.txt`
- `protein_vector_d400.txt`

### Third-party software
Our implementation requires the [Inductive Matrix Completion](http://bigdata.ices.utexas.edu/software/inductive-matrix-completion/) (IMC) library. We provide an executable binary file (`train_mf.mexa64`) in the src/ folder for convenience. The executable binary file was built on a typical Ubuntu 14.04 (64 bit) system.

We also provided the source code of IMC (`leml-imf-src.zip`) in the `src/` folder since the downloads from the IMC website is currently available. If you are using other Linux platforms or have issues using the provided binary file, please consider building the library from its source code by running `bash install_imc.sh`.

### Tutorial
1. Put interaction/association matrices in the `data/` folder.
2. Create a `network/` folder under `DTINet/` and run `compute_similarity.m`, which will compute the Jaccard similarity of drugs and proteins, based on interaction/association matrices.
3. Specify parameters (number of dimensions of feature vectors, restart probability, the maximum number of iterations) and run `run_DCA.m`, which will learn the feature vectors of drugs and proteins and save them in the `feature/` folder.
4. Set the path of feature vectors and corresponding parameters in `run_DTINet.m` and execute it. This script will predict the drug-target interactions and evaluate the results using a ten-fold cross-validation.

### Supplementary Information
#### `supplementary/` directory
- `Supplementary_Data_1.xlsx`:  The list of top 150 novel drug-target interactions predicted by DTINet, which was trained based all on drugs and targets that have at least one known interacting pair. Known drug-target pairs (corresponding to those non-zero entries in the drug-target interaction matrix) and novel predicted DTIs that share homologous proteins (with sequence identity scores >40%) with known DTIs were excluded from the list.
- `Supplementary_Data_2.xlsx`:  The entire list of novel drug-target interactions predicted by DTINet, which was trained based on all drugs and targets that have at least one known interacting pair.
- `Supplementary_Data_3.xlsx`:  Examples of the novel predictions which can be supported by the previous known evidence in the literature.

### Citation
Luo, Y., Zhao, X., Zhou, J., Yang, J., Zhang, Y., Kuang, W., Peng, J., Chen, L. & Zeng, J. A network integration approach for drug-target interaction prediction and computational drug repositioning from heterogeneous information. *Nature Communications* **8**, (2017).

    @article{Luo2017,
      author = {Yunan Luo and Xinbin Zhao and Jingtian Zhou and Jinglin Yang and Yanqing Zhang and Wenhua Kuang and Jian Peng and Ligong Chen and Jianyang Zeng},
      title = {A network integration approach for drug-target interaction prediction and computational drug repositioning from heterogeneous information},
      doi = {10.1038/s41467-017-00680-8},
      url = {https://doi.org/10.1038/s41467-017-00680-8},
      year  = {2017},
      month = {sep},
      publisher = {Springer Nature},
      volume = {8},
      number = {1},
      journal = {Nature Communications}
    }

### Contacts
If you have any questions or comments, please feel free to email Yunan Luo (luoyunan[at]gmail[dot]com).
