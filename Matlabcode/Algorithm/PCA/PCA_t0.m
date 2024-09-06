% 程序3-3:PCA MATLAB 实现程序

%% 数据导人及处理
clc
clear all
A=[40.4 24.7 7.2 6.1 8.3 8.7 2.442 20   
25 12.7 11.2 11 12.9 20.2 3.542 9.1   
13.2 3.3 3.9 4.3 4.4 5.5 0.578 3.6   
22.3 6.7 5.6 3.7 6 7.4 0.176 7.3   
34.3 11.8 7.1 7.1 8 8.9 1.726 27.5   
35.6 12.5 16.4 16.7 22.8 29.3 3.017 26.6   
22 7.8 9.9 10.2 12.6 17.6 0.847 10.6   
48.4 13.4 10.9 10.9 10.9 13.9 1.772 17.8   
40.6 19.1 19.8 19 29.7 39.6 2.449 35.8   
24.8 8 9.8 8.9 11.9 16.2 0.789 13.7   
12.5 9.7 4.2 4.2 4.6 6.5 0.874 3.9   
1.8 0.6 0.7 0.7 0.8 1.1 0.056 1   
32.3 13.9 9.4 8.3 9.8 13.3 2.126 17.1   
38.5 9.1 11.3 9.5 12.2 16.4 1.327 11.6   
26.2 10.1 5.6 15.6 7.7 30.1 0.126 25.9];

%数据标准化处理
a=size(A,1);
b=size(A,2);
SA=zeros(a,b);
for i=1:b
 SA(:,i)=(A(:,i)-mean(A(:,i)))/std(A(:,i));
end

% 计算相关系数矩阵的特征值和特征向量
CM=corrcoef(SA); %计算相关系数矩阵(correlation natrix)
[V,D]=eig(CM); % 计算特征值和特征向量
for j=1:b
DS(j,1)=D(b+1-j,b+1-j);% 对特征值按降序进行排序
end
for i=1:b
    DS(i,2)=DS(i,1)/sum(DS(:,1));%贡献率
    DS(i,3)=sum(DS(1:i,1))/sum(DS(:,1));%累积贡献率
end
%% 选择主成分及对应的特征向量
T=0.9;% 主成分信息保留率
for K= 1:b
    if DS(K,3)>=T
        Com_num = K;
    break;
    end
end
% 提取主成分对应的特征向量
for j = 1:Com_num
    PV(:,j)=V(:,b+1-j);
end
%% 计算各评价对象的主成分得分
new_score = SA * PV;
for i=1:a
total_score(i,1)=sum(new_score(i,:));
total_score(i,2) =i;
end
result_report=[new_score, total_score];% 将各主成分得分与总分放在同一个矩阵中
result_report=sortrows(result_report,-4);% 按总分降序排序
%% 输出模型及结果报告
disp('特征值及其贡献率、累计贡献率')
DS
disp('信息保留率T对应的主成分数与特征向量:')
Com_num
PV

disp('主成分得分及排序(按第4列的总分进行降序排序,前3列为各主成分得分,第5列为企业编号');
result_report