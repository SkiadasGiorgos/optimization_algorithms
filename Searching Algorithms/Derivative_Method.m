clc;

lambda = [0.001:0.001:0.01];
j =1;


figure()
hold on;

for i = lambda
    %in order to specify a function choose as second argument for derivative_method:
    % 1 for f_1, 2 for f_2, 3 for f_3
    [lower_limit,upper_limit,f_calc] = derivative_method(i,3);
    %plotting different boundaries for each lambda
    scatter(1:length(lower_limit), lower_limit(:,1),'filled')
    scatter(1:length(upper_limit), upper_limit(:,1),'filled')
    f_counter(j,1) = f_calc;
    j =j+1;
end

title('Boundaries over different lambda')
xlabel('Steps over time')
ylabel('Boundaries')
hold off;

%plotting function (f) calls per lambda
figure()
plot(f_counter,'--.','MarkerSize', 20,'LineWidth',1);
title('Calculations of f for different lambda values')
xlabel('Lambda Values')
ylabel('Steps')


function [lower_limit,upper_limit,f_counter] = derivative_method(lambda,func)
    %algorithm iterations
    max_n = log(lambda/(4-(-4)))/(log(.5));
    n = floor(max_n);

    %initialize matrices
    lower_limit = zeros(n,1);
    upper_limit = zeros(n,1);
    x = zeros(n,1);

    k = 1;
    %set boundaries
    lower_limit(1,1) = -4;
    upper_limit(1,1) = 4;
    
    %derivative method application
    f_counter = 0;
    while k < n
        x(k,1) = (lower_limit(k,1)+upper_limit(k,1))/2;
        x_dot = f_derivatrive(x(k,1),func);
        f_counter = f_counter + 1;
        if x_dot == 0
            break;
        elseif x_dot > 0
            lower_limit(k+1,1) = lower_limit(k,1);
            upper_limit(k+1,1) = x(k,1);
        elseif x_dot < 0
            lower_limit(k+1,1) = x(k,1);
            upper_limit(k+1,1) = upper_limit(k,1);
        end
        if k == n
            break;
        else
            k = k+1;
        end
    end  
    
end

