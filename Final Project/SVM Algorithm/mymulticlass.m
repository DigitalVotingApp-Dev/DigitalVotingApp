


X=[
    -1.490869068	0.523933793	 0.350575028	0.616360247
    -1.325174925	0.814948206	-0.219020159	0.729246878
    -0.6961484	    0.925124916	-1.018176858	0.789200343
    -1.414270396	0.322307683	 0.158834277	0.933128436
    -1.434106855	0.220302415	 0.325704989	0.888099451
    -0.366952511	0.93566954	-1.240430906	0.671713877
     0.927929622	0.327290327	-1.416292134	0.161072185
    -1.312621929	0.594492814	-0.217887457	0.936016572			
    -0.101028573	0.688949473	-1.376161069	0.788240169
     0.443250554	0.538062262	-1.498756236	0.51744342
     0.448278317	0.366469947	-1.487383151	0.672634887
    -0.014149245	0.695952705	-1.40931683	    0.727513371
    -1.338436152	0.54283696	-0.148747594	0.944346787
     1.116341969	0.189120708	-1.310719775	0.005257099
    -1.05491507	    0.455023487	-0.566129513	1.166021096
    -0.97327637	    0.168784435	-0.519882355	1.32437429			
     0.85514563	    0.458790632	-1.429956765	0.116020503
     0.833106188	0.454668194	-1.440765313	0.152990931
     0.985253979	0.318193912	-1.386073668	0.082625776
    -0.428070518	0.871483007	-1.211394499	0.76798201
     0.40935588	    0.71551531	-1.481075352	0.356204162
     1.046660379	0.290200314	-1.349123953	0.01226326
     1.219794347	0.06210331	-1.22687294	   -0.055024717
    -0.914503051	0.584370906	-0.775067215	1.10519936			
     0.003547649	0.84942683	-1.404924449	0.551949969
     0.020442317	0.822512239	-1.413386935	0.570432379
    -0.151690069	0.859079333	-1.350883941	0.643494677
     0.301991567	0.745259088	-1.473631385	0.42638073
    -0.010125909	0.769518043	-1.409113679	0.649721546
     0.063120693	0.828177013	-1.423639858	0.532342152
     0.803515435	0.455802064	-1.452357705	0.193040206
    -0.581001759	0.634582523	-1.089406618	1.035825853			
     0.790503495	0.397432547	-1.463322832	0.27538679
     0.458898737	0.423191832	-1.494914047	0.612823478
     0.117868203	0.550731047	-1.4431932	    0.77459395
     0.589558201	0.175476175	-1.461634985	0.69660061
     1.014319966	0.227277312	-1.378663445	0.137066168
     0.182128135	0.432029022	-1.445407564	0.831250407
     1.320693333   -0.034645628 -1.105414084   -0.180633621
    -0.045402681   -0.153760598	-1.115832543	1.314995822

];
Y=[1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;4;4;4;4;4;4;4;4;5;5;5;5;5;5;5;5];

%In multiclass classi?cation problems, it is easiest to use the object oriented interface which
%integrates the encoding in the LS-SVM training and simulation calls:
 % load multiclass data ...
 model = initlssvm(X,Y,'classifier',[],[],'RBF_kernel');
 model = tunelssvm(model,'simplex','leaveoneoutlssvm',{'misclass'},'code_OneVsAll');
 model = trainlssvm(model);
 plotlssvm(model);

 Xt=[
     1.116341969	0.189120708	-1.310719775	0.005257099
    -1.05491507	    0.455023487	-0.566129513	1.166021096
    -0.97327637	    0.168784435	-0.519882355	1.32437429

];
gam=10;
sig2=0.4;
type='classification';
[alpha,b] = trainlssvm({X,Y,type,gam,sig2,'RBF_kernel','preprocess'});
 
 Ytest = simlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b},Xt)


 plotlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b});

[area, se, deltab, oneMinusSpec, sens, TN, TP, FN, FP] = roc(Ytest, [2;2;2]);
