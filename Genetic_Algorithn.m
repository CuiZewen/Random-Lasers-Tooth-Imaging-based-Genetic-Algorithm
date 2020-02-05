%主函数
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

%种群初始化
population = zeros(R,C,pop_size);
for m = 1:pop_size
    population(:,:,m)= round(rand(R,C));
end

%定义传输矩阵
% mu = [0,0];                                            %数学期望
% sigma = [1,0;0,1];                                  %协方差矩阵
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

%求适应度
fitness_value = fitness(Tm);

%按适应度对个体从大到小排序
rank();

result = zeros(1,generation);
%产生n代
for n = 1:generation
    %产生G个后代
    offspring_total = zeros(R,C,G); 
    for i = 1:G
        %从个体中选择两个个体作为父代
        pa = selection(population, fitness_value);
        ma = selection(population, fitness_value);
        %产生后代
        offspring = crossover(pa,ma);
        %变异
        offspring_new = mutation(offspring,n);
        offspring_total(:,:,i) = offspring_new;
    end
    
    %将种群的fitness_value后G个个体由新产生的G个后代代替
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