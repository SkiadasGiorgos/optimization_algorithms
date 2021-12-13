clear;
clc;

starting_points = [[0,0];[-1,-1];[1,1]];
epsilon = 0.001;
ex_case = 3;
k = 1;

if ex_case == 1
    x0(k) = starting_points(1,1);
    y0(k) = starting_points(1,2);
elseif ex_case == 2
    x0(k) = starting_points(2,1);
    y0(k) = starting_points(2,2);
elseif ex_case == 3
    x0(k) = starting_points(3,1);
    y0(k) = starting_points(3,2);
end

fg = f_grad(x0(k),y0(k));
x_solve(k) = func(x0(k),y0(k));

while norm(f_grad(x0(k),y0(k))) >= epsilon
    d = -f_grad(x0(k),y0(k));
    gamma = armijo(x0(k),y0(k),d);
    x0(k+1) = x0(k) + gamma*d(1);
    y0(k+1) = y0(k) + gamma*d(2);
    k = k+1;        
    x_solve(k) = func(x0(k),y0(k));
end

result = x_solve(end);
figure(1)
plot(y0,x0)

kplot = 1:k;
figure (2)
plot(kplot,x_solve)
title('Steepest Descent - Armijo Rule')
xlabel('Number of repetitions')
ylabel('f(x,y)')
