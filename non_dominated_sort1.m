function [F,rank] = non_dominated_sort1(popnum,f)
% 个体属性的初始化
% n 代表种群中支配个体i的解的个数
% s 代表被个体i所支配的解个体的集合
for i = 1 : popnum
    person(i).n = 0;
    person(i).s = [];
end
for i = 1 : popnum
    for j = i+1 : popnum
        more = 0;
        less = 0;
        equal = 0;
        for k = 1 : 2
            if f(i,k) > f (j,k)
               more = more + 1;
            elseif f(i,k) < f (j,k)
                less = less + 1;
            else
                equal = equal + 1;
            end
        end 
            if more == 0 && equal ~= 2
                person(i).s = [person(i).s,j];
                person(j).n = person(j).n + 1;
            elseif less == 0 && equal ~= 2
                person(j).s = [person(j).s,i];
                person(i).n = person(i).n + 1;
            end 
    end
end
% 循环实现支配分级
% 第一支配等级
% 等级
r = 1;
z(r).f = [];
rank = zeros(1,popnum);
for i = 1 : popnum
    if person(i).n ==  0
        z(r).f = [z(r).f,i];
        rank(i) = r;
    end
end
while(~isempty(z(r).f))
r = r + 1;
z(r).f = [];
b = z(r-1).f;
for i = 1 : length(b)
    a = person(b(i)).s;
    for j = 1 :length(a)
        person(a(j)).n =  person(a(j)).n -1;
        if person(a(j)).n  == 0
            z(r).f = [z(r).f,a(j)];
            rank(i) = r;
        end   
    end
end
end
% 去掉最后一个空集
for i = 1 : r-1
    F(i).f = z(i).f;
end

% for i = 1 : popnum
%     person(i).n = 0;
%     person(i).s = [];
% end

% % 第一支配级
% % 初始化等级都为0
% rank = zeros(1,popnum);
% z1 = [];
% for i = 1 : popnum
%     if person(i).n ==  0
%         z1 = [z1,i];
%         rank = 1;
%     end
% end
% % 第二支配等级
% z2 = [];
% for i = 1:length(z1)
%     % 访问z1(i)中的每个成员j,并将nj-1
%     a = person(z1(i)).s;
%     for j = 1:length(a)
%         person(a(j)).n =  person(a(j)).n -1;
%         if person(a(j)).n  == 0 
%             z2 = [z2,a(j)];
%             rank = 2;
%         end
%     end  
% end