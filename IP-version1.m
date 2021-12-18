I=imread('watch.png'); %importing image
IB=imnoise(I,'salt & pepper'); %addded noise
figure(1)
subplot(1,2,1) %added 1st image to output
imshow(I) 
%displays the grayscale image I in a figure. imshow uses the default display range for the image data type and optimizes figure, axes, and image object properties for image display.
%showing imported image
title('Original image')

subplot(1,2,2) %added 2nd image with salt and pepper noise to the output
imshow(IB)
title('Salt & Pepper Noisy image') 

%AVG filter on salt and pepper noise
N=ones(3)/9; %forming 3x3 array for filter
If1=imfilter(IB,N); %adding avg filter to img with salt and pepper noise
figure(2)
imshow(If1) %showing img with avg filter
title(' Salt & Pepper Noisy image filtered by a 3 by 3 average filter')

%MEDIAN filter on salt and pepper noise
img_med=IB;
[r,c]=size(IB);
F_SP = zeros(r+2,c+2); %initialize array of zeroes with padding 
for i=2:r-1
    for j=2:c-1 
        flt=[IB(i-1,j-1),IB(i-1,j),IB(i-1,j+1),IB(i,j-1),IB(i,j),IB(i,j+1),IB(i+1,j-1),IB(i+1,j),IB(i+1,j+1)]; 
        %taking sub array of image for median filtering process
        F_SP(i,j)=median(flt); %applying median to the elts on sub-img array
    end
end
figure(3);
imshow(F_SP,[])
%imshow(F_SP)
%displays the grayscale image I, scaling the display based on the range of pixel values in I. imshow uses [min(I(:)) max(I(:))] as the display range. imshow displays the minimum value in I as black and the maximum value as white
title('Salt & pepper Noisy image filtered by a 3 by 3 median filter'); %showing image in output

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I=imread('watch.png'); %importing image
IC=imnoise(I,'gaussian'); %added noise

figure(4)
subplot(1,2,1)
imshow(I)
title('Original image')

subplot(1,2,2)
imshow(IC)
title('Gaussian noisy image') 

%AVG filter on gaussian noise
N=ones(3)/9; %forming 3x3 array for filter
If2=imfilter(IC,N);
figure(5)
imshow(If2)
title('Gaussian Noisy image filtered by a 3 by 3 average filter') 

%MEDIAN filter on gaussian noise
img_med=IC; 
[r,c]=size(IC); 
F_SP3=zeros(r+2,c+2); %initialize array of zeroes with padding 
for i=2:r-1
    for j=2:c-1 
        flt3=[IC(i-1,j-1),IC(i-1,j),IC(i-1,j+1),IC(i,j-1),IC(i,j),IC(i,j+1),IC(i+1,j-1),IC(i+1,j),IC(i+1,j+1)]; 
        %taking sub array of image for median filtering process
        F_SP3(i,j)=median(flt3); %applying median to the elts on sub-img array
    end
end
figure(6);
imshow(F_SP3,[])
title('Gaussian Noisy image filtered by a 3 by 3 median filter');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

IK=imnoise(I,'poisson'); %added noise
figure(7)
subplot(1,2,1)
imshow(I)
title('Original image')

subplot(1,2,2)
imshow(IK)
title('Poisson noisy image') 

%AVG filter on poisson noise
N=ones(3)/9;%forming 3x3 array for filter
If3=imfilter(IK,N);
figure(8)
imshow(If3)
title('Poisson Noisy image filtered by a 3 by 3 average filter')

%MEDIAN filter on poisson noise
img_med=IK;
[r,c]=size(IK);
F_SP4=zeros(r,c);
for i=2:r-1
    for j=2:c-1    
        flt4=[IK(i-1,j-1),IK(i-1,j),IK(i-1,j+1),IK(i,j-1),IK(i,j),IK(i,j+1),IK(i+1,j-1),IK(i+1,j),IK(i+1,j+1)]; 
        %taking sub array of image for median filtering process
        F_SP4(i,j)=median(flt4); %applying median to the elts on sub-img array
    end
end
figure(9);
imshow(F_SP4,[])
title('Poisson Noisy image filtered by a 3 by 3 median filter');



%HYBRID MEDIAN FILTER
I=imread('watch.png'); %importing image
IB=imnoise(I,'salt & pepper'); %adding salt and pepper noise
%{
figure(1)
subplot(1,2,1)
imshow(I)
title('Original image')

subplot(1,2,2)
imshow(IB)
title('Salt & Pepper Noisy image')
%}

%implementing hybrid filter
[r,c]=size(IB);
F_SP=zeros(r,c);
for i=2:r-1
    for j=2:c-1
        flt=[IB(i-1,j),IB(i,j-1),IB(i,j),IB(i,j+1),IB(i+1,j)]; 
        flt1=[IB(i-1,j-1),IB(i,j),IB(i+1,j+1),IB(i-1,j+1),IB(i+1,j-1)]; 
        flt2=I(i,j);
        a=median(flt);
        b=median(flt1);
        h=[a b flt2];
        F_SP6(i,j)=median(h);
    end
end

figure(10);
imshow(F_SP6,[]);
title('salt and pepper Noisy Image filtered by a 3 by 3 hybrid median filter');

I=imread('watch.png'); %importing image
IC=imnoise(I,'gaussian'); %adding gaussian noise
%{
figure(4)
subplot(1,2,1)
imshow(I)
title('Original image')

subplot(1,2,2)
imshow(IC)
title('Gaussian noisy image')
%}

