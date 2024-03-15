%%run ACM-DBLP-A
topK = [1,10,30]; %HIT@K
alpha = 0.5; maxiter = 30; tol = 1e-4;

load('datasets\ACM-DBLP-A.mat')
H = full(H);
S = FINAL(ACM, DBLP, ACM_node_feat, DBLP_node_feat, {}, {}, H, alpha, maxiter, tol);
        
S = S.';
reshape(S,length(ACM),[]);

[p, mrr]=get_hits(S,gnd,H',topK);
fprintf("Results for ACM-DBLP-A:\n");
for i=1:length(topK)
    fprintf('top %d: %.3f\n', topK(i), p(i));
end
fprintf('mrr: %.3f\n\n', mrr);