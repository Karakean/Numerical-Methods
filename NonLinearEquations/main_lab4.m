%exercise 1
clc
clear all
close all
a = 1;
b = 60000;
eps = 1e-3;

%exercise 1, bisection method
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_time);
figure();
semilogy(1:it_cnt, xvect);
title("Approximation of the maximal number of parameters N with bisection method");
xlabel("Iteration number");
ylabel("Number of parameters N");
saveas(gcf, 'ex1_bisection_value.png');
figure();
semilogy(xdif);
title("Differences of numbers of input parameters N with bisection method");
xlabel("Iteration number");
ylabel("Differences of number of parameters N");
saveas(gcf, 'ex1_bisection_differences.png');

%exercise 1, secant method
[xvect, xdif, fx, it_cnt] = secant(a,b,eps,@compute_time);
figure();
semilogy(1:it_cnt, xvect);
title("Approximation of the maximal number of parameters N with secant method");
xlabel("Iteration number");
ylabel("Number of parameters N");
saveas(gcf, 'ex1_secant_value.png');
figure();
semilogy(xdif);
title("Differences of numbers of input parameters N with secant method");
xlabel("Iteration number");
ylabel("Differences of number of parameters N");
saveas(gcf, 'ex1_secant_differences.png');


%exercise 2
clc
clear all
a = 0;   
b = 50;
eps = 1e-12;

%exercise 2, bisection method
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_impedance);
figure();
plot(xvect);
title("Approximation of the value of angular frequency (omega) with bisection method");
xlabel("Itaration number");
ylabel("Value of omega [rad/s]");
saveas(gcf, 'ex2_bisection_value.png');
figure();
semilogy(xdif);
title("Differences of numbers of values of angular frequency (omega) with bisection method");
xlabel("Iteration number");
ylabel("Differences of values of omega");
saveas(gcf, 'ex2_bisection_differences.png');

%exercise 2, secant method
[xvect, xdif, fx, it_cnt] = secant(a,b,eps,@compute_impedance);
figure();
plot(xvect);
title("Approximation of the value of angular frequency (omega) with secant method");
xlabel("Itaration number");
ylabel("Value of omega [rad/s]");
saveas(gcf, 'ex2_secant_value.png');
figure();
semilogy(xdif);
title("Differences of numbers of values of angular frequency (omega) with secant method");
xlabel("Iteration number");
ylabel("Differences of values of omega");
saveas(gcf, 'ex2_secant_differences.png');


%exercise 3
clc
clear all
a = 0;   
b = 50;
eps = 1e-12;

%exercise 3, bisection method
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_velocity);
figure();
plot(xvect);
title("Approximation of time with bisection method");
xlabel("Itaration number");
ylabel("Time [s]");
saveas(gcf, 'ex3_bisection_value');
figure();
semilogy(xdif);
title("Differences of time with bisection method");
xlabel("Iteration number");
ylabel("Differences of time [s]");
saveas(gcf, 'ex3_bisection_differences');

%exercise 3, secant method
[xvect, xdif, fx, it_cnt] = secant(a,b,eps,@compute_impedance);
figure();
plot(xvect);
title("Approximation of time with secant method");
xlabel("Itaration number");
ylabel("Time [s]");
saveas(gcf, 'ex3_secant_value');
figure();
semilogy(xdif);
title("Differences of time with secant method");
xlabel("Iteration number");
ylabel("Differences of time [s]");
saveas(gcf, 'ex3_secant_differences');
