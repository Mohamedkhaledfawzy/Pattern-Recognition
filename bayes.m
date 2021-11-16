function [] = bayes ()
    
    big_vector = TheBigVector();
    
    
   % B_Vector = ones(100,1);

   % Temp_matrix = big_vector;
    [XX YY] = size(big_vector);
    
    
    cov_matr = [];
    mean_matr = [];
    
    for i = 1 : 10 : XX 
        
         
        
        covar = cov(big_vector(i:i+9, :));
        m = mean((big_vector(i:i+9, :)),2);     
        
        cov_matr = [cov_matr ; covar];
        mean_matr = [mean_matr ; m] ;
        
        
    end
    
    
    save 'C:\Users\DELL\Desktop\Bayes Classifier\cov_matr.mat' cov_matr;
    save 'C:\Users\DELL\Desktop\Bayes Classifier\mean_matr.mat' mean_matr;

end

