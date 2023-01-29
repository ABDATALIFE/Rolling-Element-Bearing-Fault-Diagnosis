Matlab Code

%% Loading the Vibration Dataset
load 'H-A-1.mat';
%% Data acquisition for Time Domain Analysis
sample_rate = 200000;
t = (0:length(Channel_1)-1)/sample_rate;
figure
plot(t,Channel_1)
xlabel('Time, (s)')
ylabel('Acceleration (g)')
%title('Vibration Analysis: Healthy Bearing , Increasing Speed')
% xlim([0 0.1])
%% Data Acquisition for Power Spectrum
[Amplitude, Frequency] = pspectrum(Channel_1, sample_rate);
Amplitude = 10*log10(Amplitude);
figure
plot(Frequency,Amplitude)
xlabel('Frequency (Hz)')
ylabel('Power Spectrum (dB)')
%title('Healthy Bearing: Power Spectrum')
%legend('Power Spectrum')
    figure
    subplot(2, 1, 1)
    plot(t, Channel_1)
    xlim([0.014 0.02])
    %title('Healthy Bearing ')
    ylabel('Acceleration (g)')
    subplot(2, 1, 2)
    [pEnv, fEnv, Amplitude_Env, t_Env] = envspectrum(Channel_1,sample_rate);
    plot(t_Env,Amplitude_Env)
    xlim([0.14 0.2])
    xlabel('Time (s)')
    ylabel('Acceleration (g)')
    title('Envelope signal')
   
    %% Envelope Signal Zoomed-in
    figure
    plot(fEnv,pEnv)
    xlabel('Frequency (Hz)')
    ylabel('Peak Amplitude')
    title('Envelope Spectrum')
    xlim([0 30000])
    
    %% Kurtosis Analysis
    kurtOuter = kurtosis(Channel_1);   %% Calculating the Kurtosis Number
    plot(t,Channel_1);                  %% Plotting the kurtosis graph
    xlabel('Time (s)');
    ylabel('Acceleration (g)');
    title(['Outer Race Fault , Kurtosis =' num2str(kurtOuter) ])
    level = 9
    figure 
    kurtogram(Channel_1,sample_rate,level)
    figure
    wc = 4;
    pkurtosis(Channel_1)
