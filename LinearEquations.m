clc
clear all
close all


%A
N = 10;
density = 3;
index = 184865;
[Edges] = generate_network(N, density);


%B
d = 0.85;
B = sparse(Edges(1,:), Edges(2,:), 1, N, N);
L = zeros(N, 1);
for i = 1:N
    L(i) = sum(B(:, i));
end
A = spdiags(1./L, 0, N, N);
I = speye(N);
b(1:N, 1) = (1-d)/N;
save zadB_184865 A B I b


%C
M = sparse(I - d * B * A);
r = M \ b;
save zadC_184865 r


%D
density = 10;
N = [500,1000,3000,6000,12000];
time = zeros(1,5);
for i = 1:5
    [Edges] = generate_network(N(i), density);
    B = sparse(Edges(1,:), Edges(2,:), 1, N(i), N(i));
    L = zeros(N(i), 1);
    for j = 1:N(i)
        L(j) = sum(B(:, j));
    end
    A = spdiags(1./L, 0, N(i), N(i));
    I = speye(N(i));
    b(1:N(i), 1) = (1-d)/N(i);
    M = sparse(I - d * B * A);
    tic;
    r = M \ b;
    time(i) = toc;
end
plot(N, time);
title("Time of calculations");
xlabel("Size of a matrix");
ylabel("Time [s]");
saveas(gcf, "zadD_184865.png");


%E
clc
clear all

d=0.85;
density = 10;
N = [500,1000,3000,6000,12000];
time_Jacobi = zeros(1,5);
iterations = zeros(1,5);
norm_res = zeros(1,5);
for i = 1:5
    [Edges] = generate_network(N(i), density);
    B = sparse(Edges(1,:), Edges(2,:), 1, N(i), N(i));
    L = zeros(N(i), 1);
    for j = 1:N(i)
        L(j) = sum(B(:, j));
    end
    A = spdiags(1./L, 0, N(i), N(i));
    I = speye(N(i));
    b(1:N(i), 1) = (1-d)/N(i);
    M = sparse(I - d * B * A);
    L = tril(M,-1);
    U = triu(M,1);
    D = diag(diag(M));
    r = ones(N(i), 1);
    res = ones(N(i), 1);
    iterations(i) = 1;
    k=1;
    tic;
    while norm(res) > 10^-14
        r = -D\(L+U)*r+D\b;
        res = M*r-b;
        if N(i)==1000
            norm_res(k) = norm(res);
            k = k+1;
        end
        iterations(i) = iterations(i)+1;
    end
    time_Jacobi(i) = toc;
end

figure();
plot(N, time_Jacobi);
title("Time of analysis with Jacobi's method");
xlabel("Size of a matrix");
ylabel("Time [s]");
saveas(gcf, "zadE_184865_1.png");

figure();
plot(N, iterations);
title("Number of iterations with Jacobi's method");
xlabel("Size of a matrix");
ylabel("Number of iterations");
saveas(gcf, "zadE_184865_2.png");

figure();
semilogy(norm_res);
title("Norm of the residuals with Jacobi's method for N=1000");
xlabel("Iterations");
ylabel("Norm of the residuals");
saveas(gcf, "zadE_184865_3.png");


%F
clc
clear all

d=0.85;
density = 10;
N = [500,1000,3000,6000,12000];
time_GS = zeros(1,5);
iterations = zeros(1,5);
norm_res = zeros(1,5);
for i = 1:5
    [Edges] = generate_network(N(i), density);
    B = sparse(Edges(1,:), Edges(2,:), 1, N(i), N(i));
    L = zeros(N(i), 1);
    for j = 1:N(i)
        L(j) = sum(B(:, j));
    end
    A = spdiags(1./L, 0, N(i), N(i));
    I = speye(N(i));
    b(1:N(i), 1) = (1-d)/N(i);
    M = sparse(I - d * B * A);
    L = tril(M,-1);
    U = triu(M,1);
    D = diag(diag(M));
    r = ones(N(i), 1);
    res = ones(N(i), 1);
    iterations(i) = 1;
    k=1;
    tic;
    while norm(res) > 10^-14
        r = -(D+L)\(U*r)+(D+L)\b;
        res = M*r-b;
        if N(i)==1000
            norm_res(k) = norm(res);
            k = k+1;
        end
        iterations(i) = iterations(i)+1;
    end
    time_GS(i) = toc;
end

figure();
plot(N, time_GS);
title("Time of analysis with Gauss-Seidl's method");
xlabel("Size of a matrix");
ylabel("Time [s]");
saveas(gcf, "zadF_184865_1.png");

figure();
plot(N, iterations);
title("Number of iterations with Gauss-Seidl's method");
xlabel("Size of a matrix");
ylabel("Number of iterations");
saveas(gcf, "zadF_184865_2.png");

figure();
semilogy(norm_res);
title("Norm of the residuals with Gauss-Seidl's method for N=1000");
xlabel("Iterations");
ylabel("Norm of the residuals");
saveas(gcf, "zadF_184865_3.png");


%G
clc
clear all

time = zeros(1,3);
load 'Dane_Filtr_Dielektryczny_lab3_MN.mat';

tic;
r = M\b;
time(1)=toc;

tic;
L = tril(M,-1);
U = triu(M,1);
D = diag(diag(M));
r = ones(20000, 1);
res = ones(20000, 1);
while norm(res) > 10^-14
    r = -D\(L+U)*r+D\b;
    res = M*r-b;
end
time(2)=toc;

disp(time);

tic;
r = ones(20000, 1);
res = ones(20000, 1);
while norm(res) > 10^-14
    r = -(D+L)\(U*r)+(D+L)\b;
    res = M*r-b;
end
time(3)=toc;

disp(time);
