function [] = msse (Z)
    
    big_vector = Z ;
    
    B_Vector = ones(100,1);

   % Temp_matrix = big_vector;
    [XX YY] = size(big_vector);
    
    Count = 1;
    
    for i = 1 : 10 : XX 
        
        big_vector = big_vector * -1; 
        
        big_vector(i:i+9, :) = big_vector(i:i+9, :) * -1;
        
        Z = big_vector;
        
        Transposed_Z_multi_Z = Z' * Z;
        
        Inversed = pinv(Transposed_Z_multi_Z);    % pinv to get inverse for un squared matrix
        
        Inversed_multi_Transposed_Z = Inversed * Z';
        
        Final_result = Inversed_multi_Transposed_Z * B_Vector;

        weights_vector(:,Count) = Final_result;
        
        Count = Count + 1;
        
    %    big_vector =  Temp_matrix;        
        
    end
    
    
    save 'D:\FCI\Second term\Pattern\Assignments\Opera\Assignment #4 (MSE)\Feature.mat' weights_vector;

end

