function offspringc = crossover1(popnum,hc,pc,parent,D,xmin,xmax)
% 模拟二进制交叉
offspringc = [];
% popnum/2 是为了保持子代种群规模还是100
for j = 1 : 2 : popnum
    s = randperm(popnum);
    %这里要重新产生1-n的包含n个数的随机排列，这里的n是100，上面的s1从第二次迭代开始是1-200，所以要区分，不能直接用前面的
    % 产生0~1 之间的随机数
    se1=s(1);
    se2=s(2);
    for k = 1 :D
        if rand < pc
            u = rand;
            % 交叉
            if u <= 0.5
                B = (2 * u)^(1/(hc + 1));
            else
                B = (1/(2*(1-u)))^(1/(hc + 1));
            end
            offspringc(j,k) = 0.5 *[(1-B)* parent(se1,k) + (1+B)* parent(se2,k)];
            offspringc(j+1,k) = 0.5 *[(1-B)* parent(se2,k) + (1+B)* parent(se1,k)];
            offspringc(j,k) = max(offspringc(j,k),xmin);
            offspringc(j+1,k) = min(offspringc(j+1,k),xmax);
        else
            offspringc(j,k) = parent(se1,k);
            offspringc(j+1,k) = parent(se2,k);
        end
    end
end
