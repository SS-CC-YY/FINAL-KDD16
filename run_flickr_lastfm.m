%% run flickr-lastfm
load('flickr-lastfm.mat');
alpha = 0.4; maxiter = 30; tol = 1e-4;
H = full(H);
tic;
S1 = FINAL(flickr, lastfm, flickr_node_label, lastfm_node_label, flickr_edge_label, ...
        lastfm_edge_label, H, alpha, maxiter, tol);
    
M1 = greedy_match(S1);
[row1, col1] = find(M1);
acc1 = size(intersect([col row], gndtruth, 'rows'), 1)/size(gndtruth, 1);
fprintf("accurancy of FINAL-NE in flickr-lastfm: %f\n", acc1);
fprintf("time spent for FINAL-NE: %.2f sec\n", toc);

tic;
S2 = FINAL(flickr, lastfm, flickr_node_label, lastfm_node_label, {}, ...
        {}, H, alpha, maxiter, tol);
    
M2 = greedy_match(S2);
[row2, col2] = find(M2);
acc2 = size(intersect([col2 row2], gndtruth, 'rows'), 1)/size(gndtruth, 1);
fprintf("accurancy of FINAL-N in flickr-lastfm: %f\n", acc2);
fprintf("time spent for FINAL-N: %.2f sec\n", toc);

tic;
S3 = FINAL(flickr, lastfm, [], [], flickr_edge_label, ...
        lastfm_edge_label, H, alpha, maxiter, tol);
    
M3 = greedy_match(S3);
[row3, col3] = find(M3);
acc3 = size(intersect([col3 row3], gndtruth, 'rows'), 1)/size(gndtruth, 1);
fprintf("accurancy of FINAL-E in flickr-lastfm: %f\n", acc3);
fprintf("time spent for FINAL-E: %.2f sec\n", toc);
