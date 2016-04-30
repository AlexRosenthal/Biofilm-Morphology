for k = 1:12 %k depends on highest image number in directory folders
    %Create folder names
    directory=sprintf('%s%d','C:\MATLAB\RAR OCT Time Series\AerialTriangle\Image Sequences\D',k);%This directory contains a set of Aerial Binary OCT image sequences
    if exist(directory, 'dir')
       cd(directory);
       listOftiffs = dir('*.tif');
       noi = numel(listOftiffs)
	end
end
