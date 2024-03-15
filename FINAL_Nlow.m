function S = FINAL_Nlow(A1, A2, N1, N2, H, alpha, r)


n1 = size(A1, 1); n2 = size(A2, 1);
K = size(N1, 2);

% Normalize node feature vectors
K1 = sum(N1.^2, 2).^(-0.5); K1(K1 == Inf) = 0;
K2 = sum(N2.^2, 2).^(-0.5); K2(K2 == Inf) = 0;
N1 = bsxfun(@times, K1, N1); % normalize the node attribute for A1
N2 = bsxfun(@times, K2, N2); % normalize the node attribute for A2
% Compute node feature cosine cross-similarity
N = spconvert([n1*n2, 1, 0]);
for k = 1: K
    N = N + kron(N1(:, k), N2(:, k));   % compute N as a kronecker similarity
end

% Compute the Kronecker degree vector
d = spconvert([n1*n2, 1, 0]);
%tic;
for k = 1: K 
    d = d + kron(A1 * N1(:, k), A2 * N2(:,k));
end
%fprintf('Time for degree: %.2f sec\n', toc);
DD = N .* d; D = DD.^(-0.5);
D(DD == 0) = 0;     % define inf to 0

% Low-rank approximation on A1 and A2 by eigenvalue decomposition
[U1,Lambda1]=eigs(A1,r);
[U2,Lambda2]=eigs(A2,r);


% compute matrix U
U = kron(U1, U2);
eta = U'*bsxfun(@times, D.*N, U);
% compute the matrix \Lambda by the equations in the paper
Lambda = kron(diag(1./diag(Lambda2)), diag(1./diag(Lambda1))) - alpha*eta;

h = H(:);

% compute the approximate closed-form solution based on the given equation
x = alpha*(1-alpha)*N.*D.*h;
s = (1-alpha)*h + D.*N.*(U*(Lambda\(U'*x)));
S = reshape(s,n2,n1);