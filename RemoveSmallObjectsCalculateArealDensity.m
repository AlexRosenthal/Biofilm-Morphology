%Remove Objects less tahn 100 cubic microns from Ne and Pa binary stacks,
%then calculate areal fraction profiles of each population
RR=zeros(150,50);
for ii=1:25
    cd(strcat('C:\MATLAB\Morgan_Distance Mapping\PaBinary\A'));
    load(strcat('PaBinary',num2str(ii)));
    Pa100=bwareaopen(PaBinary,901,6); %Removes Pa signals less than 901 voxels in size (901 voxels = 100 cubic microns at current scale)
    PaPorosity = PorPro(Pa100);
    l=length(PaPorosity);
    PaPorosity=padarray(PaPorosity,150-l,1,'post');
    PaDensity=ones(150,1)-PaPorosity;
    RR(:,ii)=PaDensity;
    cd(strcat('C:\MATLAB\Morgan_Distance Mapping\NeBinary\A'));
    load(strcat('NeBinary',num2str(ii)));
    Ne100=bwareaopen(NeBinary,901,6); %Removes Ne signals less than 901 voxels in size (901 voxels = 100 cubic microns at current scale)
    NePorosity = PorPro(Ne100);
    l=length(NePorosity);
    NePorosity=padarray(NePorosity,150-l,1,'post');
    NeDensity=ones(150,1)-NePorosity;
    RR(:,ii+25)=NeDensity;
end