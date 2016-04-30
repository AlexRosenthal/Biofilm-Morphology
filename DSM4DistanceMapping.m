%3-D Distance Mapping of N. europea from nearest P. aeruginosa

%Step 4: Caluculate 3-D distance map and save histcounts
BB=zeros(150,25);
mkdir('C:\MATLAB\Morgan_Distance Mapping\DistanceMapHistograms\B');
DistMapDirectory='C:\MATLAB\Morgan_Distance Mapping\DistanceMapHistograms\B';
for ii=1:25
    cd(strcat('C:\MATLAB\Morgan_Distance Mapping\PaBinary\B'));
    load(strcat('PaBinary',num2str(ii)));
    cd(strcat('C:\MATLAB\Morgan_Distance Mapping\NeBinary\B'));
    load(strcat('NeBinary',num2str(ii)));
    EDM=bwdist(PaBinary);
    NeDis=EDM(NeBinary);
    edges=[0:150];
    N=histcounts(NeDis,edges);
    l=length(N);
    N=padarray(N,150-l,0,'post');
    BB(:,ii)=N;
end
cd(DistMapDirectory);
xlswrite('B',BB);
