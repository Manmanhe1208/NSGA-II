function parent = elitist_strategy1(popnum,F,x,idistance)
parent =[];
irank = 1;
  while length(parent) < popnum
        % �õ�irank�ȼ��ı��
        % F�ǵõ����еȼ��ı��
        F1 = F(irank).f;
        if length(parent) + length(F1) <= popnum
            % �������С����Ⱥ��ģ���ͽ�F1��Ŷ�Ӧ�����и���ȫ������parent��
            parent = [parent;x(F1,:)];
        else
            % �������������Ⱥ��ģ�����parent��ҪF1�и��������
            number =  popnum - length(parent);
            % �õ�F1��ŵľ���
            vdistance = idistance(F1);
            % �õ���źͱ�Ŷ�Ӧ�ľ���
            vdistance = [vdistance;F1];
            % �Ծ�����н�������,��ӵ����������
            nondistance = sort(vdistance,2,'descend');
            % �õ�parent����Ҫ�ĸ�������
            FF = nondistance(2,1:number);
            % ��F1��Ŷ�Ӧӵ���������ĸ�����뵽parent��
            parent = [parent;x(FF,:)];
        end
        irank = irank + 1;
    end