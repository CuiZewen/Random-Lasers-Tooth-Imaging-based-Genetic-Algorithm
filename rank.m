%rank 
%ð�����򷨣��Ӵ�С
function rank()

global population;
global fitness_value;

global pop_size;
for i =1:pop_size
    max_index = i;
    for j = i+1:pop_size
        if fitness_value(j) > fitness_value(max_index);
            max_index = j;
        end
    end
    
    if max_index ~= i                        %����fitness_value(i)��fitness_value(min_index)��ֵ
        temp = fitness_value(i);
        fitness_value(i) = fitness_value(max_index);
        fitness_value(max_index) = temp;
        
        temp_indv = population(:,:,i);
        population(:,:,i) = population(:,:,max_index);
        population(:,:,max_index) = temp_indv;
    end
end

clear i;
clear j;
clear max_index;
clear temp;
clear temp_indv;
        