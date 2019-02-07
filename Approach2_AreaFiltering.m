
% Approach 2: Area filtering 

% read and show the original Image
I = imread('polymercell.tif');
figure
imshow(I);

%use "close" to generate better circles 
SE = strel('disk',12)

%show results of "closing"
I = imclose(I,SE);
figure
imshow(I)

%converting image to binary
I = imbinarize(I);

%Area Filter bwareafilt(image,number of areas to show)
BW2 = bwareafilt(I,2);

%refining the detected areas using "Erosion" 
SE2 = strel('disk',2)
BW2 = imerode(BW2,SE2);

%show results
figure
imshowpair(I,BW2,'montage')

