ER=[];
for i = [2,4,8]
    for snr = [0:5:40]
        [ber ser] = mapm(i,snr);
        bser = [ber ser];
        ER=[ER bser'];
    endfor
endfor
semilogy(ER');