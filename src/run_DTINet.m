dim_drug = 100;
dim_prot = 400;
dim_imc = 50;
rm_homo = false;
if rm_homo == true;
	interaction = load('../data/mat_drug_protein_remove_homo.txt');
else
	interaction = load('../data/mat_drug_protein.txt');
end
drug_feat = load(['../feature/drug_vector_d',num2str(dim_drug),'.txt']);
prot_feat = load(['../feature/protein_vector_d',num2str(dim_prot),'.txt']);
nFold = 10;
Nrepeat = 5;

AUROC = zeros(Nrepeat, 1);
AUPRC = zeros(Nrepeat, 1);

for p = 1 : Nrepeat
    fprintf('Repetition #%d\n', p);
    [AUROC(p), AUPRC(p)] = DTINet(p, nFold, interaction, drug_feat, prot_feat, dim_imc);
end

for i = 1 : Nrepeat
	fprintf('Repetition #%d: AUROC=%.6f, AUPR=%.6f\n', i, AUROC(i), AUPRC(i));
end
fprintf('Mean: AUROC=%.6f, AUPR=%.6f\n', mean(AUROC), mean(AUPRC));