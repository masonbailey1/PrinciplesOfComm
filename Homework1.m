%% Homework 1
%Mason Bailey
%Problems 7.5-7.9, 7.10-7.13, 7.15

%% Problem 7.5a
%%
f =100; Ts=1/1000; time=10.0;
t=Ts:Ts:time ;
w=sin(2*pi*f*t);
N=2^10;
ssf=(-N/2:N/2-1)/(Ts*N);
fw=fft(w(1:N));
fws=fftshift(fw);
plot(ssf ,abs(fws))
% The peaks will be at f distance from the origin as long as f is less than
% (1/2Ts)

%% Problem 7.5b
%%

f =100; Ts=1/50; time=150.0;
t=Ts:Ts:time ;
w=sin(2*pi*f*t);
N=2^10;
ssf=(-N/2:N/2-1)/(Ts*N);
fw=fft(w(1:N));
fws=fftshift(fw);
plot(ssf ,abs(fws))
% If (1/2Ts) is less than or equal to f, then the waveform will not produce
% properly

%% Problem 7.5c
%%
f =100; Ts=1/1000; time=50.0;
t=Ts:Ts:time ;
w=sin(2*pi*f*t);
N=2^8;
ssf=(-N/2:N/2-1)/(Ts*N);
fw=fft(w(1:N));
fws=fftshift(fw);
plot(ssf ,abs(fws))
% As N decreases, the width (and height) of the peaks decrease as well

%% Problem 7.6
%%
f =100; Ts=1/1000; time=10.0;
t=Ts:Ts:time ;
w=sin(2*pi*f*t).^10;
N=2^10;
ssf=(-N/2:N/2-1)/(Ts*N);
fw=fft(w(1:N));
fws=fftshift(fw);
plot(ssf ,abs(fws))
% The spectrum of sin^2 is 0 to 512.5, and the spectrum of sin^3 is 0
% to 291. This means the largest k for sin^k would be the power that 2 is
% at for N

%% Problem 7.7
%%
f =100; Ts=1/1000; time=10.0;
t=Ts:Ts:time ;
w=sinc(2*pi*f*t).^2;
N=2^10;
ssf=(-N/2:N/2-1)/(Ts*N);
fw=fft(w(1:N));
fws=fftshift(fw);
plot(ssf ,abs(fws))
% The spectrum of sinc is 0 to 1.926 and the spectrum of sinc^2 is 0 to
% 0.2926

%% Problem 7.8
%%
f =100; Ts=1/1000; time=10.0;
t=Ts:Ts:time ;
w=sin(t)+j*e^-t;
N=2^10;
ssf=(-N/2:N/2-1)/(Ts*N);
fw=fft(w(1:N));
fws=fftshift(fw);
plot(ssf ,abs(fws))
% (Come back to)

%% Problem 7.9a
%%
% The phase values are 0, 11.46, 22.92, 45.84, 85.94, and 179.91
% respectively

%% Problem 7.9b
%%
% The phase values are 0, 11.46, 22.92, 45.84, 85.94, and 179.91
% respectively

%% Problem 7.10
%%
filename='C:\Users\mqbai\Documents\MATLAB\PrinciplesOfCommunication\gong.wav';                    % name of wave file
[x,sr]= audioread(filename);            % read in wavefile
Ts=1/sr ;                               % sample interval & # of samples
N=2^15; x=x(1:N)';                      % length for analysis
sound(x,1/Ts)                           % play sound (if possible)
time=Ts*(0:length(x)-1);                % time base for plotting
subplot(2,1,1), plot(time,x)            % and plot top figure
magx=abs(fft(x));                       % take FFT magnitude
ssf =(0:N/2-1)/(Ts*N);                  % freq base for plotting
subplot(2,1,2), plot(ssf, magx(1:N/2))  % plot mag spectrum
% Come back to problem

%% Problem 7.15
%%
%