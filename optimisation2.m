clear all
gamedata = csvread(strcat('pirates.csv'));
[n, c] = size(gamedata);
ts = 30;
sols = zeros(n, 4);

for i = 1:n
    p = 100*gamedata(i,1:3)';
    r = gamedata(i,4:6)';
    cvx_solver gurobi
    cvx_begin
        variable x(3) integer
        maximize( sum((1-max(p - x,0)/100).*r) )
        subject to
            sum(x) == ts;
            x>=0;
    cvx_end
    sols(i,:) = [x' cvx_optval];
end

csvwrite('piratesSolved.csv',sols);
clc