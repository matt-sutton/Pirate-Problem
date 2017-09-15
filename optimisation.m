clear all
gamedata = csvread(strcat('pirate.csv'));
dim(

p = 100*[0.2 0.8 0.2]';
r = [30 30 10]';
ts = 30;
sols = zeros(n, 4);

cvx_solver gurobi
cvx_begin
    variable x(3) integer
    maximize( sum((1-max(p - x,0)/100).*r) )
    subject to
        sum(x) == ts;
        x>=0;
cvx_end

clc

sprintf('# Coin = (%d %d %d), Exp Rwd = %d \n',x',cvx_optval)