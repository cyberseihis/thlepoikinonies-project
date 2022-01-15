pkg load statistics;
M=1000;
SourceA= randn(1,M);
x= randn(M,1);
b=1;
a = [1 0.5 1/3 1/4 1/5 1/6];
y=filter(b,a,x);
[xq, centers, D]=Bquantizer(SourceA,3,min(SourceA),max(SourceA));
disp(norm(xq - SourceA));