clc;
%Changing epsilon values
epsilon = [0.001:0.001:0.004];
j = 1;
for i = epsilon
   % in order to choose a different function
   %specify dichotomous_method(1/2/3) to choose between f_1, f_2, f_3 
    [lower_limit, upper_limit, steps] = dichotomous_method3(i,0.01);
    calc_of_f(j,1) = steps;
    j = j+1;
end

figure()
scatter(epsilon,calc_of_f(:,1),'filled');
title('Calculations of f for different epsilon values')
xlabel('Epsilon Values')
ylabel('Steps')


%Changing Lambda Values

lambda = [0.01:0.01:0.05];
j = 1;
figure()
hold on;
for i = lambda
    [lower_limit, upper_limit, steps] = dichotomous_method3(0.001,i);
    scatter(1:length(lower_limit),lower_limit(:,1),'filled')
    scatter(1:length(upper_limit),upper_limit(:,1),'filled')
    calc_of_f_lambda(j,1) = steps;
    j = j+1;
end
hold off;


figure()
scatter(lambda,calc_of_f_lambda(:,1),'filled');
title('Calculations of f for different lambda values')
xlabel('Lambda Values')
ylabel('Steps')

function [lower_limit, upper_limit,calculations_of_f] = dichotomous_method1(epsilon,lambda)
    a = -4;
    b = 4;
    counter = 1;
    calculations_of_f = 0;
    
    while b - a > lambda
        x1_k = (a+b)/2 - epsilon;
        x2_k = (a+b)/2 + epsilon;
        calculations_of_f = calculations_of_f + 2;
        if f_1(x1_k) < f_1(x2_k)
            b = x2_k;
        elseif f_1(x1_k) > f_1(x2_k)
            a = x1_k;
        end
        
        %store values of a,b
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
    
    function f_1 = f_1(x)
        f_1 = (x-3)^2 +sin(x+3)^2;
    end
end

function [lower_limit, upper_limit,calculations_of_f] = dichotomous_method2(epsilon,lambda)
    a = -4;
    b = 4;
    counter = 1;
    calculations_of_f = 0;
    
    while b - a > lambda
        x1_k = (a+b)/2 - epsilon;
        x2_k = (a+b)/2 + epsilon;
        calculations_of_f = calculations_of_f + 2;
        if f_2(x1_k) < f_2(x2_k)
            b = x2_k;
        elseif f_2(x1_k) > f_2(x2_k)
            a = x1_k;
        end
        
        %store values of a,b
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
    
    function f_2 = f_2(x)
        f_2 = (x-1)*cos(0.5*x) + x^2;
    end
end

function [lower_limit, upper_limit,calculations_of_f] = dichotomous_method3(epsilon,lambda)
    a = -4;
    b = 4;
    counter = 1;
    calculations_of_f = 0;
    
    while b - a > lambda
        x1_k = (a+b)/2 - epsilon;
        x2_k = (a+b)/2 + epsilon;
        calculations_of_f = calculations_of_f + 2;
        if f_3(x1_k) < f_3(x2_k)
            b = x2_k;
        elseif f_3(x1_k) > f_3(x2_k)
            a = x1_k;
        end
        
        %store values of a,b
        lower_limit(counter,1) = a;
        upper_limit(counter,1) = b;
        counter = counter + 1;
    end
    
    function f_3 = f_3(x)
        f_3 = (x+2)^2 + exp(x-2)*sin(x+3);
    end
end