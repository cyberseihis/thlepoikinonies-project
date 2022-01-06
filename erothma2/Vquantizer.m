function [xq, centers, D] =  Vquantizer(x, N )
    K=2^N;
    [idx, centers, DD] = kmeans(x',K);
    xq= centers(idx, : );
    xq=xq';
    D= mean(DD);
endfunction