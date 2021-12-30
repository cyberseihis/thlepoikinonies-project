jj=huffDict([88 99 0 78],[0.5 .3 .1 .1]);
sam=rand(1,16)*4/1+1;
sam=floor(sam);
ee=huffEnco(sam,jj);
ff=huffDeco(ee,jj);
disp(ff);
disp(sam);