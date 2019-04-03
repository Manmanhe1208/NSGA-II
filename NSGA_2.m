
clear all
clc
% ��ʼ��
popnum = 100;
xmin = 0;
xmax = 1;
% �к�
m = 2;
% �е�ά��
D = 10;
%�������
pc = 0.8; 
hc = 20;
%�������
pm = 0.1;
hm = 20;
for i = 1:popnum
    for j = 1:D
        x(i,j) = xmin + rand * (xmax - xmin);
    end
end
f = value1(x,popnum);
plot(f(:,1),f(:,2),'.')
% ��֧������
[F,rank] = non_dominated_sort1(popnum,f);
% ӵ������
idistance = crowding_distance_assignment1(popnum,f,F,m);
% ��Ӣ��������
parent = elitist_strategy1(popnum,F,x,idistance);
iter = 200;
for i = 1 : iter
    i
    % ģ������ƽ���
    % ��������
    offspringc = crossover1(popnum,hc,pc,parent,D,xmin,xmax);
% %     % ����
% %     % ����ʽ����
% %     % ��������
    offspringm = mutation1(pm,hm,offspringc,popnum,xmin,xmax,D);
%     offspringm=genetic_operate1(x,m,D,hc,hm,xmax,xmin,popnum,pc,pm);
%     offspringm = genetic_operate(parent,m,D,hc,hm,xmax,xmin);
    x = [parent;offspringm];
    f = value1(x,length(x));
    [F,rank] = non_dominated_sort1(length(x),f);
    idistance = crowding_distance_assignment1(length(x),f,F,m);
    irank = 1;
    parent = [];
    % ��Ӣ��������
    parent = elitist_strategy1(popnum,F,x,idistance);  
    f = value1(parent,popnum);
    plot(f(:,1),f(:,2),'*')    
    pause(0.1) 
end



