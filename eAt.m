function [inv_laplace] = eAt(A)
syms s

inv_laplace = ilaplace(inv(s*eye(length(A))-A));


% EOF