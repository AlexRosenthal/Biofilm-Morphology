% ReadImagesGenerate3DMatrix.m

% Copyright Lewandowski, Z. and Beyenal, H.,  Center for Biofilm Engineering,
% Montana State University and the School of Chemical Engineering and Bioengineering,
% Washington State University.

% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met: 

% 1. If the program is modified, redistributions must include a notice
% indicating that the redistributed program is not identical to the 
% software distributed by Lewandowski, Z., and Beyenal, H.
% Fundamentals of Biofilm Research, 2013.

% 2. All advertising materials mentioning features or use of this software 
% must display the following acknowledgment: This product includes software 
%developed by Lewandowski, Z., and Beyenal, H.
% Fundamentals of Biofilm Research, 2013.

% We also request that use of this software be cited in publications as 
% Lewandowski, Z., and Beyenal, H.
% Fundamentals of Biofilm Research, 2013, CRC press.  

% The software is provided "AS-IS" and without warranty of any kind, 
% express, implied or otherwise, including, without limitation, any 
% warranty of merchantability  or fitness for a particular purpose. 
% In no event shall the Center for Biofilm Engineering,
% Montana State University or the School of Chemical and Bioengineering,
% Washington State University or the authors be liable for any special, incidental, indirect 
% or consequential damages of any kind, or any damages whatsoever resulting 
% from loss of use, data or profits, whether or not advised of the 
% possibility of damage, and on any theory of liability, arising out of 
% or in connection with the use or performance of this software. 

% This code was written using MATLAB 8 (MathWorks,www.mathworks.com) and 
% may be subject to certain additional restrictions as a result. 


function GL=ReadImagesGenerate3DMatrix(directory,noi);
 
 
cd(directory);  % where images are located. It is not necessary if images are located in the same directory
Number_of_images=noi;    % Number of images will be used to generate 3D matrix
tf='.tiff';   % open only tif files
 
for index=1:Number_of_images
    str = num2str(index);        % number to string
    File_name = strcat(str,tf);     
    [X]=imread(File_name);      % read 2D image
    imshow(X);                  % show the image
    GL(:,:,index) = X;
end     % reading images are completed
%cd('..');    % return back to one up directory. It is not necessary if images are in the same directors
return   
