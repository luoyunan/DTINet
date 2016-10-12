## DTINet: A Network Integration Approach for Drug-Target Interaction Prediction
DTINet is a new computational pipeline to predict novel drug-target interactions (DTIs) from heterogeneous network. DTINet focuses on learning a low-dimensional vector representation of features for each node in the heterogeneous network, and then predicts the likelihood of a new DTI based on these representations via a vector space projection scheme.

### Quick start
We provide an example script to run experiments on our dataset: 

- Run `run_DTINet.m`: predict drug-target interactions, and evaluate the results with cross-validation. 

**Note:** See the "Tutorial" section below for a detailed instruction on how to specify parameters of DTINet, or how to run DTINet on you own dataset.

### Code and data
#### `src/` directory
- `DTINet.m`: predict drug-target interactions (DTIs)
- `DCA.m`: compact feature learning by integrating heterogeneous network
- `diffusionRWR.m`: network diffusion algorithm (random walk with restart)
- `compute_similarity.m`: compute Jaccard similarity based on interaction/association network
- `auc.m`: evaluation script
- `run_DCA.m`: example code of running `DCA.m` for feature learning
- `run_DTINet.m`: example code of running `DTINet.m` for drug-target prediction
- `train_mf.m`exa64: executable binary file of inductive matrix completion algorithm (downloaded from [here](http://bigdata.ices.utexas.edu/software/inductive-matrix-completion/))

#### `data/` directory
- `drug.txt`: list of drug names
- `protein.txt`: list of protein names
- `disease.txt`: list of disease names
- `se.txt`: list of side effect names
- `drug_dict_map: a complete ID mapping between drug names and DrugBank ID
- `protein_dict_map: a complete ID mapping between protein names and UniProt ID
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
Our implementation uses the following library, while you do not need to install it since it is included in the src/ folder for convenience.
- [Inductive Matrix Completion](http://bigdata.ices.utexas.edu/software/inductive-matrix-completion/)

### Tutorial
1. Put interaction/association matrices in the `data/` folder.
2. Create a `network/` folder under `DTINet/` and run `compute_similarity.m`, which will compute the Jaccard similarity of drugs and proteins, based on interaction/association matrices.
3. Specify parameters (number of dimensions of feature vectors, restart probability, maximum number of iterations) and run `run_DCA.m`, which will learn the feature vectors of drugs and proteins and save them in the `feature/` folder.
4. Set the path of feature vectors and corresponding parameters in `run_DTINet.m` and execute it. This script will predict the drug-target interactions and evaluate the results using a ten-fold cross-validation.

### Citation
TBA

### Contacts
If you have any questions or comments, please feel free to email Yunan Luo (luoyunan[at]gmail[dot]com) and/or Jianyang Zeng (zengjy321[at]tsinghua[dot]edu[dot]cn).
