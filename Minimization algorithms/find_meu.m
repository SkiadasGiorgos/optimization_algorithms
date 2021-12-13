function meu = find_meu(hess)
    meu = 0;
    while  hess(1,1)<0 || hess(1,1)*hess(2,2)-hess(1,2)*hess(2,1)<0
        hess = hess + meu*eye(2);
        meu = meu+1;
    end
end