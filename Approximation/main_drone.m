clc
clear all
close all
warning('off','all')
load trajectory1

%ex2
plot3(x,y,z,'o')
grid on
axis equal
title("Drone trajectory")
xlabel("x[m]")
ylabel("y[m]")
zlabel("z[m]")
saveas(gcf, '184865_Nowak_zad2.png')

%ex4
N = 50;
[~, xa] = approx_poly(n,x,N);
[~, ya] = approx_poly(n,y,N);
[~, za] = approx_poly(n,z,N);
figure()
plot3(x,y,z,'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real trajectory and polynomial approximated trajectory with N=50")
xlabel("x[m]")
ylabel("y[m]")
zlabel("z[m]")
saveas(gcf, '184865_Nowak_zad4.png')

%ex5
clc
clear all
close all
warning('off','all')
load trajectory2.mat
N=60;
[~, xa] = approx_poly(n,x,N);
[~, ya] = approx_poly(n,y,N);
[~, za] = approx_poly(n,z,N);
plot3(x,y,z,'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real trajectory and polynomial approximated trajectory with N=60")
xlabel("x[m]")
ylabel("y[m]")
zlabel("z[m]")
saveas(gcf, '184865_Nowak_zad5.png')
M=size(n,2);
for N = 1:71
    [~, ax] = approx_poly(n,x,N);
    [~, ay] = approx_poly(n,y,N);
    [~, az] = approx_poly(n,z,N);
    err(N) = (sqrt(sum((x-ax).^2)))/M+(sqrt(sum((y-ay).^2))/M)+(sqrt(sum((z-az).^2))/M);
end
figure()
semilogy(err)
title("Error of polynomial approximation")
xlabel("N")
ylabel("Error")
saveas(gcf, '184865_Nowak_zad5_b.png')

%ex7
clc
clear all
close all
warning('off','all')
load trajectory2.mat
N=60;
[xa] = approx_trig(n,x,N);
[ya] = approx_trig(n,y,N);
[za] = approx_trig(n,z,N);
plot3(x,y,z,'o')
grid on
axis equal
hold on
plot3(xa, ya, za, 'lineWidth', 4)
title("Real trajectory and trigonometric approximated trajectory with N=60")
xlabel("x[m]")
ylabel("y[m]")
zlabel("z[m]")
saveas(gcf, '184865_Nowak_zad7.png')
M=size(n,2);
for N = 1:71
    [ax] = approx_trig(n,x,N);
    [ay] = approx_trig(n,y,N);
    [az] = approx_trig(n,z,N);
    err(N) = (sqrt(sum((x-ax).^2)))/M+(sqrt(sum((y-ay).^2))/M)+(sqrt(sum((z-az).^2))/M);
end
figure()
semilogy(err)
title("Error of trigonometric approximation")
xlabel("N")
ylabel("Error")
saveas(gcf, '184865_Nowak_zad7_b.png')