function [gamma1] = golden_search_gamma(x,y,d) 
    a = -4;
    b = 4;
    lambda = 0.01;
    gamma = 0.618;
    
    
    %first step
    x1 = a + (1-gamma)*(b-a);
    x2 = a + gamma*(b-a);
    counter = 2;
    %loop over second and third step    
    temp1 = gamma_fun(x,y,d,x1);
    temp2 = gamma_fun(x,y,d,x2);
    while b - a > lambda
       
        if temp1 > temp2
            a = x1;
            x1 = x2;
            x2 = a+gamma*(b-a);
            temp1 = temp2;
            temp2  = gamma_fun(x,y,d,x2);
        elseif temp2 > temp1
            b = x2;
            x2 = x1;
            x1 = a + (1-gamma)*(b-a);
            temp2 = temp1;
            temp1  = gamma_fun(x,y,d,x1);
        end
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
        
        gamma1 = (lower_limit(end)+upper_limit(end))/2;
        
    
   
end