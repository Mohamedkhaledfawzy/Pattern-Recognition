function [FV] = Chain (In_img,centroid)   % function hta5od el croped image , aw ya3ny el image eli hnesht3'l 3aleha 5alaas
[x y] = size(In_img);
FV = zeros(8*4*8,1);

s1 =0; 
s2 =0;

 for i=1:y
    if In_img(1,i)==1
    s1=1;
    s2=i;
    break;
    end
 end
 
 countour = bwtraceboundary(In_img,[s1,s2],'N');    % vector countour feh el indeces bta3t kol el pixels bta3t eli 3la el countour
 [rr cc] = size(countour);   % get size of countour 
 
 
 maxv=0;
 for i=1:rr
     Diff=sqrt(((countour(i,1)-centroid(1,1)).^2)+((countour(i,2)-centroid(1,2)).^2));   % getting ab3d point 3n el centroid
     if Diff > maxv
        maxv=Diff; 
     end
 end
   R = maxv;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
   

for i=1:rr-1     %looping on rows of countour vector
    slope=(countour(i,2)-centroid(1,2))/(countour(i,1)-centroid(1,1));
    track_num = 4 ;
    r=sqrt(((countour(i,1)-centroid(1,1)).^2)+((countour(i,2)-centroid(1,2)).^2));
    T =floor((r/R) * track_num) ;
    
    ceta=atand(slope);  
    sec_num = 8 ;
      if ceta < 0
         ceta = ceta+360 ;
      end
    S =floor( (ceta / 360) * sec_num );
    
    index=((T-1)*64)+((S-1)*8);   % bengeeb awl kemma
    index=abs(index);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1 = countour(i,1);
    y1 = countour(i,2);
    x2 = countour(i+1,1);
    y2 = countour(i+1,2);
    xDiff = x2 - x1;
    yDiff = y2 - y1;
    direc=0;
    if xDiff == 1 && yDiff ==0;
        direc=1;
        
    end
 
    if  xDiff == 1 && yDiff ==-1;
            direc=2;
             
        
    end
    if  xDiff == 0 && yDiff ==-1;
               direc=3;
                
    end
            
    if     xDiff == -1 && yDiff ==-1;
               direc=4;
                
    end      
                
    if   xDiff == -1 && yDiff ==0;
               direc=5;
               
    end          
                    
    if xDiff == -1 && yDiff ==1;
             direc=6;      
                              
    end    
    if    xDiff == 0 && yDiff ==1;
                direc=7;                 
    end      
    if  xDiff == 1 && yDiff ==1;
                   direc=8;
    end
    FV(index+direc)=FV(index+direc)+1;
end
FV=FV/rr;
end
                

        


