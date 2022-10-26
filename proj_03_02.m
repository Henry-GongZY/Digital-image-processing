% read in picture
img = imread('./Images/Fig3.08(a).jpg');
% draw picture
subplot(2,2,1);
imshow(img);
% draw hist
subplot(2,2,2);
imhist(img);
% hist
img1 = histeq(img,256);
subplot(2,2,3);
imshow(img1);
subplot(2,2,4);
imhist(img1);