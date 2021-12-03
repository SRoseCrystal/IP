clear; close all;

% Task 1: Pre-processing -----------------------
% Step-1: Load input image
I = imread('IMG_01.png');
figure, imshow(I)

% Step-2: Covert image to grayscale
I_gray = rgb2gray(I);
figure, imshow(I_gray)

% Step-3: Rescale image
I_resize = imresize(I_gray,[NaN, 512], 'nearest');
figure, imshow(I_resize)
% Step-4: Produce histogram before enhancing
histogram(I_resize,64);
% Step-5: Enhance image before binarisation
I_enhance = imtophat(I_resize,strel('disk',15));
figure, imshow(I_enhance)
% Step-6: Histogram after enhancement
histogram(I_enhance,64);
% Step-7: Image Binarisation
I_bin = imbinarize(I_enhance,'global');
I_bin = bwareaopen(I_bin,50);
figure, imshow(I_bin)
% Task 2: Edge detection ------------------------
I_edge = edge(I_enhance,'Canny');
figure, imshow(I_edge)
% Task 3: Simple segmentation --------------------

% Task 4: Object Recognition --------------------