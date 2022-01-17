SrcA=importdata("cvxopt.txt");
SrcA=double(SrcA{1}) - double("a") + 1;
SrcA(find(SrcA<0))= double("z")- double("a")+2;
cnt=hist(SrcA, unique(SrcA));
prb=cnt/length(SrcA);
lexic=huffDict([1:length(prb)],prb);
enco=huffEnco(SrcA,lexic);
% decc=huffDeco(enco,lexic);
% disp(decc - SrcA);
lenz=[];
for i = 1:length(lexic)
    lenz= [lenz length(lexic{i})];
endfor
meso=lenz * prb';
entro =- log(prb) * prb';
apodo=entro/meso;
% ypoerothma3
prben=[0.0698 , 0.0128 , 0.0238 , 0.0364 , 0.1086 , 0.0190 , 0.0172 , 0.0521 , 0.0595 , 0.0013 , 0.0066 , 0.0344 , 0.0206 , 0.0577 , 0.0642 , 0.0165 , 0.0008 , 0.0512 , 0.0541 , 0.0774 , 0.0236 , 0.0084 , 0.0202 , 0.0013 , 0.0169 , 0.0006 , 0.1453];
prben=prben/sum(prben);
lexic=huffDict([1:length(prben)],prben);
enco=huffEnco(SrcA,lexic);
% decc=huffDeco(enco,lexic);
% ypoerothma4
PairsA=[(SrcA(1:2:length(SrcA))-1)*27 + (SrcA(1:2:length(SrcA))-1)];
[Ya Ia Ja]=unique(PairsA);
cnt2=hist(PairsA, Ya);
prb2=cnt2/length(PairsA);
lexic2=huffDict([1:length(prb2)],prb2);
enco2=huffEnco(Ja,lexic2);
decc2=huffDeco(enco2,lexic2);
decc2;
lenz2=[];
for i = 1:length(lexic2)
    lenz2= [lenz2 length(lexic2{i})];
endfor
meso2=lenz2 * prb2';
entro2 =- log(prb2) * prb2';
apodo2=entro2/meso2;
% ypoerothma5
% phghb
