%% Homework 2
%Mason Bailey
%Problems 9.1-9.5

%% Problem 9.1
%%
%idsys.m:  idealized transmission system

%TRANSMITTER
% encode text string as T-spaced 4-PAM sequence
str='01234 I wish I were an Oscar Meyer wiener 56789';
m=letters2pam(str); N=length(m); % 4-level signal of length N
% zero pad T-spaced symbol sequence to create upsampled
% T/M-spaced sequence of scaled T-spaced pulses (T=1)
M=100;                        % oversampling factor
mup=zeros(1,N*M);             % Hamming pulse filter with 
mup(1:M:N*M)=m;               % T/M-spaced impulse response
p=hamming(M);                 % blip pulse of width M
x=filter(p,1,mup);            % convolve pulse shape with data
figure(1), plotspec(x,1/M)    % baseband AM modulation
t=1/M:1/M:length(x)/M;        % T/M-spaced time vector
%fc=20;                        % carrier frequency
%fc=50;
%fc=30;
%fc=3;
%fc=1;
fc=0.5;
c=cos(2*pi*fc*t);             % carrier
r=c.*x;                       % modulate message with carrier

%RECEIVER
% am demodulation of received signal sequence r
c2=cos(2*pi*fc*t);             % synchronized cosine for mixing
x2=r.*c2;                      % demod received signal
fl=50; fbe=[0 0.1 0.2 1];      % LPF parameters 
damps=[1 1 0 0 ]; 
b=firpm(fl,fbe,damps);         % create LPF impulse response
x3=2*filter(b,1,x2);           % LPF and scale signal
% extract upsampled pulses using correlation implemented 
% as a convolving filter; filter with pulse and normalize
y=filter(fliplr(p)/(pow(p)*M),1,x3);
% set delay to first symbol-sample and increment by M
z=y(0.5*fl+M:M:N*M);           % downsample to symbol rate
figure(2), plot([1:length(z)],z,'.') % plot soft decisions
% decision device and symbol matching performance assessment
mprime=quantalph(z,[-3,-1,1,3])'; % quantize alphabet
cvar=(mprime-z)*(mprime-z)'/length(mprime), % cluster variance
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp, % symbol error
% decode decision device output to text string
reconstructed_message=pam2letters(mprime)

% The message did not work once the fc value dropped below 1 (more
% specifically 0.5). Besides that, the only noticeable changes due to fc
% was the scale of the y axis of the constellation diagrams on Figure 2.

%% Problem 9.2
%%
%idsys.m:  idealized transmission system

%TRANSMITTER
% encode text string as T-spaced 4-PAM sequence
str='01234 I wish I were an Oscar Meyer wiener 56789';
m=letters2pam(str); N=length(m); % 4-level signal of length N
% zero pad T-spaced symbol sequence to create upsampled
% T/M-spaced sequence of scaled T-spaced pulses (T=1)
%M=100;                        % oversampling factor
%M=1000;
%M=25;
M=10;
mup=zeros(1,N*M);             % Hamming pulse filter with 
mup(1:M:N*M)=m;               % T/M-spaced impulse response
p=hamming(M);                 % blip pulse of width M
x=filter(p,1,mup);            % convolve pulse shape with data
figure(1), plotspec(x,1/M)    % baseband AM modulation
t=1/M:1/M:length(x)/M;        % T/M-spaced time vector
fc=20;                        % carrier frequency
c=cos(2*pi*fc*t);             % carrier
r=c.*x;                       % modulate message with carrier

%RECEIVER
% am demodulation of received signal sequence r
c2=cos(2*pi*fc*t);             % synchronized cosine for mixing
x2=r.*c2;                      % demod received signal
fl=50; fbe=[0 0.1 0.2 1];      % LPF parameters 
damps=[1 1 0 0 ]; 
b=firpm(fl,fbe,damps);         % create LPF impulse response
x3=2*filter(b,1,x2);           % LPF and scale signal
% extract upsampled pulses using correlation implemented 
% as a convolving filter; filter with pulse and normalize
y=filter(fliplr(p)/(pow(p)*M),1,x3);
% set delay to first symbol-sample and increment by M
z=y(0.5*fl+M:M:N*M);           % downsample to symbol rate
figure(2), plot([1:length(z)],z,'.') % plot soft decisions
% decision device and symbol matching performance assessment
mprime=quantalph(z,[-3,-1,1,3])'; % quantize alphabet
cvar=(mprime-z)*(mprime-z)'/length(mprime), % cluster variance
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp, % symbol error
% decode decision device output to text string
reconstructed_message=pam2letters(mprime)

