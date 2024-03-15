# Forked FINAL: Fast Attributed Network Alignment from FINAL-KDD16 for UIUC CS512 course project
## Overview
The package contains the following files:
- algorithm
	- FINAL.m: attributed network alignment algorithm on networks with categorical/numerical attributes on nodes and/or edges or none
- datasets
    |dataset   |#nodes   |#edges   |#attri   |
    |---|---|---|---|
    |ACM(A)<br>DBLP(A)   |9,916<br>9,872   |44,808<br>39,561   |17   |
    |ACM(P)<br>DBLP(P)   |9,916<br>9,872   |44,808<br>39,561   |0   |
    |cora1<br>cora2   |2,708<br>2,708   |6,334<br>4,542   |1,433   |
    |foursquare<br>twitter   |5,313<br>5,210   |54,233<br>130,575   |0   |
- experiments
	- demo.m demo code to run final algorithm on all networks and save results in result folder
	- run_ACM_DBLP_A.m: demo code to run on ACM-DBLP-A networks
	- run_ACM_DBLP_P.m: demo code to run on ACM-DBLP-P networks
	- run_cora.m: demo code to run on cora networks
	- run_Douban.m: demo code to run on Douban online-offline networks
	- run_foursquare_twitter.m: demo code to run on Foursquare-Twitter networks
- result
	- results_summary.txt: HIT@1,10,30 and mrr results of FINAL on different networks
- utils
	- greedy_match.m: greedy matching algorithm to get the one-to-one mappings based on the alignment matrix
	- get_hits.m: calculate Hits@K and Mean Reciprocal Rank(MRR) based on the alignment matrix


## How to use
Directly run matlab files in the experiments folder to reproduce results

## Reference
- Zhang, Si, and Hanghang Tong. "FINAL: Fast Attributed Network Alignment." Proceedings of the 22nd ACM SIGKDD International Conference on Knowledge Discovery and Data Mining. ACM, 2016.

- Zhang, Si, and Hanghang Tong. "Attributed network alignment: Problem definitions and fast solutions." IEEE Transactions on Knowledge and Data Engineering 31.9 (2018): 1680-1692.

- Zhichen Zeng, Si Zhang, Yinglong Xia, and Hanghang Tong. 2023. PARROT: Position-Aware Regularized Optimal Transport for Network Alignment (WWW '23). Association for Computing Machinery, New York, NY, USA, 372-382. https://doi.org/10.1145/3543507.3583357
