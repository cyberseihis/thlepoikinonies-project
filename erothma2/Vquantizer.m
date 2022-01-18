function [xq, centers, D] =  Vquantizer(x, N )
    %se zeygh
    x=[x(1:2:length(x)) ; x(2:2:length(x))];
    K=2^N;
    [idx, centers, DD] = kmeans(x',K);
    xq= centers(idx, : );
    xq=xq';
    D= sum(DD)/length(xq);
endfunction