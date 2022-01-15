function [gser, gber] = mapm (M,Awg)
    Lb=10002;
    Ts=4;
    fc=2.5;
    bytesrc=floor(rand(1,Lb)*2);
    symba=[];
    for i = 0:length(bytesrc)/log2(M)-1
        y=i*log2(M)+1;
        ra=bytesrc(y:y+log2(M)-1);
        symba=[symba bin2dec(num2str(ra))];
    endfor
    sm= @(t,m) (sqrt(2/(Ts*10))*cos(2*pi*t*(fc + m/Ts)));
    tesr= sm(0.2,5);
    mes= @(m)   (arrayfun(sm, [0:0.1:Ts-0.1], m*ones(1,Ts/0.1)));
    sig=[];
    sysx=[];
    for i = symba
        sig= [sig;mes(i)];
    endfor
    vari=(10^(-Awg/10))/(2*log2(M));
    noise=sqrt(vari)*randn(size(sig));
    sig=sig+noise;
    for i = 0:M-1
        sysx= [sysx mes(i)'];
    endfor
    recie=sig*sysx;
    recie=recie';
    [tem, fm]=max(recie);
    fm=fm-1;
    gser= SER(symba,fm);
    gber= BER(symba,fm);
endfunction

function ret = BER (og,rec)
    bean=dec2bin(og);
    beam=dec2bin(rec);
    beam=beam-bean;
    ret= length(find(beam))/length(og);
endfunction

function ret = SER (og,rec)
    ret= length(find(og-rec))/length(og);
endfunction