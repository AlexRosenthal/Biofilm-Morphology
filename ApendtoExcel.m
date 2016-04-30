RR=zeros(400,2);
for ii=1:2
    cd('C:\MATLAB\CoregisteredOCT_MPLSM\03102016\Areal Binary 2\Indexed for Matlab');
    filename=sprintf('%s%d%s','output',ii,'.mat');
    if exist(filename, 'file');
    load(filename, 'porosity');
    sp=flipud(porosity);
    l=length(sp);
    ssp=padarray(sp,400-l,1,'post');
    RR(:,ii)=ssp;
    end  
end

