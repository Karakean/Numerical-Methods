function [xvect,xdif,fx,it_cnt]=secant(left,right,eps,fun)
    xvect(1) = left;
    xvect(2) = right;
    prev = left;
    curr = right;
    for i = 1:1000
        next = curr - ((feval(fun,curr)*(curr-prev))/(feval(fun,curr)-feval(fun,prev)));
        prev = curr;
        curr = next;
        xvect(i) = curr;
        xdif(i) = abs(prev-curr);
        fx(i) = feval(fun, curr);
        if abs(fx(i)) < eps
            it_cnt = i;
            return
        end
    end
end