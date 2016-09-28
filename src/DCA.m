function [X] = DCA(networks, dim, rsp, maxiter)
	Q = [];
	for i = 1 : length(networks)
		fileID = char(strcat('../network/', networks(i), '.txt'));
		net = load(fileID);
		tQ = diffusionRWR(net, maxiter, rsp);
		Q = [Q, tQ];
	end

	nnode = size(Q, 1);
	alpha = 1 / nnode;
	Q = log(Q + alpha) - log(alpha);

	Q = Q * Q';
	[U, S] = svds(Q, dim);	
	X = U * sqrt(sqrt(S));
end
