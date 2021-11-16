function [ temp ] = CEntriodForOnePic( x )
t = PreProcess(x);  % function (preprocess) makes all operations on the image to get the new celled image
temp= zeros(1,18);
index = 1;
for i=1:3   % looping on the blocks of image
    for j=1:3
        var=t{i,j};
        verctor = regionprops(var,'centroid');
        VectorOfCentroid = cat ( 1,verctor.Centroid); %concatenate to get centroid specifically for ones
        
        if size(VectorOfCentroid)==0
            temp(index : index+1)= [0,0];
        else
        temp(index : index+1)= VectorOfCentroid;
        index = index +2;
        end
    end
end

end

