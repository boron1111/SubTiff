function image_caled=backgroundCorrect1(image)

image=double(image);
cdata=image(:);
xy=0:length(cdata)-1;
xy=xy';
x=floor(xy/size(image,1));
y=mod(xy,size(image,1));
A=[ones(length(xy),1) x y x.*y x.^2 y.^2]; % A*p=cdata
p=A\cdata;
base=A*p;
image_caled=cdata-base+mean(base);
image_caled=reshape(image_caled,size(image));
image_caled=uint16(image_caled);