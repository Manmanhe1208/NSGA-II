function offspringc = crossover1(popnum,hc,pc,parent,D,xmin,xmax)
% ģ������ƽ���
offspringc = [];
% popnum/2 ��Ϊ�˱����Ӵ���Ⱥ��ģ����100
for j = 1 : 2 : popnum
    s = randperm(popnum);
    %����Ҫ���²���1-n�İ���n������������У������n��100�������s1�ӵڶ��ε�����ʼ��1-200������Ҫ���֣�����ֱ����ǰ���
    % ����0~1 ֮��������
    se1=s(1);
    se2=s(2);
    for k = 1 :D
        if rand < pc
            u = rand;
            % ����
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
