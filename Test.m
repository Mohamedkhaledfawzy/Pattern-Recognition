function [x] = Test( x )
 
load  'C:\Users\DELL\Desktop\Bayes Classifier\cov_matr' cov_matr;
load  'C:\Users\DELL\Desktop\Bayes Classifier\mean_matr.mat' mean_matr;

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

% load  'C:\Users\DELL\Desktop\MSE\Feature.mat' Z labels;
 
 [x,y]=size(cov_matr);
 final=[];
 counter = 1 ;
 
 for i=1 :10
 
     
     S=((i-1)*18)+1;
     cc = cov_matr(S:S+17 , :);
     mm = mean_matr(counter , :);
     
     inv_cov = pinv(cc) ;
     dx = (-1/2)*log(det(cc))-(1/2)* ((temp-mm) * inv_cov *(temp-mm)');
     
     final = [final,dx];
     
     counter = counter + 1 ;
 end
 
 
 final
 [x , i]= max(final);
 x
 i-1 
 
 

end


