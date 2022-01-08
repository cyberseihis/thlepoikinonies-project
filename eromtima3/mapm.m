function mapm ()
    Ts=4;
    M=8;
    fc=2.5;
    bytesrc=floor(rand(1,10002)*2);
    symba=[];
    for i = 0:length(bytesrc)/log2(M)-1
        y=i*log2(M)+1;
        ra=bytesrc(y:y+log2(M)-1);
        symba=[symba bin2dec(num2str(ra))];
    endfor
    gt = @(t) ((t<=0 && t<Ts)*sqrt(2/Ts));
    sm= @(t,m) (gt(t)*cos(2*pi*t*(fc + m/Ts)));
    tesr= sm(0.2,5);
    mes= @(m)   (arrayfun(sm, [0:0.1:Ts-0.1], m*ones(1,Ts/0.1)));
    sig=[];
    for i = symba
        sig= [sig mes(i)];
    endfor
endfunction