pkg load statistics;
M=10000;
SourceA= randn(1,M);
x= randn(M,1);
b=1;
a = [1 0.5 1/3 1/4 1/5 1/6];
SourceB=filter(b,a,x)';
Sqnr=@(x,S) 10*log10(S/x);
N=[2:4];
for ni = N
    [xq, centers, D]=Bquantizer(SourceA,ni,min(SourceA),max(SourceA));
    [xq, centers, D2]=Vquantizer(SourceA,ni*2);
    disp([Sqnr(D(length(D)),mean(SourceA.^ 2)) , Sqnr(D2,mean(SourceA.^ 2)) , D(length(D)), D2]);
endfor

for ni = N
    [xq, centers, D]=Bquantizer(SourceB,ni,min(SourceB),max(SourceB));
    [xq, centers, D2]=Vquantizer(SourceB,ni*2);
    disp([Sqnr(D(length(D)),mean(SourceB.^ 2)) , Sqnr(D2,mean(SourceB.^ 2)) , D(length(D)), D2]);
endfor

beh= arrayfun(Sqnr,D,mean(SourceB.^ 2));
plot(beh);