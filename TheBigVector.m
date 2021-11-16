function [  ] = TheBigVector(  )
 y=zeros(100,18); % vector of centroid feature of the 100 sample image 
 List = dir('D:\FCI\First term\GP\Assignment 1\Training Data');  % Read the directory of samples
 Folder = 'D:\FCI\First term\GP\Assignment 1\Training Data\'; % string take samples directory to append
 index=1;
 labels={};  % kan commenttttttttttttttttttttt
 c=1; % counter
 for i=3:102
     path = strcat(Folder,List(i).name);
     labels{c}=List(i).name(1);   % lables vector carry the first char(number)of the name of the 100 sample 
     c=c+1;   % de kanet comment wel satr eli fo2eh kmaaaaaaaaaaaaaaaaan 
     y(i-2,index:index+17)=CEntriodForOnePic(path);  % function (centroid for one pic) gets centroid of sample images
     
 end
 
 save 'D:\FCI\Years\third year summer\Pattern\Assignments\Assignment #6 & #7 (Kmeans & Neural)\Dataset' y labels;
 
 

end

