%% run flickr-myspace
load('flickr-myspace.mat');
alpha = 0.4; maxiter = 30; tol = 1e-4;
H = full(H);
tic;
S1 = FINAL(flickr, myspace, flickr_node_label, myspace_node_label, flickr_edge_label, ...
        myspace_edge_label, H, alpha, maxiter, tol);
    
M1 = greedy_match(S1);
[row1, col1] = find(M1);
acc1 = size(intersect([col1 row1], gndtruth, 'rows'), 1)/size(gndtruth, 1);
fprintf("accurancy of FINAL-NE in flickr-myspace: %f\n", acc1);
fprintf("time spent for FINAL-NE: %.2f sec\n", toc);

tic;
S2 = FINAL(flickr, myspace, flickr_node_label, myspace_node_label, {}, ...
       {}, H, alpha, maxiter, tol);
    
M2 = greedy_match(S2);
[row2, col2] = find(M2);
acc2 = size(intersect([col2 row2], gndtruth, 'rows'), 1)/size(gndtruth, 1);
fprintf("accurancy of FINAL-N in flickr-myspace: %f\n", acc2);
fprintf("time spent for FINAL-N: %.2f sec\n", toc);

tic;
S3 = FINAL(flickr, myspace, [], [], flickr_edge_label, ...
        myspace_edge_label, H, alpha, maxiter, tol);
    
M3 = greedy_match(S);
[row3, col3] = find(M1);
acc3 = size(intersect([col3 row3], gndtruth, 'rows'), 1)/size(gndtruth, 1);
fprintf("accurancy of FINAL-E in flickr-myspace: %f\n", acc3);
fprintf("time spent for FINAL-E: %.2f sec\n", toc);