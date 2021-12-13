function [z] = gamma_fun(x,y,d,gamma1)
        syms g
        x1_f = x + g*d(1);
        y1 = y + g*d(2);
        f = (x1_f^3)*exp(-x1_f^2-y1^4);
        z = vpa(subs(f,g,gamma1));
    end