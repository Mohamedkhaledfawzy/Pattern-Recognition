cfunction [  ] = TheBigVector(  )
 y=zeros(100,18); % vector of centroid feature of the 100 sample image 
 List = dir('D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #1 (Centroid)\Training Data\*.bmp');  % Read the directory of samples
 Folder = 'D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #1 (Centroid)\Training Data\'; % string take samples directory to append
 index=1;
 labels={};
 c=1; % counter
 for i=1 : length(List)
     path = strcat(Folder,List(i).name);
     labels{c}=List(i).name(1);   % lables vector carry the first char(number)of the name of the 100 sample
     c=c+1;
     y(i,index:index+17)=CEntriodForOnePic(path);  % function (centroid for one pic) gets centroid of sample images
     
 end
 save 'D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #1 (Centroid)\Patt.assig#1\Feature.mat' y labels;
 
 

end