%implementing hybrid filter
[r,c]=size(IC);
F_SP=zeros(r,c);
for i=2:r-1
    for j=2:c-1
        flt0=[IC(i-1,j),IC(i,j-1),IC(i,j),IC(i,j+1),IC(i+1,j)]; 
        flt11=[IC(i-1,j-1),IC(i,j),IC(i+1,j+1),IC(i-1,j+1),IC(i+1,j-1)];
        flt21=I(i,j);
        x=median(flt0);
        y=median(flt11);
        h=[x y flt21];
        F_SP7(i,j)=median(h);
    end
end
figure(11);
imshow(F_SP7,[]);
title('Gaussian Noisy Image filtered by a 3 by 3 hybrid median filter');

I=imread('watch.png'); %importing image
IK=imnoise(I,'poisson'); %adding poisson noise
%{
figure(7)
subplot(1,2,1)
imshow(I)
title('Original image') 
subplot(1,2,2)
imshow(IK)
title('Poisson noisy image') 
%}

%hybrid median filter 
[r,c]=size(IK); 
F_SP=zeros(r,c);
for i=2:r-1
    for j=2:c-1
        flt0=[IK(i-1,j),IK(i,j-1),IK(i,j),IK(i,j+1),IK(i+1,j)]; 
        flt12=[IK(i-1,j-1),IK(i,j),IK(i+1,j+1),IK(i-1,j+1),IK(i+1,j-1)];
        flt22=I(i,j);
        P=median(flt0);
        Q=median(flt12);
        h=[P Q flt22];
        F_SP8(i,j)=median(h);
    end
end
figure(12);
imshow(F_SP8,[]);
title('Poisson Noisy Image filtered by a 3 by 3 hybrid median filter');

%values of ratios to compare
fprintf('**ERROR COMPARISION**\n\n');
err_IB= immse(I,IB);
fprintf('\nThe mean squared error of the salt and pepper noise image is %0.4f\n',err_IB); 
err2_IB= psnr(I,IB);
fprintf('\nThe PSNR ratio of the salt and pepper noise image is %0.4f\n',err2_IB); 
err3_IB= ssim(IB,I);
fprintf('\nThe SSIM of the salt and pepper noise image is %0.4f\n',err3_IB); 
err_If1= immse(I,If1);
fprintf('\nThe mean squared error of the salt and pepper noise image filtered by average filter is %0.4f\n',err_If1);
err2_If1= psnr(I,If1);
fprintf('\nThe PSNR ratio of the salt and pepper noise image filtered by average filter is %0.4f\n',err2_If1);
err3_If1= ssim(If1,I);
fprintf('\nThe SSIM of the salt and pepper noise image filtered by average filter is %0.4f\n',err3_If1);
err_img_med= immse(I,img_med);
fprintf('\nThe mean squared error of the salt and pepper noise image filtered by median filter is %0.4f\n',err_img_med);
err2_img_med= psnr(I,img_med);
fprintf('\nThe PSNR ratio of the salt and pepper noise image filtered by median filter is %0.4f\n',err2_img_med);
err3_img_med= ssim(img_med,I);
fprintf('\nThe SSIM of the salt and pepper noise image filtered by median filter is %0.4f\n',err3_img_med);
err_IC= immse(I,IC);
fprintf('\nThe mean squared error of the gaussian noise image is %0.4f\n',err_IC);
err2_IC= psnr(I,IC);
fprintf('\nThe PSNR ratio of the gaussian noise image is %0.4f\n',err2_IC);
err3_IC= ssim(IC,I);
fprintf('\nThe SSIM of the gaussian noise image is %0.4f\n',err3_IC);
err_If2= immse(I,If2);
fprintf('\nThe mean squared error of the gaussian noise image filtered by average filter is %0.4f\n',err_If2);
err2_If2= psnr(I,If2);
fprintf('\nThe PSNR ratio of the gaussian noise image filtered by average filter is %0.4f\n',err2_If2); 
err3_If2= ssim(If2,I);
fprintf('\nThe SSIM of the gaussian noise image filtered by average filter is %0.4f\n',err3_If2);
err_img_med1= immse(I,img_med);
fprintf('\nThe mean squared error of the gaussian noise image filtered by median filter is %0.4f\n',err_img_med);
err2_img_med= psnr(I,img_med);
fprintf('\nThe PSNR ratio of the gaussian noise image filtered by median filter is %0.4f\n',err2_img_med);
err3_img_med= ssim(img_med,I);
fprintf('\nThe SSIM of the gaussian noise image filtered by median filter is %0.4f\n',err3_img_med);
err_IK= immse(I,IK);
fprintf('\nThe mean squared error of the poisson noise image is %0.4f\n',err_IK);
err2_IK= psnr(I,IK);
fprintf('\nThe PSNR ratio of the poisson noise image is %0.4f\n',err2_IK);
err3_IK= ssim(IK,I);
fprintf('\nThe SSIM of the poisson noise image is %0.4f\n',err3_IK);
err_If3= immse(I,If3);
fprintf('\nThe mean squared error of the poisson noise image filtered by average filter is %0.4f\n',err_If3);
err2_If3= psnr(I,If3);
fprintf('\nThe PSNR ratio of the poisson noise image filtered by average filter is %0.4f\n',err2_If3);
err3_If3= ssim(If3,I);
fprintf('\nThe SSIM of the poisson noise image filtered by average filter is %0.4f\n',err3_If3);
err_img_med2= immse(I,img_med);
fprintf('\nThe mean squared error of the poisson noise image filtered by median filter is %0.4f\n',err_img_med);
err2_img_med2= psnr(I,img_med);
fprintf('\nThe PSNR ratio of the poisson noise image filtered by median filter is %0.4f\n',err2_img_med);
err3_img_med2= ssim(img_med,I);
fprintf('\nThe SSIM of the poisson noise image filtered by median filter is %0.4f\n',err3_img_med);
