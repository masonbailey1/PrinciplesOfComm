%% Homework 3
%Mason Bailey
%Problems 11.3, 11.4, 12.1, 12.2, 12.3, 13.1, 13.2

%% Problem 11.3
%%
% eyediag.m plot eye diagrams for pulse shape ps

figure(2)                      % used to plot figure eyediag3
N=1000; m=pam(N,2,1);          % random +/-1 signal of length N
M=20; mup=zeros(1,N*M); mup(1:M:N*M)=m;  % oversampling by factor of M
ps=ones(1,M);                            % square pulse width M
x=filter(ps,1,mup);            % convolve pulse shape with mup
neye=5;
c=floor(length(x)/(neye*M))
xp=x(N*M-neye*M*c+1:N*M);      % dont plot transients at start
q=reshape(xp,neye*M,c);        % plot in clusters of size 5*Mt=(1:198)/50+1;
subplot(3,1,1), plot(q)
title('Eye diagram for rectangular pulse shape')

N=1000; m=pam(N,2,1);          % random +/-1 signal of length N
M=20; mup=zeros(1,N*M); mup(1:M:N*M)=m;  % oversampling by factor of M
ps=hamming(M);                           % square pulse width M
x=filter(ps,1,mup);            % convolve pulse shape with mup
%x=x+0.15*randn(size(x));
neye=5;
c=floor(length(x)/(neye*M))
xp=x(N*M-neye*M*c+1:N*M);      % dont plot transients at start
q=reshape(xp,neye*M,c);        % plot in clusters of size 5*Mt=(1:198)/50+1;
subplot(3,1,2), plot(q)
title('Eye diagram for hamming pulse shape')

N=1000; m=pam(N,2,1);          % random +/-1 signal of length N
M=20; mup=zeros(1,N*M); mup(1:M:N*M)=m;  % oversampling by factor of M
L=10; ps=srrc(L,0,M,50);
ps=ps/max(ps);         % sinc pulse shape L symbols wide
x=filter(ps,1,mup);    % convolve pulse shape with mup
%x=x+0.15*randn(size(x));
neye=5;
c=floor(length(x)/(neye*M))
xp=x(N*M-neye*M*(c-3)+1:N*M);  % dont plot transients at start
q=reshape(xp,neye*M,c-3);      % plot in clusters of size 5*Mt=(1:198)/50+1;
subplot(3,1,3), plot(q)
axis([0,100,-3,3])
title('Eye diagram for sinc pulse shape')

L=10; ps=srrc(L,0,M,0);                 % sinc pulse shape L symbols wide
ps=ones(1,M);                           % square pulse width M

%% Problem 11.4
%%
%yup