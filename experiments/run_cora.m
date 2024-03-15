%%run cora
topK = [1,10,30]; %HIT@K
alpha = 0.5; maxiter = 30; tol = 1e-4;

load('datasets\cora.mat')
H = full(H);
S = FINAL(cora1, cora2, cora1_node_feat, cora2_node_feat, {}, {}, H, alpha, maxiter, tol);
        
S = S.';
reshape(S,length(cora1),[]);

[p, mrr]=get_hits(S,gnd,H',topK);
fprintf("Results for cora:\n");
for i=1:length(topK)
    fprintf('top %d: %.3f\n', topK(i), p(i));
end
fprintf('mrr: %.3f\n\n', mrr);