function [p, mrr] = get_hits(s,gnd,H,topK)

    [~,I] = sort(s,2,'descend');
    [anchor1, anchor2] = find(H);
    anchors = [anchor1,anchor2];
    tests = setdiff(gnd, anchors, 'rows');
    len = length(tests);
    ind = [];
    mrr = 0;
    for i = 1:len
       tempind = find(I(tests(i,1),:)==tests(i,2));
       ind = [ind;tempind];
       %fprintf("dim of mrr: %d\n", size(mrr));
       %fprintf("dim of tempind: %d\n", size(tempind));
       %fprintf("%d\n", i);
       mrr = mrr+1/tempind;
    end
    mrr = mrr / len;
    p = [];
    for i = 1:length(topK)
        p = [p;length(find(ind<=topK(i)))];
    end
    p = p / len;
end