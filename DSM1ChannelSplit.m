%3-D Distance Mapping of N. europea from nearest P. aeruginosa

%Step 1: Split two-channel stacks into separate image sequences and save
cd('C:\MATLAB\Morgan_Distance Mapping\B')%Paste directory containing your multichannel tiffs between apostrophes
for ii = 1:25 %highest number depends on highest image number in directory
	%Create an image filename
	tifFileName = strcat('B',num2str(ii), '.tif');
        info=imfinfo(tifFileName);
        num_images=numel(info);
		mkdir(sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\BSeq\Pa', ii))%pick a directory name for P.aeruginosa channel
        PaeruginosaFolder=sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\BSeq\Pa', ii); %pick same directory as previous line
        mkdir(sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\BSeq\T', ii))%pick a directory name for total bacteria channel
        TotalBacteriaFolder=sprintf('%s%d','C:\MATLAB\Morgan_Distance Mapping\BSeq\T', ii); %pick same directory as previous line
        for jj=1:2:num_images
    cd('C:\MATLAB\Morgan_Distance Mapping\B')
    I=imread(tifFileName,jj);    % read P.aeruginosa images
    File_name = strcat(num2str((jj+1)/2),'.tif');  % assign a P.aeruginosa file name i.e., 1.tif, 2.tif, ...
    cd(PaeruginosaFolder);    % Change directory where we want to dump the images
    imwrite(I,File_name);   % write the image
        end
        for kk=2:2:num_images
    cd('C:\MATLAB\Morgan_Distance Mapping\B')
    I=imread(tifFileName,kk);    % read image
    File_name = strcat(num2str(kk/2),'.tif');  % assign a file name i.e., 1.tif, 2.tif, ...
    cd(TotalBacteriaFolder);    % Change directory where we want to dump the images
    imwrite(I,File_name);   % write the image   
        end
end

 
