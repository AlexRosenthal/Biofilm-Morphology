mkdir('C:\MATLAB\Morgan_Distance Mapping\Distance Mapping\MultichannelTiffs\PaResized\ImageSequence')
cd('C:\MATLAB\Morgan_Distance Mapping\Distance Mapping\MultichannelTiffs\PaResized\ImageSequence')
for ii=1:61
  tiff = T8(:, :, ii);
  outputFileName = sprintf('smb%d.tiff', ii);
  imwrite(tiff,outputFileName,'WriteMode', 'append')
end