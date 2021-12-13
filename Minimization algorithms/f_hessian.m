function [z] = f_hessian(x0,y0)
    syms x y
    f = (x^3)*exp(-x^2-y^4);
    f1 = hessian(f,[x,y]);
    z = vpa(subs(f1,[x,y],[x0,y0]));
end