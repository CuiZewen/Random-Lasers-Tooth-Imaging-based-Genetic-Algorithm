%������Ⱥ�������Ӧ�ȣ���ָ����Ĺ�ǿ
function [fitness_value] = fitness(Tm)

global R;
global C;
global pop_size;
global population;

%������Ⱥ������Ӧ�ȳ�ʼ��Ϊ0
fitness_value = zeros(1,pop_size);

%����ָ����Ĺ�ǿ
for k = 1:pop_size
    temp = Tm(R*C/2+sqrt(R*C)/2,:)*reshape(population(:,:,k),R*C,1);
    fitness_value(k) = real(temp)^2+imag(temp)^2;
end

clear temp;
clear k;