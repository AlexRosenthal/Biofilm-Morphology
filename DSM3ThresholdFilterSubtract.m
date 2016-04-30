%3-D Distance Mapping of N. europea from nearest P. aeruginosa

%Step 3: Threshold, Filter, Subtract Pa from T, and save all
%resulting stacks and matrices
%%
for ii = 1:25; %ii depends on highest number in directory folders
    mkdir(strcat('C:\MATLAB\Morgan_Distance Mapping\PaBinary\B\Pa',num2str(ii)));
    PaBinarydirectory=strcat('C:\MATLAB\Morgan_Distance Mapping\PaBinary\B\Pa',num2str(ii));
    Padirectory=strcat('C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B\Pa',num2str(ii));
    cd(Padirectory);
    listOftiffs = dir('*.tiff');
    noi = numel(listOftiffs);
    for jj=1:noi
        tifFileName = strcat('Pa',num2str(jj), '.tiff');
        I=imread(tifFileName);
        t=graythresh(I);            % Calculate threshold value
        I=im2bw(I,t);
        I=medfilt2(I); 
        cd(PaBinarydirectory);
        outputFileName = sprintf('%d%s',jj,'.tiff');
        imwrite(I,outputFileName,'WriteMode', 'append');
        cd(Padirectory);
    end      
end
%%
for ii = 1:25; %ii depends on highest number in directory folders
    mkdir(strcat('C:\MATLAB\Morgan_Distance Mapping\TBinary\B\T',num2str(ii)));
    TBinarydirectory=strcat('C:\MATLAB\Morgan_Distance Mapping\TBinary\B\T',num2str(ii));
    Tdirectory=strcat('C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B\T',num2str(ii));
    cd(Tdirectory);
    listOftiffs = dir('*.tiff');
    noi = numel(listOftiffs);
    for jj=1:noi
        tifFileName = strcat('T',num2str(jj), '.tiff');
        I=imread(tifFileName);
        t=graythresh(I);            % Calculate threshold value
        I=im2bw(I,t);
        I=medfilt2(I); 
        cd(TBinarydirectory);
        outputFileName = sprintf('%d%s',jj,'.tiff');
        imwrite(I,outputFileName,'WriteMode', 'append');
        cd(Tdirectory);
    end      
end 
%%
mkdir(strcat('C:\MATLAB\Morgan_Distance Mapping\NeBinary\B'));
NeBinarydirectory='C:\MATLAB\Morgan_Distance Mapping\NeBinary\B';
PaBinarydirectory='C:\MATLAB\Morgan_Distance Mapping\PaBinary\B';
TBinarydirectory='C:\MATLAB\Morgan_Distance Mapping\TBinary\B';
for ii=1:25 %highest number depends on nuber of sub-directories 
    directory=strcat('C:\MATLAB\Morgan_Distance Mapping\PaBinary\B\Pa',num2str(ii));
    cd(directory);
    listOftiffs = dir('*.tiff');
    noi = numel(listOftiffs);
    GL=ReadImagesGenerate3DMatrix(directory,noi);
    PaBinary=GL;
    cd(PaBinarydirectory);
    FILENAME=sprintf('%s%d','PaBinary',ii);
    save(FILENAME,'PaBinary');
    directory=strcat('C:\MATLAB\Morgan_Distance Mapping\TBinary\B\T',num2str(ii));
    cd(directory);
    listOftiffs = dir('*.tiff');
    noi = numel(listOftiffs);
    GL=ReadImagesGenerate3DMatrix(directory,noi);
    TBinary=GL;
    cd(TBinarydirectory);
    FILENAME=sprintf('%s%d','TBinary',ii);
    save(FILENAME,'TBinary');
    NeBinary=TBinary-PaBinary;
    NeBinary(NeBinary<0)=0;
    NeBinary=logical(NeBinary);
    cd(NeBinarydirectory);
    FILENAME=sprintf('%s%d','NeBinary',ii);
    save(FILENAME,'NeBinary');
end
      
