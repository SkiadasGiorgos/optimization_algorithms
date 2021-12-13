function gamma1 =  armijo(x_k,y_k,d)
    a = 10^(-2);
    b = 0.3;
    m_k = 0;
    s = 2;
    gamma1 = s*b^m_k;
    x_k2 = x_k + gamma1*d(1);
    y_k2 = y_k + gamma1*d(2);
    while func(x_k,y_k) - func(x_k2,y_k2) < -(a*(b^m_k)*s*d'*f_grad(x_k,y_k))
        m_k = m_k + 1;
        gamma1 = s*b^m_k;
        x_k2 = x_k + gamma1*d(1);
        y_k2 = y_k + gamma1*d(2);
       
    end  
end