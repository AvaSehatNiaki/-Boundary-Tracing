
% Approach 1: Boundary Tracking 

% read and show the original Image
I = imread('polymercell.tif');
figure
imshow(I);

%use "close" to generate better circles
SE = strel('disk',15)

%show results of "closing"
I = imclose(I,SE);
figure; imshow(I);
hold on;

%Create a gaussian filter (bluring) to 
H = fspecial ('gaussian',512,30);
%Apply a gaussian filter
Gaussian = imfilter(I,H);
figure
imshow(Gaussian);
title('Blurred Image');

%Apply a unsharp filter
J = I- Gaussian;
Unsharp = I + J;
figure
imshow(Unsharp);
title('Sharpened Image');

%by inverting the sharpened image befor turing it to binary inside circle
%are selected
Unsharp = 255-Unsharp
figure
imshow(Unsharp);

%converting image to binary
BW = imbinarize(Unsharp);

%only showing the two existing whole boundries 
[B,L,N] = bwboundaries(BW,'noholes');
figure
imshow(BW); hold on;
for k=1:length(B),
   boundary = B{k};
   if(k > 2)
     plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
  else
     plot(boundary(:,2), boundary(:,1), 'w','LineWidth',2);
   end
end
