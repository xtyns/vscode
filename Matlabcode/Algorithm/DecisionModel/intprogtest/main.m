%上述问题的非线性算法
clear;clc;

A=[7 20];b=[70];
Aeq=[];beq=[];
lb=zeros(2,1);
ub=[inf,inf];
x0=rand(2,1);
%[x,fval,exitflag]=fmincon('f',x0,A,b,Aeq,beq,lb,ub,'Nonf');

[x,fval,exitflag]=intprogBranch('f',x0,A,b,Aeq,beq,lb,ub,'Nonf');
