clc
%define all variables/constants

N=100; %number of cells
sigma_a = 0.5; 
S = 6*ones(N,1);
D = 1/3;
R = 1000; %right boundary value
L = 0; %left boundary value
slab_length = R-L;
delta_x = slab_length/N;
x = linspace(0+delta_x/2,slab_length-delta_x/2,N); %needed to shift by delta_x/2 because 1 and 0 are edges, not node centers

%create a sparse 100x100 matrix
cm = sparse(N,N);

%interior nodes
for i = 2:N-1
              
    cm(i,i-1) = ((-D)./(delta_x.^2));
    cm(i,i) = ((D./(delta_x.^2))+(D./(delta_x.^2))+sigma_a);
    cm(i,i+1) = ((-D)./(delta_x.^2));  
    
end

%FLUX = 0 AT BOTH BOUNDS

%Left Bound
i = 1;
cm(i,i) = (D./(delta_x.^2))+(2*D./(delta_x.^2))+sigma_a;
cm(i,i+1)= (-D./delta_x.^2);

%Right Bound
i = N;
cm(i,i) = (D./(delta_x.^2))+(2*D./(delta_x.^2))+sigma_a;
cm(i,i-1) = (-D./delta_x.^2);


phi = cm\S;
plot(phi)
hold on