% As the oversampling factor gets lower, the second graph of Figure 1 is spread
% out over less frequencies. Once M gets too low, more specifically 10, the
% message no longer works and the constellation diagram becomes a random
% jumble of dots as opposed to the normal rows of dots.

%% Problem 9.3
%%
%idsys.m:  idealized transmission system

%TRANSMITTER
% encode text string as T-spaced 4-PAM sequence
str='01234 I wish I were an Oscar Meyer wiener 56789';
m=letters2pam(str); N=length(m); % 4-level signal of length N
% zero pad T-spaced symbol sequence to create upsampled
% T/M-spaced sequence of scaled T-spaced pulses (T=1)
M=100;                        % oversampling factor
mup=zeros(1,N*M);             % Hamming pulse filter with 
mup(1:M:N*M)=m;               % T/M-spaced impulse response
p=hamming(M);                 % blip pulse of width M
x=filter(p,1,mup);            % convolve pulse shape with data
figure(1), plotspec(x,1/M)    % baseband AM modulation
t=1/M:1/M:length(x)/M;        % T/M-spaced time vector
fc=30;                        % carrier frequency
c=cos(2*pi*fc*t);             % carrier
r=c.*x;                       % modulate message with carrier

%RECEIVER
% am demodulation of received signal sequence r
c2=cos(2*pi*fc*t);             % synchronized cosine for mixing
x2=r.*c2;                      % demod received signal
fl=50; fbe=[0 0.1 0.2 1];      % LPF parameters 
damps=[1 1 0 0 ]; 
b=firpm(fl,fbe,damps);         % create LPF impulse response
x3=2*filter(b,1,x2);           % LPF and scale signal
% extract upsampled pulses using correlation implemented 
% as a convolving filter; filter with pulse and normalize
y=filter(fliplr(p)/(pow(p)*M),1,x3);
% set delay to first symbol-sample and increment by M
z=y(0.5*fl+M:M:N*M);           % downsample to symbol rate
figure(2), plot([1:length(z)],z,'.') % plot soft decisions
% decision device and symbol matching performance assessment
mprime=quantalph(z,[-3,-1,1,3])'; % quantize alphabet
cvar=(mprime-z)*(mprime-z)'/length(mprime), % cluster variance
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp, % symbol error
% decode decision device output to text string
reconstructed_message=pam2letters(mprime)

% Nothing appeared to change after removing the LPF.

%% Problem 9.4
%%
%idsys.m:  idealized transmission system

%TRANSMITTER
% encode text string as T-spaced 4-PAM sequence
str='01234 I wish I were an Oscar Meyer wiener 56789';
m=letters2pam(str); N=length(m); % 4-level signal of length N
% zero pad T-spaced symbol sequence to create upsampled
% T/M-spaced sequence of scaled T-spaced pulses (T=1)
M=100;                        % oversampling factor
mup=zeros(1,N*M);             % Hamming pulse filter with 
mup(1:M:N*M)=m;               % T/M-spaced impulse response
p=hamming(M);                 % blip pulse of width M
x=filter(p,1,mup);            % convolve pulse shape with data
figure(1), plotspec(x,1/M)    % baseband AM modulation
t=1/M:1/M:length(x)/M;        % T/M-spaced time vector
fc=20;                        % carrier frequency
c=cos(2*pi*fc*t);             % carrier
r=c.*x;                       % modulate message with carrier

%RECEIVER
% am demodulation of received signal sequence r
c2=cos(2*pi*fc*t);             % synchronized cosine for mixing
x2=r.*c2;                      % demod received signal
%fl=50;
%fl=4;
fl=399;
fbe=[0 0.1 0.2 1];      % LPF parameters 
damps=[1 1 0 0 ]; 
b=firpm(fl,fbe,damps);         % create LPF impulse response
x3=2*filter(b,1,x2);           % LPF and scale signal
% extract upsampled pulses using correlation implemented 
% as a convolving filter; filter with pulse and normalize
y=filter(fliplr(p)/(pow(p)*M),1,x3);
% set delay to first symbol-sample and increment by M
z=y(0.5*fl+M:M:N*M);           % downsample to symbol rate
figure(2), plot([1:length(z)],z,'.') % plot soft decisions
% decision device and symbol matching performance assessment
mprime=quantalph(z,[-3,-1,1,3])'; % quantize alphabet
cvar=(mprime-z)*(mprime-z)'/length(mprime), % cluster variance
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp, % symbol error
% decode decision device output to text string
reconstructed_message=pam2letters(mprime)

% 4 is the lowest cutoff frequency that works. The highest cutoff frequency
% that works is 399

