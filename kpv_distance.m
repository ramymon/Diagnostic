function [distance]=kpv_distance(A,B)

%Xapp=single(Xapp);
%Xtest=single(Xtest);
[n,~]=size(A);
[p,~]=size(B);

first = diag(A*A');
second = diag(B*B');
middle=A*B';

Asquare=repmat(first,1,p);
Bsquare=repmat(second',n,1);
distance=Asquare + Bsquare -2*middle;
distance=sqrt(distance);
end