%3-D Distance Mapping of N. europea from nearest P. aeruginosa

%Step 2: Resize Image Sequences into cubic voxels and save resized matrix
%and 8bit image sequence
mkdir('C:\MATLAB\Morgan_Distance Mapping\PaResized\B');
mkdir('C:\MATLAB\Morgan_Distance Mapping\TResized\B');
mkdir('C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B');
for ii=1:25 %highest number depends on nuber of sub-directories
    directory=strcat('C:\MATLAB\Morgan_Distance Mapping\BSeq\Pa',num2str(ii)); 
    cd(directory);
    listOftiffs = dir('*.tif');
    noi = numel(listOftiffs);
    GL=ReadImagesGenerate3DMatrix(directory,noi);
    Pa=GL;
    Pa=im2single(Pa);
    d=size(Pa);
    z=1:d(3);
    zi=1:.4805:d(3);
    Pai=permute(interp1(z,permute(Pa,[3 1 2]),zi),[2 3 1]);
    Pa8=uint8(256*Pai);
    cd('C:\MATLAB\Morgan_Distance Mapping\PaResized\B');
    FILENAME=sprintf('%s%d','Pa',ii);
    save(FILENAME,'Pa8');
    mkdir(sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B\Pa',ii));
    cd(sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B\Pa',ii));
    di=size(Pa8);
    for jj=1:di(3)
        tiff = Pa8(:, :, jj);
        outputFileName = sprintf('Pa%d.tiff', jj);
        imwrite(tiff,outputFileName,'WriteMode', 'append')
    end   
end

for kk=1:25 %highest number depends on nuber of sub-directories
    directory=strcat('C:\MATLAB\Morgan_Distance Mapping\BSeq\T',num2str(kk));
    cd(directory);
    listOftiffs = dir('*.tif');
    noi = numel(listOftiffs);
    GL=ReadImagesGenerate3DMatrix(directory,noi);
    T=GL;
    T=im2single(T);
    d=size(T);
    z=1:d(3);
    zi=1:.4805:d(3);
    Ti=permute(interp1(z,permute(T,[3 1 2]),zi),[2 3 1]);
    T8=uint8(256*Ti);
    cd('C:\MATLAB\Morgan_Distance Mapping\TResized\B');
    FILENAME=sprintf('%s%d','T',kk);
    save(FILENAME,'T8');
    mkdir(sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B\T',kk));
    cd(sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\ResizedImageSequences\B\T',kk));
    di=size(T8);
    for ll=1:di(3)
        tiff = T8(:, :, ll);
        outputFileName = sprintf('T%d.tiff', ll);
        imwrite(tiff,outputFileName,'WriteMode', 'append')
    end
end
