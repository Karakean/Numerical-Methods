function [xvect,xdif,fx,it_cnt]=bisect(left,right,eps,fun)
    for i = 1:1000
        mid = (left + right)/2;
        xvect(i) = mid;
        if(i == 1)
            xdif(i)=abs(xvect(i));
        else
            xdif(i)=abs(xvect(i)-xvect(i-1));
        end
        fx(i) = feval(fun, mid);
        if abs(fx(i)) < eps || abs(right-left) < eps
            it_cnt = i;
            return;
        elseif feval(fun, left)*feval(fun, mid) < 0
            right = mid;
        else
            left = mid;
        end
    end
end

