using DelimitedFiles

dataDir = "../Data/"
texDir = "../TeX"

NSWRE74_CONTROL = readdlm(dataDir + "nswre74_control.txt")

NSWRE74_TREATED = readdlm(dataDir+ "nswre74_treated.txt")

lalonde=[NSWRE74_TREATED; NSWRE74_CONTROL];

treat=lalonde[:,1];

age=lalonde[:,2];

education=lalonde[:,3];

black=lalonde[:,4];

hispanic=lalonde[:,5];

married=lalonde[:,6];

nodegree=lalonde[:,7];

re74=lalonde[:,8];

re75=lalonde[:,9];

re78=lalonde[:,10];