%% Problem 9.5
%%
%idsys.m:  idealized transmission system

%TRANSMITTER
% encode text string as T-spaced 4-PAM sequence
str='01234 I wish I were an Oscar Meyer wiener 56789';
m=letters2pam(str); N=length(m); % 4-level signal of length N
% zero pad T-spaced symbol sequence to create upsampled
% T/M-spaced sequence of scaled T-spaced pulses (T=1)
M=100;                        % oversampling factor
mup=zeros(1,N*M);             % Hamming pulse filter with 
mup(1:M:N*M)=m;               % T/M-spaced impulse response
p=hamming(M);                 % blip pulse of width M
x=filter(p,1,mup);            % convolve pulse shape with data
figure(1), plotspec(x,1/M)    % baseband AM modulation
t=1/M:1/M:length(x)/M;        % T/M-spaced time vector
fc=20;                        % carrier frequency
c=cos(2*pi*fc*t);             % carrier
r=c.*x;                       % modulate message with carrier

%RECEIVER
% am demodulation of received signal sequence r
c2=cos(2*pi*fc*t);             % synchronized cosine for mixing
x2=r.*c2;                      % demod received signal
fl=50; fbe=[0 0.1 0.2 1];      % LPF parameters 
damps=[1 1 0 0 ]; 
b=firpm(fl,fbe,damps);         % create LPF impulse response
%x3=2*filter(b,1,x2);           % LPF and scale signal
x3=1.34*filter(b,1,x2);
% extract upsampled pulses using correlation implemented 
% as a convolving filter; filter with pulse and normalize
y=filter(fliplr(p)/(pow(p)*M),1,x3);
% set delay to first symbol-sample and increment by M
z=y(0.5*fl+M:M:N*M);           % downsample to symbol rate
figure(2), plot([1:length(z)],z,'.') % plot soft decisions
% decision device and symbol matching performance assessment
mprime=quantalph(z,[-3,-1,1,3])'; % quantize alphabet
cvar=(mprime-z)*(mprime-z)'/length(mprime), % cluster variance
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp, % symbol error
% decode decision device output to text string
reconstructed_message=pam2letters(mprime)

% Using the LPF and scale signal line, the caling for the LPF can be
% reduced to 1.34 (instead of 2) and still work, which means the LPF could
% be 0.67 of the normal size and still work.

%% 4-PAM to QPSK
%%
%idsys.m:  idealized transmission system

%TRANSMITTER
% encode text string as T-spaced 4-PAM sequence
str='01234 I wish I were an Oscar Meyer wiener 56789';
m=letters2pam(str); N=length(m); % 4-level signal of length N
% zero pad T-spaced symbol sequence to create upsampled
% T/M-spaced sequence of scaled T-spaced pulses (T=1)
M=100;                        % oversampling factor
mup=zeros(1,N*M);             % Hamming pulse filter with 
mup(1:M:N*M)=m;               % T/M-spaced impulse response
p=hamming(M);                 % blip pulse of width M
x=filter(p,1,mup);            % convolve pulse shape with data
figure(1), plotspec(x,1/M)    % baseband AM modulation
t=1/M:1/M:length(x)/M;        % T/M-spaced time vector
fc=20;                        % carrier frequency
c=cos(2*pi*fc*t);             % carrier
r=c.*x;                       % modulate message with carrier

%RECEIVER
% am demodulation of received signal sequence r
c2=cos(2*pi*fc*t);             % synchronized cosine for mixing
x2=r.*c2;                      % demod received signal
fl=50; fbe=[0 0.1 0.2 1];      % LPF parameters 
damps=[1 1 0 0 ]; 
b=firpm(fl,fbe,damps);         % create LPF impulse response
x3=2*filter(b,1,x2);           % LPF and scale signal
% extract upsampled pulses using correlation implemented 
% as a convolving filter; filter with pulse and normalize
y=filter(fliplr(p)/(pow(p)*M),1,x3);
% set delay to first symbol-sample and increment by M
z=y(0.5*fl+M:M:N*M);           % downsample to symbol rate
figure(2), plot([1:length(z)],z,'.') % plot soft decisions
% decision device and symbol matching performance assessment
mprime=quantalph(z,[-3,-1,1,3])'; % quantize alphabet
cvar=(mprime-z)*(mprime-z)'/length(mprime), % cluster variance
lmp=length(mprime);
pererr=100*sum(abs(sign(mprime-m(1:lmp))))/lmp, % symbol error
% decode decision device output to text string
reconstructed_message=pam2letters(mprime)

%
