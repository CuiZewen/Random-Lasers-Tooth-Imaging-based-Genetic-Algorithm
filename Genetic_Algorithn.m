%������
clc;
close all;

global R;
global C;
R = 16;
C = 16;
global pop_size;
pop_size= 100;
G = 0.5*pop_size;
generation = 2000;

global population;
global fitness_value;
% global offspring;

%��Ⱥ��ʼ��
population = zeros(R,C,pop_size);
for m = 1:pop_size
    population(:,:,m)= round(rand(R,C));
end

%���崫�����
% mu = [0,0];                                            %��ѧ����
% sigma = [1,0;0,1];                                  %Э�������
% r = mvnrnd(mu,sigma,R*C);
% A=zeros(R*C,1);
% for j = 1:R*C
%     A(j,1) = r(j,1)+1i*r(j,2);
% end
% T = reshape(A,R,C)';
% 
% % [x y] = meshgrid(linspace(-R,C,R)',linspace(-R,C,R)');
% % X = [x(:) y(:)];
% % z = mvnpdf(X,mu,sigma);
% %T = reshape(z,R,C);
% [U,S,V] = svd(T);
% Tm = T/S(1,1);

Nm = R*C;
Re = randn(Nm,Nm);
Im = randn(Nm,Nm);
T = Re + 1i*Im;
[U,S,V] = svd(T);
Tm = T/S(1,1);

%����Ӧ��
fitness_value = fitness(Tm);

%����Ӧ�ȶԸ���Ӵ�С����
rank();

result = zeros(1,generation);
%����n��
for n = 1:generation
    %����G�����
    offspring_total = zeros(R,C,G); 
    for i = 1:G
        %�Ӹ�����ѡ������������Ϊ����
        pa = selection(population, fitness_value);
        ma = selection(population, fitness_value);
        %�������
        offspring = crossover(pa,ma);
        %����
        offspring_new = mutation(offspring,n);
        offspring_total(:,:,i) = offspring_new;
    end
    
    %����Ⱥ��fitness_value��G���������²�����G���������
    for j = 1:pop_size
        if j <= G
            population(:,:,j) = population(:,:,j);
        else
            population(:,:,j) = offspring_total(:,:,j-G);
        end
    end
    fitness_value = fitness(Tm);
    rank();
     result(n) = fitness_value(1);
end

output =  zeros(R,C);
E1 = Tm*reshape(population(:,:,1),R*C,1);
E2 = reshape(E1,R,C);
for i = 1:R*C
    output(i) = real(E2(i))^2+imag(E2(i))^2;
end

figure(1);
imagesc(output)
set(gca,'YDir','normal')
colorbar;
figure(2);
imagesc(output)
set(gca,'YDir','normal')
 colormap(gray)
 colorbar;
 figure(3);
 n = 1:generation;
 plot(n,result)