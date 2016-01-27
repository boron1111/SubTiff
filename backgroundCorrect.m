function image_caled=backgroundCorrect(image)
    image=double(image);
    image_caled1=backgroundCorrect1(image);
    image_caled2=backgroundCorrect1(image_caled1');
    image_caled2=image_caled2';
    image_caled=uint16(image_caled2);
end

function image_caled1=backgroundCorrect1(image)
    size1=size(image);
    image=image(:);
    x=1:length(image);
    x=x';
    p=polyfit(x,image,2);
    base=polyval(p,x);
%     figure;plot(x,image,x,base);
    image=image-base+mean(base);
    image_caled1=reshape(image,size1);
end
