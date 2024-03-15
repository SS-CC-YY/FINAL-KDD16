%% run FINAL on ACM-DBLP-A, ACM-DBPL-P, cora, foursquare-twitter
resultsFileName = 'results_summary.txt';
fid = fopen(resultsFileName, 'wt');

topK = [1,10,30]; %HIT@K
alpha = 0.5; maxiter = 30; tol = 1e-4;

datafiles = dir(fullfile('datasets', '*.mat'));

for fileIdx = 1:length(datafiles)
    fileName = datafiles(fileIdx).name;
    filePath = fullfile('datasets', fileName);
    fprintf("processing %s\n", fileName);

    load(filePath)
    H = full(H);
    if contains(fileName, 'ACM-DBLP')
        S = FINAL(ACM, DBLP, ACM_node_feat, DBLP_node_feat, {}, {}, H, alpha, maxiter, tol);
        S = S.';
        reshape(S,length(ACM),[]);
    elseif contains(fileName, 'cora')
        S = FINAL(cora1, cora2, cora1_node_feat, cora2_node_feat, {}, {}, H, alpha, maxiter, tol);
        S = S.';
        reshape(S,length(cora1),[]);
    else
        S = FINAL(foursquare, twitter, [], [], {}, {}, H, alpha, maxiter, tol);
        S = S.';
        reshape(S,length(foursquare),[]);
    end

%M = greedy_match(S);
%[row, col] = find(M);
%acc = size(intersect([col row], gnd, 'rows'), 1)/size(gnd, 1);  
%fprintf("accurancy of FINAL-N in ACM-DBLP-A: %f\n", acc);
    
    [p, mrr]=get_hits(S,gnd,H',topK);

    fprintf(fid, "Results for %s:\n", fileName);
    for i=1:length(topK)
        fprintf(fid, 'top %d: %.3f\n', topK(i), p(i));
    end
    fprintf(fid, 'mrr: %.3f\n\n', mrr);
end

fclose(fid);
