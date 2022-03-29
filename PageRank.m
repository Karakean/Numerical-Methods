%A
N = 7;
top = [1 1 2 2 2 3 3 3 4 4 5 5 6 6 7];
bot = [4 6 3 4 5 5 6 7 5 6 4 6 4 7 6];
Edges = [top(:) bot(:)]';

%B
d = 0.85;
B = sparse(bot, top, 1, N, N);
L = zeros(N, 1);
for i = 1:N
    L(i) = sum(B(:, i));
end
A = spdiags(1./L, 0, N, N);
I = speye(N);
b(1:N, 1) = (1-d)/N;

%C
M = sparse(I - d * B * A);
r = M \ b;

%D
bar(r);
