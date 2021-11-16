
function [] = K_mean(k)

load 'D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #6 & #7 (Kmeans & Neural)\Dataset\Feature.mat' y labels;

[IDX , CB] = kmeans(y,k);

size(IDX); % checking only
size(CB)  ;% checking only 

FV = y  ; % the feature vector

%labelss = cell2mat(labels);

[xx,yy]=size(IDX);

pic = zeros(1,18);

Cluster1=[]; c1 = 1 ; label1={};
Cluster2=[]; c2 = 1 ; label2={};
Cluster3=[]; c3 = 1 ; label3={};
Cluster4=[]; c4 = 1 ; label4={};
Cluster5=[]; c5 = 1 ; label5={};
Cluster6=[]; c6 = 1 ; label6={};
Cluster7=[]; c7 = 1 ; label7={};
Cluster8=[]; c8 = 1 ; label8={};
Cluster9=[]; c9 = 1 ; label9={};
Cluster10=[]; c10 = 1 ; label10={};

for i=1 : 100
   
    pic = FV(i,:) ;
    
    
    if IDX(i) == 1
       
        Cluster1(c1,1:18) = pic ;
        label1{c1} = labels{i};
        c1 = c1 + 1 ;
        
           
    elseif IDX(i) == 2 
            
           Cluster2(c2,1:18) = pic ;
           label2{c2} = labels{i};
           c2 = c2 + 1 ;
           
    elseif IDX(i) == 3            
           Cluster3(c3,1:18) = pic ;
           label3{c3} = labels{i};
           c3 = c3 + 1 ;
        
    elseif IDX(i) == 4            
           Cluster4(c4,1:18) = pic ;
           label4{c4} = labels{i};
           c4 = c4 + 1 ;
        
    elseif IDX(i) == 5            
           Cluster5(c5,1:18) = pic ;
           label5{c5} = labels{i};
           c5 = c5 + 1 ;
        
    elseif IDX(i) == 6            
           Cluster6(c6,1:18) = pic ;
           label6{c6} = labels{i};
           c6 = c6 + 1 ;
        
    elseif IDX(i) == 7            
           Cluster7(c7,1:18) = pic ;
           label7{c7} = labels{i};
           c7 = c7 + 1 ;
        
    elseif IDX(i) == 8            
           Cluster8(c8,1:18) = pic ;
           label8{c8} = labels{i};
           c8 = c8 + 1 ;
        
    elseif IDX(i) == 9            
           Cluster9(c9,1:18) = pic ;
           label9{c9} = labels{i};
           c9 = c9 + 1 ;
        
    elseif IDX(i) == 10            
           Cluster10(c10,1:18) = pic ;
           label10{c10} = labels{i};
           c10 = c10 + 1 ;
           
        end
end

%%IDX

%%Cluster1
%%label3



end

