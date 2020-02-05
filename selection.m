%选出一个个体
function [parent] = selection(population, fitness_value)

global pop_size;

totalfit=sum(fitness_value);                                             %求适应值之和
fitness_value1=fitness_value/totalfit;                               %单个个体被选择的概率
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