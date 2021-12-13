clc 
clear

starting_points = [[0,0];[-1,-1];[1,1]];
epsilon = 0.001;
ex_case = 4;
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
else 
    x0(k) = -1.2;
    y0(k) = -0.8;    
end


k = 1;

x_solve(k) = func(x0(k),y0(k));
while norm(f_grad(x0(k),y0(k))) >= epsilon
    f_hes = (f_hessian(x0(k),y0(k)));
    if f_hes(1,1)<0 || f_hes(1,1)*f_hes(2,2)-f_hes(1,2)*f_hes(2,1)<0
        disp('The hessian is not positive definite - Error')
        break
    end
    fg = f_grad(x0(k),y0(k));
    d = -(f_hes\fg')';
    gamma = armijo(x0(k),y0(k),d);
    x0(k+1) = x0(k) + gamma*d(1);
    y0(k+1) = y0(k) + gamma*d(2);
    k = k+1;
    x_solve(k) = func(x0(k),y0(k));
end

answer = x_solve(end);

kplot = 1:k;
figure(1)
plot(kplot,x_solve,'-x')
title("Newton's Method - Armijo Rule")
xlabel('Number of repetitions')
ylabel('f(x,y)')
