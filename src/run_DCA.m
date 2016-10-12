
maxiter = 20;
restartProb = 0.50;
dim_drug = 100;
dim_prot = 400;

drugNets = {'Sim_mat_drug_drug', 'Sim_mat_drug_disease', 'Sim_mat_drug_se', 'Sim_mat_Drugs'};
proteinNets = {'Sim_protein_protein', 'Sim_mat_protein_disease', 'Sim_mat_Proteins'};

tic
X = DCA(drugNets, dim_drug, restartProb, maxiter);
toc
tic
Y = DCA(proteinNets, dim_prot, restartProb, maxiter);
toc

dlmwrite(['../feature/drug_vector_d', num2str(dim_drug), '.txt'], X, '\t');
dlmwrite(['../feature/protein_vector_d', num2str(dim_prot), '.txt'], Y, '\t');
