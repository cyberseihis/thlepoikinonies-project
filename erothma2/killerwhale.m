pkg load statistics;
M=10000;
SourceA= randn(1,M);
x= randn(M,1);
b=1;
a = [1 0.5 1/3 1/4 1/5 1/6];
y=filter(b,a,x);
[xq, centers, D]=Bquantizer(SourceA,3,min(SourceA),max(SourceA));
Sqnr=@(x,S) 10*log10(S/x);
[xq, centers, D2]=Vquantizer(SourceA,3);
disp(D2/D(length(D)));
%sxedon akrivos 1
beh= arrayfun(Sqnr,D,mean(SourceA.^ 2));
plot(beh);
beh;