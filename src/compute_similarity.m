Nets = {'mat_drug_drug', 'mat_drug_disease', 'mat_drug_se',...
	'mat_protein_protein', 'mat_protein_disease'};

for i = 1 : length(Nets)
	tic
	inputID = char(strcat('../data/', Nets(i), '.txt'));
	M = load(inputID);
	Sim = 1 - pdist(M, 'jaccard');
	Sim = squareform(Sim);
	Sim = Sim + eye(size(M,1));
	Sim(isnan(Sim)) = 0;
	outputID = char(strcat('../network/Sim_', Nets(i), '.txt'));
	dlmwrite(outputID, Sim, '\t');
	toc
end

% write chemical similariy to network/
M = load('../data/Similarity_Matrix_Drugs.txt');
dlmwrite('../network/Sim_mat_Drugs.txt',  M, '\t');
% write sequence similarity to network/
M = load('../data/Similarity_Matrix_Proteins.txt');
dlmwrite('../network/Sim_mat_Proteins.txt',  M, '\t');
