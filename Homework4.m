%% Homework 4/Final Project
%Mason Bailey
%Problems 14.2, 14.13, 14.14, 14.16

%% Problem 14.2
%%
% Part a
N = 6;
xi = [-5, -3, -1, 1, 3, 5];
pxi = [(1/6), (1/6), (1/6), (1/6), (1/6), (1/6)];
oneVec = [1, 1, 1, 1, 1, 1];
Ixi = log2(oneVec ./ pxi);
% Ixi = 2.5850 for each xi

% Part b
pxn5 = 1 - (2/4) - (2/8) - (1/4);
% Probability of -5 is zero
pxi = [(0), (1/8), (1/4), (1/4), (1/8), (1/4)];
Ixi = log2(oneVec ./ pxi);
% Ixi = [Inf,3,2,2,3,2]

%% Problem 14.13
%%
% noisychan.m generate 2-level data and add noise
m=1000;                          % length of data sequence
p=1/15; s=1.0;                   % power of noise and signal
x=pam(m,2,s);                    % 4-PAM input with power 1...
L=sqrt(1/5);                     % ...with amp levels L
n=sqrt(p)*randn(1,m);            % noise with power p
y=x+n;                           % output adds noise to data
qy=quantalph(y,[-3*L,-L,L,3*L]); % quantize to [-3*L,-L,L,3*L]
err=sum(abs(sign(qy'-x)))/m;     % percent transmission errors
plotspec(n, err);

% noisychan.m generate 4-level data and add noise
m=1000;                          % length of data sequence
p=1/15; s=1.0;                   % power of noise and signal
x=pam(m,4,s);                    % 4-PAM input with power 1...
L=sqrt(1/5);                     % ...with amp levels L
n=sqrt(p)*randn(1,m);            % noise with power p
y=x+n;                           % output adds noise to data
qy=quantalph(y,[-3*L,-L,L,3*L]); % quantize to [-3*L,-L,L,3*L]
err=sum(abs(sign(qy'-x)))/m;     % percent transmission errors
plotspec(n, err);

% noisychan.m generate 6-level data and add noise
m=1000;                          % length of data sequence
p=1/15; s=1.0;                   % power of noise and signal
x=pam(m,6,s);                    % 4-PAM input with power 1...
L=sqrt(1/5);                     % ...with amp levels L
n=sqrt(p)*randn(1,m);            % noise with power p
y=x+n;                           % output adds noise to data
qy=quantalph(y,[-3*L,-L,L,3*L]); % quantize to [-3*L,-L,L,3*L]
err=sum(abs(sign(qy'-x)))/m;     % percent transmission errors
plotspec(n, err);

%% Problem 14.14
%%
m=1000;                          % length of data sequence
p=0.01; s=1.0;                   % power of noise and signal
x=pam(m,4,s);                    % 4-PAM input with power 1...
L=sqrt(1/5);                     % ...with amp levels L
n=sqrt(p)*randn(1,m);            % noise with power p
y=x+n;                           % output adds noise to data
qy=quantalph(y,[-3*L,-L,L,3*L]); % quantize to [-3*L,-L,L,3*L]
err=sum(abs(sign(qy'-x)))/m;     % percent transmission errors
plotspec(n, err);
% Error probability = 0
% S(2-level) = 0.2
% S(6-level) = 7/3

%% Problem 14.16
%%
% Part a
H = (0.5 * log2(4)) * 2;
% H = 2 for this source

% Part b
xi = [5, 3, 2, 1, 4];
pxi = [(1/2), (1/4), (1/8), (1/16), (1/16)];
xi = [5, 3, 2, 14];
pxi = [(1/2), (1/4), (1/8), (1/8)];
xi = [5, 3, 124];
pxi = [(1/2), (1/4), (1/4)];
xi = [5, 1234];
pxi = [(1/2), (1/2)];
xi = [12345];
pxi = [(1/1)];

% Part c
% Starting with x5 since it has the highest probability, the first bit is a
% 1, so x5 is just 1. Then x3 has the second highest probability, so x3 is
% 01. Next is x2, which is 001, followed by x1, which is 0001. Finally, if
% all four branches are 0, that leaves x4 with the lowest probability being
% 0000.

% Part d
avgBitsPerSymbol = (4 + 3 + 2 + 4 + 1) / 5; % = 2.8
effic = H / avgBitsPerSymbol; % 2 / 2.8 = 0.714

% Part e
avgBitsPerSymbol = 3;
effic = H / avgBitsPerSymbol; % 2 / 3 = 0.667
