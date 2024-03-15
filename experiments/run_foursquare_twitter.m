%%run foursquare_twitter
topK = [1,10,30]; %HIT@K
alpha = 0.5; maxiter = 30; tol = 1e-4;

load('datasets\foursquare-twitter.mat')
H = full(H);
S = FINAL(foursquare, twitter, [], [], {}, {}, H, alpha, maxiter, tol);

S = S.';        
reshape(S,length(foursquare),[]);

[p, mrr]=get_hits(S,gnd,H',topK);
fprintf("Results for foursquare-twitter:\n");
for i=1:length(topK)
    fprintf('top %d: %.3f\n', topK(i), p(i));
end
fprintf('mrr: %.3f\n\n', mrr);