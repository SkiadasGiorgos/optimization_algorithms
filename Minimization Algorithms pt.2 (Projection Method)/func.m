function result =  func(x0,y0)
    syms x y
    f = 0.5*x^2 +2*y^2;
    result = vpa(subs(f,[x,y],[x0,y0]));    
end