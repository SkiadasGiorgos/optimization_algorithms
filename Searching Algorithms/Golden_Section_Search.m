clc;

j = 1;
figure()
hold on;
lambda = [0.1:0.1:1.1];


for i = lambda
   % in order to choose a different function
   %specify golden_search(1/2/3) to choose between f_1, f_2, f_3
    [lower_limit, upper_limit,counter] = golden_search1(i);
    lower_limit
    upper_limit
    scatter(1:length(lower_limit),lower_limit(:,1),'filled')
    scatter(1:length(upper_limit),upper_limit(:,1),'filled')
    steps(j,1) = counter; 
    j= j+1;
end
title('Boundaries over different lambda')
xlabel('Steps over time')
ylabel('Boundaries')
hold off;

figure()
scatter(lambda,steps(:,1),50,'filled','blue');
title('Calculations of f for different lambda values')
xlabel('Lambda Values')
ylabel('Steps')

function [lower_limit,upper_limit, counter] = golden_search1(lambda) 
    a = -4;
    b = 4;
    gamma = 0.618;
    
    
    %first step
    x1_k = a + (1-gamma)*(b-a);
    x2_k = a + gamma*(b-a);
    counter = 2;
    %loop over second and third step    
    while b - a > lambda
       
        if f_1(x1_k) > f_1(x2_k)
            a = x1_k;
            x1_k = x2_k;
            x2_k = a+gamma*(b-a);
        elseif f_1(x2_k) > f_1(x1_k)
            b = x2_k;
            x2_k = x1_k;
            x1_k = a + (1-gamma)*(b-a);
        end
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
        
        last_lower = lower_limit(end);
        last_upper = upper_limit(end);
    
    function [f_1] = f_1(x)
        f_1 = (x-3)^2 + (sin(x+3))^2;
    end
   
end

function [lower_limit,upper_limit, counter] = golden_search2(lambda) 
    a = -4;
    b = 4;
    gamma = 0.618;
    
    
    %first step
    x1_k = a + (1-gamma)*(b-a);
    x2_k = a + gamma*(b-a);
    counter = 1;
    %loop over second and third step    
    while b - a > lambda
       
        if f_2(x1_k) > f_2(x2_k)
            a = x1_k;
            x1_k = x2_k;
            x2_k = a+gamma*(b-a);
        elseif f_2(x2_k) > f_2(x1_k)
            b = x2_k;
            x2_k = x1_k;
            x1_k = a + (1-gamma)*(b-a);
        end
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
        
        last_lower = lower_limit(end);
        last_upper = upper_limit(end);
    
    function [f_2] = f_2(x)
        f_2 = (x-1)*cos(0.5*x)+x^2;
    end
   
end

function [lower_limit,upper_limit, counter] = golden_search3(lambda) 
    a = -4;
    b = 4;
    gamma = 0.618;
    
    
    %first step
    x1_k = a + (1-gamma)*(b-a);
    x2_k = a + gamma*(b-a);
    counter = 1;
    %loop over second and third step    
    while b - a > lambda
       
        if f_3(x1_k) > f_3(x2_k)
            a = x1_k;
            x1_k = x2_k;
            x2_k = a+gamma*(b-a);
        elseif f_3(x2_k) > f_3(x1_k)
            b = x2_k;
            x2_k = x1_k;
            x1_k = a + (1-gamma)*(b-a);
        end
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
        
        last_lower = lower_limit(end);
        last_upper = upper_limit(end);
    
    function [f_3] = f_3(x)
        f_3 = (x+2)^2 +exp(x-2)*sin(x+3);
    end
   
end

