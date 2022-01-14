function mapm (M,Awg)
    Lb=1002;
    Ts=4;
    fc=2.5;
    bytesrc=floor(rand(1,Lb)*2);
    symba=[];
    for i = 0:length(bytesrc)/log2(M)-1
        y=i*log2(M)+1;
        ra=bytesrc(y:y+log2(M)-1);
        symba=[symba bin2dec(num2str(ra))];
    endfor
    sm= @(t,m) (sqrt(2/Ts)*cos(2*pi*t*(fc + m/Ts)));
    tesr= sm(0.2,5);
    mes= @(m)   (arrayfun(sm, [0:0.1:Ts-0.1], m*ones(1,Ts/0.1)));
    sig=[];
    sysx=[];
    for i = symba
        sig= [sig;mes(i)];
    endfor
    for i = 0:M-1
        sysx= [sysx mes(i)'];
    endfor
    recie=sig*sysx;
    recie=recie';
    [tem, fm]=max(recie);
    fm=fm-1;
endfunction

function rat = BER (og,rec)
    bean=dec2bin(og);
    beam=dec2bin(rec);
    beam=reshape(beam,1,numel(beam));
    bean=reshape(bean,1,numel(bean));
endfunction