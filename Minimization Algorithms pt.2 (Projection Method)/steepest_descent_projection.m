clc
clear

%constants 
g_k = [0.05 , 0.3 , 0.1] ;
starting_point = [10, -5 ; -7, 5; 17, -5];
epsilon = [0.01 , 0.02, 0.01];
s_k = [8,10,0.5];
q_select = 2;
k = 1;

if q_select == 1
    gamma = g_k(1);
    x0(k) = starting_point(1,1);
    y0(k) = starting_point(1,2);
    s = s_k(1);
    e = epsilon(1);
elseif q_select == 2
    gamma = g_k(2);
    x0(k) = starting_point(2,1);
    y0(k) = starting_point(2,2);
    s = s_k(2);
    e = epsilon(2);
elseif q_select == 3
    gamma = g_k(3);
    x0(k) = starting_point(3,1);
    y0(k) = starting_point(3,2);
    s = s_k(3);
    e = epsilon(3);
end

f_grad(x0(k),y0(k))
while norm(f_grad(x0(k),y0(k))) >= e
    sol = projection(x0(k),y0(k),s);
    x_bar = sol(1);
    y_bar = sol(2);
    x0(k+1) = x0(k) + gamma*(x_bar - x0(k));
    y0(k+1) = y0(k) + gamma*(y_bar - y0(k));
    k = k+1;    
end
sz = 10;
figure(1)
hold on
scatter(1:k,x0,sz,'filled')
scatter(1:k,y0,sz,'filled')
title('Steepest Descent - Projection')
xlabel('Number of repetitions')
ylabel('X and Y')
hold off

