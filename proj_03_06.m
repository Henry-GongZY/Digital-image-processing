clear
% 读取图片
img=imread('./Images/Fig3.30(a).jpg');
figure(1);
imshow(img);
 
img = double(img);
w = fspecial('average',3);
img = double(img);
c=conv2(img,w,'same');
g = img - c;
figure(2);
imshow(g);
 
A=[0.6,1,1.7,2.3,2.9,5,10];
for i=1:7
d = img + A(i) * c;
d = uint8(d);
figure(i+2);
imshow(d);
end