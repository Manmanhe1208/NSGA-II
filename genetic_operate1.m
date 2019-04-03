function offspringm=genetic_operate1(x,m,D,hc,hm,xmax,xmin,popnum,pc,pm)
% ģ������ƽ���
offspringm = [];
% popnum/2 ��Ϊ�˱����Ӵ���Ⱥ��ģ����100
for j = 1 : 2 : popnum
    s = randperm(popnum);
    %����Ҫ���²���1-n�İ���n������������У������n��100�������s1�ӵڶ��ε�����ʼ��1-200������Ҫ���֣�����ֱ����ǰ���
    % ����0~1 ֮��������
    %     se1=s(1);
    %     se2=s(2);
    selcrossindex = s(1:2);
    parent = x(selcrossindex,:);
    for k = 1 :D
        if rand < 0.9
            u = rand(1);
            % ����
            if u <= 0.5
                B = (2 * u)^(1/(hc + 1));
            else
                B = (1/(2*(1-u)))^(1/(hc + 1));
            end
            if u < pc
                parent(1,k) = 0.5 *[(1-B)* parent(1,k) + (1+B)* parent(2,k)];
                parent(2,k) = 0.5 *[(1-B)* parent(2,k) + (1+B)* parent(1,k)];
                for i = 1 : 2
                    parent(i,k) = max(parent(i,k),xmin);
                    parent(i,k) = min(parent(i,k),xmax);
                end
                
                %             offspringc(1,k) = 0.5 *[(1-B)* parent(se1,k) + (1+B)* parent(se2,k)];
                %             offspringc(2,k) = 0.5 *[(1-B)* parent(se2,k) + (1+B)* parent(se1,k)];
                %             % ���ƽ�����������
                %             offspringc(1,k) = max(offspringc(1,k),xmin);
                %             offspringc(2,k) = min(offspringc(2,k),xmax);
            end
        end
    end
    for k = 1 :D
        for i = 1 : 2
            if rand < 0.1
                r = rand(1);
                if r < 0.5
                    mu = (2 * r)^(1/(hm + 1))-1;
                else
                    mu = 1 - [2 * (1-r)]^(1/(hm + 1));
                end
                if r < pm
                    parent(i,k) = parent(i,k) + mu * (xmax - xmin);
                    parent(i,k) = max(parent(i,k),xmin);
                    parent(i,k) = min(parent(i,k),xmax);
                    %             offspringm(i,k)= offspringc(i,k) + mu * (xmax-xmin);
                    %             offspringm(i,k) = max(offspringm(i,k),xmin);
                    %             offspringm(i,k) = min(offspringm(i,k),xmax);
                end
            end
        end
    end
    offspringm(j:j+1,:)=parent;
end