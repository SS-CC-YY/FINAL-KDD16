%% run test-douban
load('Douban.mat');
alpha = 0.82; maxiter = 30; tol = 1e-4;

tic;
S = FINAL(online, offline, online_node_label, offline_node_label, online_edge_label, ...
        offline_edge_label, H, alpha, maxiter, tol);

M = greedy_match(S);
[row, col] = find(M);
acc = size(intersect([col row], ground_truth, 'rows'), 1)/size(ground_truth, 1);

fprintf("accurancy of FINAL in Douban: %f\n", acc);
fprintf("time spent for FINAL-NE: %.2f sec\n", toc);

tic;
S2 = FINAL(online, offline, [], [], online_edge_label, ...
        offline_edge_label, H, alpha, maxiter, tol);

M2 = greedy_match(S2);
[row2, col2] = find(M2);
acc2 = size(intersect([col2 row2], ground_truth, 'rows'), 1)/size(ground_truth, 1);

fprintf("accurancy of FINAL-E in Douban: %f\n", acc2);
fprintf("time spent for FINAL-E: %.2f sec\n", toc);

tic;
S3 = FINAL(online, offline, online_node_label, offline_node_label, {}, ...
        {}, H, alpha, maxiter, tol);
M3 = greedy_match(S3);
[row3, col3] = find(M3);
acc3 = size(intersect([col3 row3], ground_truth, 'rows'), 1)/size(ground_truth, 1);

fprintf("accurancy of FINAL-N in Douban: %f\n", acc3);
fprintf("time spent for FINAL-N: %.2f sec\n", toc);