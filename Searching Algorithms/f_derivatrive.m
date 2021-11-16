%Function inputs:
% x = value we need to calculate
% i = (1,2,3) choose function f_1,f_2,f_3 respectively
function der_ans = f_derivatrive(x,i)
    syms z;
        if i ==1
            f = (z-3)^2 + sin(z+3)^2;
            der = diff(f);
            der_ans = vpa(subs(der,z,x));
        elseif i == 2
            f = (z-1)*cos(0.5*z) + z^2;
            der = diff(f);
            der_ans = vpa(subs(der,z,x));
        else
            f = (z+2)^2 + exp(z-2)*sin(z+3);
            der = diff(f);
            der_ans = vpa(subs(der,z,x));
        end
end