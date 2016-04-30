CorrelationProfile=zeros(1,20);
for ii = 1:20
    OCT=imread(sprintf('%s%d%s','C:\MATLAB\CoregisteredOCT_MPLSM\03212016\Subregion Comparison\Ithsmus\OCT_CeAC\', ii, '.tif'));
    MPLSM=imread(sprintf('%s%d%s','C:\MATLAB\CoregisteredOCT_MPLSM\03212016\Subregion Comparison\Ithsmus\MPLSM_CeAC\', ii, '.tif'));
    correlation=corr2(OCT,MPLSM);
    CorrelationProfile(:,ii)=correlation;
end
cd('C:\MATLAB\CoregisteredOCT_MPLSM\03212016\Subregion Comparison\Ithsmus')
xlswrite('CeAC',CorrelationProfile)