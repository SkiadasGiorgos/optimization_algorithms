function fg =  f_grad(x0,y0)
   syms x y
   f = 0.5*x^2 +2*y^2;
   f1 = jacobian(f,[x,y]);
   fg = vpa(subs(f1,[x,y],[x0,y0]));
end