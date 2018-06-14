clc
clear

%define all variables/constants

N=100;
sigma_a = 0.5;
S = 6*ones(N,1);
D = 1/3;
x = linspace(0,5,100);

%create a sparse 100x100 matrix

cm = sparse(N,N);

%interior nodes

for i = 2:N-1
    
    delta_x = 5;  % unsure on this, my instinct says it should be the delta 
                  % x, or difference between nodes, which is 0.0505, but 
                  % that does not give the correct answer
                  
    cm(i,i-1) = ((-D)./(delta_x.^2));
    cm(i,i) = ((D./(delta_x.^2))+(D./(delta_x.^2))+sigma_a);
    cm(i,i+1) = ((-D)./(delta_x.^2));  
    
end

%Left Bound
i = 1;
cm(i,i) = ((D./(delta_x.^2))+sigma_a);


%Right Bound
i = N;
cm(i,i) = ((D./(delta_x.^2))+sigma_a);



phi = cm\S
plot(x,phi)
ylim([0,20])
xlim([-1,6])


