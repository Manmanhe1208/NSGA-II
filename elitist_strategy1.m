function parent = elitist_strategy1(popnum,F,x,idistance)
parent =[];
irank = 1;
  while length(parent) < popnum
        % 得到irank等级的标号
        % F是得到所有等级的标号
        F1 = F(irank).f;
        if length(parent) + length(F1) <= popnum
            % 如果数量小于种群规模，就将F1标号对应的所有个体全部放入parent中
            parent = [parent;x(F1,:)];
        else
            % 如果数量大于种群规模，算出parent需要F1中个体的数量
            number =  popnum - length(parent);
            % 得到F1标号的距离
            vdistance = idistance(F1);
            % 得到标号和标号对应的距离
            vdistance = [vdistance;F1];
            % 对距离进行降序排列,找拥挤距离最大的
            nondistance = sort(vdistance,2,'descend');
            % 得到parent中需要的个体的序号
            FF = nondistance(2,1:number);
            % 将F1标号对应拥挤距离最大的个体加入到parent中
            parent = [parent;x(FF,:)];
        end
        irank = irank + 1;
    end