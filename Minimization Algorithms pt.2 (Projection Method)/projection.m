function sol = projection(x0,y0,s)
    syms x y 
    f = 0.5*x^2 + 2*y^2;
    f1 = jacobian(f,[x,y]);
    f2 = x -s*f1;
    sol = vpa(subs(f2, [x,y],[x0,y0]));
    if sol(1) > 15 
        sol(1) =15;
    elseif sol(1) < -15
        sol(1) = -15;
    end
    if sol(2) > 12
        sol(2) = 12;
    elseif sol(2) < -20
        sol(2) = -20;
    end
end