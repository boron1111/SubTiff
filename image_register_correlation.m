function image_registered=image_register_correlation(image_reference,image_motion)

sz=size(image_reference);
ff_refer=fft2(image_reference);
ff_motion=fft2(image_motion);
ff_con=conj(ff_refer);
correlation=ff_con.*ff_motion;
corr_real=real(ifft2(correlation));
% corr_real=rot90(corr_real,2);
[~, pos]=max(corr_real(:));
xoffset=mod(pos,sz(1));  %row
yoffset=floor(pos/sz(1));  %column
se=translate(strel(1),[-xoffset-1 -yoffset-1]);
image_registered=imdilate(image_motion,se);