%ѡ��һ������
function [parent] = selection(population, fitness_value)

global pop_size;

totalfit=sum(fitness_value);                                             %����Ӧֵ֮��
fitness_value1=fitness_value/totalfit;                               %�������屻ѡ��ĸ���
fitness_value2=cumsum(fitness_value1); 

temp = rand(1);
for k = 1:pop_size
    if fitness_value2(k) >= temp                                        % && temp>fitness_value2(k-1)
        parent = population(:,:,k);
        break;
    end
end

clear i;
clear temp;
clear k;