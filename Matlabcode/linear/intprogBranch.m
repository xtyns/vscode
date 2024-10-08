function [x,fval,exitflag] = intprogBranch(f,A,b,Aeq,beq,lb,ub)
%该函数为线性整数规划的主函数，先判断线性有解性与是否为整数解再进行分支定界

options=optimset('display','off');
[x,fval,exitflag]=linprog(f,A,b,Aeq,beq,lb,ub,options);

if exitflag < 0   %有解性判断
    disp('该整数规划问题无解')
    return;
end

if x==floor(x)      %线性规划是否为整数解判断
    disp('该整数规划问题与线性规划问题同解')
    disp('该整数问题解为：')
    disp('x:')
    disp(x)
    disp('fval:')
    disp(fval)
    return
end

%二叉树进行分支定界
code=''; %二叉树编码码
[x,fval,exitflag]=Branch(f,A,b,Aeq,beq,lb,ub,code);

end

