%mutation  
function [offspring_new] = mutation(offspring,n)

global R;
global C;

R0 = 0.1;                        %initial mutation rate
factor = 650.0;                 %decay factor
%Rend = 0.0025;                %final mutation rate
Rend = 0.0025;  

offspring_new = offspring;

RR = (R0-Rend) * exp(-n/factor) + Rend;
for j = 1:R*C*RR
    k = randi(R*C,1);
    offspring_new(k) = mod(offspring(k) + 1, 2);
end

clear RR;
clear j;
clear k;
