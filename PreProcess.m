function [ NewCelledImage ] = PreProcess( x )

original = imread(x);
FlipedImage = Flip(original);
CroppedImage = crop(FlipedImage);

[rows columns depth]=size(CroppedImage );
R1 = floor(rows/3);
C1 = floor(columns/3);

NewR(1) = R1 + mod(rows,3);
NewR(2) = R1;
NewR(3) = R1;

NewCol(1) = C1 + mod(columns,3);
NewCol(2) = C1;
NewCol(3) = C1;

NewCelledImage = mat2cell(CroppedImage,NewR,NewCol);


%celldisp(NewCelledImage);
%
%imshow(NewCelledImage{1,1});
%subplot(3,3,2);
%imshow(NewCelledImage{1,2});
%subplot(3,3,3);
%imshow(NewCelledImage{1,3});
%subplot(3,3,4);
%imshow(NewCelledImage{2,1});
%subplot(3,3,5);
%imshow(NewCelledImage{2,2});
%subplot(3,3,6);
%imshow(NewCelledImage{2,3});
%subplot(3,3,7);
%imshow(NewCelledImage{3,1});
%subplot(3,3,8);
%imshow(NewCelledImage{3,2});
%subplot(3,3,9);
%imshow(NewCelledImage{3,3});
end

