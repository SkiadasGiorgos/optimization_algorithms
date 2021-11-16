clc;
format long;

lambda = [0.5:0.1:1];
hold on;
j= 1;
for i = lambda
   % in order to choose a different function
   %specify fibonacci_method(1/2/3) to choose between f_1, f_2, f_3
    [n, lower_limit ,upper_limit] = fibonacci_method1(i,0.001);
    scatter(1:length(lower_limit),lower_limit(1,:),'filled')
    scatter(1:length(upper_limit),upper_limit(1,:),'filled')
    f_calculations(j,1) = n;
    j = j+1;
end
title('Boundaries over different lambda')
xlabel('Steps over time')
ylabel('Boundaries')
hold off;

figure()
scatter(lambda,f_calculations(:,1),50,'filled','blue');
title('Calculations of f for different lambda values')
xlabel('Lambda Values')
ylabel('Steps')

function [n, a , b] = fibonacci_method1(lambda,epsilon)
    k = 1;
    rand = true;
    
    n = ceil((4-(-4))/lambda);
    F_n = fibonacci(n);
    
    %initialize matrices
    x_1 = zeros(1,ceil(n/2+1));
    x_2 = zeros(1,ceil(n/2+1));
    a = zeros(1,ceil(n/2+1));
    b = zeros(1,ceil(n/2+1));
    
    a(1,k) = -4;
    b(1,k) = 4;
    
    
    
    x_1(1,k) = a(1,k) + (F_n(end-2)/F_n(end))*(b(1,k)-a(1,k));
    x_2(1,k) = a(1,k) + (F_n(end-1)/F_n(end))*(b(1,k)-a(1,k));
    while k ~= n-2
        if f(x_1(1,k)) > f(x_2(1,k))
            a(1,k+1) = x_1(1,k);
            b(1,k+1) = b(1,k);
            x_1(1,k+1) = x_2(1,k);
            x_2(1,k+1) = a(1,k+1) + (F_n(n-k-1)/F_n(n-k))*(b(1,k+1)-a(1,k+1));
            
        elseif f(x_1(1,k)) < f(x_2(1,k)) 
            a(1,k+1) = a(1,k);
            b(1,k+1) = x_2(1,k);
            x_2(1,k+1) = x_1(1,k);
            x_1(1,k+1) = a(1,k+1) + (F_n(n-k-2)/F_n(n-k))*(b(1,k+1)-a(1,k+1));
            
        end
        if f(x_1(1,k)) == f(x_2(1,k))
            break
        end
        k = k+1;
    end
    
    x_1(1, end) = x_1(1,end-1);
    x_2(1,end) = x_1(1,end-1)+epsilon;
    
    if f(x_1(1,end)) > f(x_2(1,end))
        a(1,end) = x_1(1,end);
        b(1,end) = b(1,end-1);
    else
        a(1,end) = a(1,end-1);
        b(1,end) = x_2(1,end);
    end
    
    function f = f(x)
        f = (x-3)^2+sin(x+3)^2;
    end

    function  [seq] = fibonacci(x)
    temp = zeros(1,x);
    temp(1,2:3) = 1;
        for i = 3:x
             temp(1,i) = temp(1,i-1) + temp(1,i-2);

        end
    seq =temp;
    end
 end


