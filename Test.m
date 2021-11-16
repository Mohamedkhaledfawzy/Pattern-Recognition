function [  ] = Test( x )
%lableArray = [0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 7 7 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 8 8 9 9 9 9 9 9 9 9 9 9 ] ;
testedimage=imread(x);
%fliped_Image=1-testedimage;
%croped_Image = crop (fliped_Image);
matrinx=PreProcess(x);

temp= zeros(1,18);
index = 1;
for i=1:3
    for j=1:3
        var=matrinx{i,j};
        verctor = regionprops(var,'centroid');
        VectorOfCentroid = cat ( 1,verctor.Centroid);
        if size(VectorOfCentroid)==0
            temp(index : index+1)= [0,0];
        else
        temp(index : index+1)= VectorOfCentroid;
        index = index +2;
        end
    end
end

 load  'D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #1 (Centroid)\Patt.assig#1\Feature.mat' y labels;


for i = 1:100
    sum=0;
    for j = 1:18
        Difference = temp(j)-y(i,j) ;
        Diff = abs(Difference);
        sum = sum + Diff;
    end
    vector(i)=sum; 
end

[minimum,index] = min(vector);
sort(vector)
%val=find(minimum==vector);

labels(index)
end


