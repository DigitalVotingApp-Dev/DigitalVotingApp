
X=[
-1.490869068	0.523933793	0.350575028	0.616360247
-1.325174925	0.814948206	-0.219020159	0.729246878
-0.6961484	0.925124916	-1.018176858	0.789200343
-1.414270396	0.322307683	0.158834277	0.933128436
-1.434106855	0.220302415	0.325704989	0.888099451
-0.366952511	0.93566954	-1.240430906	0.671713877
0.927929622	0.327290327	-1.416292134	0.161072185
-1.312621929	0.594492814	-0.217887457	0.936016572
-0.101028573	0.688949473	-1.376161069	0.788240169
0.443250554	0.538062262	-1.498756236	0.51744342
0.448278317	0.366469947	-1.487383151	0.672634887
-0.014149245	0.695952705	-1.40931683	0.727513371
-1.338436152	0.54283696	-0.148747594	0.944346787
1.116341969	0.189120708	-1.310719775	0.005257099
-1.05491507	0.455023487	-0.566129513	1.166021096
-0.97327637	0.168784435	-0.519882355	1.32437429



];

Y=[
     1
     1
     1
     1
     1
     1
     1
     1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    ];
    

gam=5;
sig2=0.2;
type='classification';

[alpha,b]= trainlssvm({X,Y,type,gam,sig2,'RBF_kernel'});
[alpha,b]= trainlssvm({X,Y,type,gam,sig2,'RBF_kernel','original'});
[alpha,b]= trainlssvm({X,Y,type,gam,sig2,'RBF_kernel','preprocess'});

Xt=[
-1.05491507	0.455023487	-0.566129513	1.166021096
-0.97327637	0.168784435	-0.519882355	1.32437429
0.85514563	0.458790632	-1.429956765	0.116020503
0.833106188	0.454668194	-1.440765313	0.152990931
];

Ytest=simlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b},Xt)
plotlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b});
% [M N]= perfcurve([1; 1; 1; -1; -1;-1],Ytest,1,'XCrit','FP');
% plot(M,N)

[area, se, deltab, oneMinusSpec, sens, TN, TP, FN, FP] = roc(Ytest, [-1; -1; 1; 1])