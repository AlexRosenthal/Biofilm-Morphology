Matrix=double(Matrix);
d = size(ans);
[xi,yi,zi] = meshgrid(1:d(1),1:d(2),1:.4805:d(3));
ans_resized = interp3(ans,xi,yi,zi);