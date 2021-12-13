clc 
clear

starting_points = [[0,0];[-1,-1];[1,1]];
epsilon = 0.001;
ex_case = 2;
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

k = 1;
gamma = 1;
x_solve(k) = func(x0(k),y0(k));

while norm(f_grad(x0(k),y0(k))) >= epsilon
    f_hess = f_hessian(x0(k),y0(k));
    meu = 0;
    H = f_hess + meu*eye(size(f_hess));
    while H(1,1)<0 || H(1,1)*H(2,2)-H(1,2)*H(2,1)<0
        H = f_hess + meu*eye(size(f_hess));
        meu = meu+1;
    end
    fgrad =f_grad(x0(k),y0(k))';
    d(k,:) = -H\fgrad;
    x0(k+1) = x0(k) + gamma*d(1);
    y0(k+1) = y0(k) + gamma*d(2);
    k = k+1;
    x_solve(k) = func(x0(k),y0(k));
end

answer = x_solve(end);

figure(1)
plot(1:k,x_solve,'-x')
title('Levenberg Marquardt - constant gamma')
xlabel('Number of repetitions')
ylabel('f(x,y)')