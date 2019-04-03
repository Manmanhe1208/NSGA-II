
clear all
clc
% 初始化
popnum = 100;
xmin = 0;
xmax = 1;
% 列号
m = 2;
% 列的维度
D = 10;
%交叉概率
pc = 0.8; 
hc = 20;
%变异概率
pm = 0.1;
hm = 20;
for i = 1:popnum
    for j = 1:D
        x(i,j) = xmin + rand * (xmax - xmin);
    end
end
f = value1(x,popnum);
plot(f(:,1),f(:,2),'.')
% 非支配排序
[F,rank] = non_dominated_sort1(popnum,f);
% 拥挤距离
idistance = crowding_distance_assignment1(popnum,f,F,m);
% 精英保留策略
parent = elitist_strategy1(popnum,F,x,idistance);
iter = 200;
for i = 1 : iter
    i
    % 模拟二进制交叉
    % 交叉算子
    offspringc = crossover1(popnum,hc,pc,parent,D,xmin,xmax);
% %     % 变异
% %     % 多项式变异
% %     % 变异算子
    offspringm = mutation1(pm,hm,offspringc,popnum,xmin,xmax,D);
%     offspringm=genetic_operate1(x,m,D,hc,hm,xmax,xmin,popnum,pc,pm);
%     offspringm = genetic_operate(parent,m,D,hc,hm,xmax,xmin);
    x = [parent;offspringm];
    f = value1(x,length(x));
    [F,rank] = non_dominated_sort1(length(x),f);
    idistance = crowding_distance_assignment1(length(x),f,F,m);
    irank = 1;
    parent = [];
    % 精英保留策略
    parent = elitist_strategy1(popnum,F,x,idistance);  
    f = value1(parent,popnum);
    plot(f(:,1),f(:,2),'*')    
    pause(0.1) 
end



