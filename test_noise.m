%%run_test_noise

noiseLevel = 0.05;
load('flickr-lastfm.mat');
nonZerosIndicesA1 = find(A1);
noiseA1 = (rand(size(nonZeroIndicesA1)) - 0.5) * 2 * noiseLevel;
A1(nonZeroIndicesA1) = A1(nonZeroIndicesA1) .* (1 + noiseA1);

nonZeroIndicesA2 = find(A2);
noiseA2 = (rand(size(nonZeroIndicesA2)) - 0.5) * 2 * noiseLevel;
A2(nonZeroIndicesA2) = A2(nonZeroIndicesA2) .* (1 + noiseA2);
S1 = FINAL(flickr, lastfm, flickr_node_label, lastfm_node_label, flickr_edge_label, ...
        lastfm_edge_label, H, alpha, maxiter, tol);