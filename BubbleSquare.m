a = 1;
r_max = 0.42;
n_max = 100;
axis equal
hold on
x = zeros(1, n_max);
y = zeros(1, n_max);
r = zeros(1, n_max);
S = zeros(1, n_max);
dv = zeros(1, n_max);
dv_avg = zeros(1, n_max);
draws = 0;
n=1;
while n <= n_max
    fit = 0;
    while fit == 0
        draws = draws + 1;
        cx = rand*a;
        cy = rand*a;
        cr = rand*r_max;
        if cx-cr > 0 && cx+cr < a && cy - cr > 0 && cy + cr < a 
            fit = 1;
            if n == 1
                continue;
            end
            for i = 1:n
                cd = sqrt(((cx-x(i))^2 + (cy-y(i))^2));
                rs = cr + r(i);
                if cd < rs
                    fit = 0;
                    break;
                end
            end
        end
    end
    x(n) = cx;
    y(n) = cy;
    r(n) = cr;
    plot_circ(cx, cy, cr);
    if n==1
        S(n) = pi * cr^2;
    else
        S(n) = S(n-1) + pi * cr^2;
    end
    dv(n) = draws;
    dv_avg(n) = sum(dv)/n;
    draws = 0;
    fprintf(1, ' %s%5d%s%.3g\r ', 'n =',  n, ' S = ', S(n));
    pause(0.01);
    n = n+1;
end
n = n-1;
figure;
semilogx(S);
xlabel("n");
title("Total surface");

figure;
loglog(dv_avg);
xlabel("n");
title("Average draws number");


function plot_circ(X, Y, R)
    theta = linspace(0,2*pi);
    x = R*cos(theta) + X;
    y = R*sin(theta) + Y;
    plot(x,y)
end

