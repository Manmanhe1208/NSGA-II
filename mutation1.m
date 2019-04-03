function offspringm = mutation1(pm,hm,offspringc,popnum,xmin,xmax,D)
offspringm = [];
for j = 1 : popnum
    for k = 1 :D
        if rand < pm
            r = rand;
            if r < 0.5
                mu = (2 * r)^(1/(hm + 1))-1;
            else
                mu = 1 - [2 * (1-r)]^(1/(hm + 1));
            end 
            offspringm(j,k)= offspringc(j,k) + mu * (xmax-xmin);
            offspringm(j,k) = max(offspringm(j,k),xmin);
            offspringm(j,k) = min(offspringm(j,k),xmax);
        else
            offspringm(j,k) = offspringc(j,k);
        end
    end
end

% offspringm = [];
%     for j = 1 : popnum
%         r = rand(1);
%         if r < 0.5
%             mu = (2 * r)^(1/(hm + 1))-1;
%         else
%             mu = 1 - [2 * (1-r)]^(1/(hm + 1));
%         end
%         if r < pm
%             offspringm1= offspringc(j,1) + mu * (xmax-xmin);
%             for k = 1 : D
%                 offspringm1(1,k) = max(offspringc(1,k),xmin);
%                 offspringm1(1,k) = min(offspringc(1,k),xmax);
%             end
%             offspringm = [offspringm;offspringm1];
%         else
%             % 不进行变异
%             offspringm = [offspringm;offspringc];
%         end
%     end