%crossover
function [offspring] = crossover(pa,ma)

global R;
global C;

T = round(rand(R,C));                     %%generate T
offspring = ma.*T + pa.*(1-T);         %%generate offspring

clear T;
