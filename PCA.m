function [] = PCA(x , y , remove)

   img = imread('cameraman.tif');  
   
   imshow(img);
   figure ;
%**************************************
%padding
   [r c]=size(img);
    rr=0 ; cc=0 ;
    if mod(r,x)~=0   
    rr=x-mod(r,x);  
    end
    if mod(c,y)~=0    
    cc=y-mod(c,y);
    end
    mat=zeros(r+rr,c+cc);   
    mat(1:r,1:c)=img(:,:); 
    img=mat; 
    %imshow(img);
    %figure ;
%**************************************
%mat2cell
    [r c]=size(img);   % size el img ba3d mat3mlaha padding 
    h = r/x ; w = c/y ;  % h (3add el rows) , w (3dd el columns)
    v1=ones(1,h);
    v1=v1*x;
    v2=ones(1,w);
    v2=v2*y;
    new=mat2cell(img,v1,v2);  
    img = new ;
%**************************************
%extract blocks    
    
    mat=zeros(x*y,h*w);  
    count=1;
    for i=1:h
        for j=1:w
            mat(:,count)=reshape(img{i,j}',x*y,1);   
            count=count+1;                        
        end                                     
    end
    img=mat;
%***************************************
%get mean
    [r c]=size(img);
    %me=sum(transp(img));
    %me=me/c;
    %me=transp(me);
    me=mean(img,2);                
%*******************************************
%getXnew 
    new_img=img;
    for i=1:c
        new_img(:,i)=img(:,i)-me;     
    end
%*******************************************   
%get Covariance & diagonal
    z=cov(new_img,1);   % transposing the new_img that is the img - mean  , then get covariance 
   
    [v d]=eig(z);    
    [vr vc]=size(v);   
    diagonal=diag(d);   
    [sorted_diagonal , indx]= sort(diagonal,'descend');
    %v1=v(:,indx);  % sorting eigen vectors
    T=zeros(vr,vc);  %matrix T carries sorted eigen vector columns
    %normalized=normc(T);
    for i=1:vc
       T(:,i)=v(:,indx(i));
    end
%*********************************************
% get y & reduction
    Y = new_img*T';
    [r c]=size(Y);
    
    remove =floor((remove/100)*(r));
    for i=1:c
        for j=r-remove:r
            Y(j,i)=0;
        end
    end   
%*********************************************
%inverse
new_img=Y*T;

for i=1:c
img(:,i)=new_img(:,i)+me;
end
%**********************************************
% reconstruct the image
count=1;
    for i=1:h
        for j=1:w
            m=reshape(img(:,count),y,x);
            new{i,j}=m';
            count=count+1;
        end
    end    
img=cell2mat(new);
%*************************************************
image=uint8(img);
imshow(image);

end