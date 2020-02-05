%计算种群个体的适应度，即指定点的光强
function [fitness_value] = fitness(Tm)

global R;
global C;
global pop_size;
global population;

%所有种群个体适应度初始化为0
fitness_value = zeros(1,pop_size);

%计算指定点的光强
for k = 1:pop_size
    temp = Tm(R*C/2+sqrt(R*C)/2,:)*reshape(population(:,:,k),R*C,1);
    fitness_value(k) = real(temp)^2+imag(temp)^2;
end

clear temp;
clear k;