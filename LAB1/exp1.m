%1)What is sampling
    %Sampling converting Continious Time signal to Digital Signal

%2)Write a periodic rectangular signal with 3 period
    T = 1;
    Fs = 1e3;
    t = 0:1/Fs:3*T;
    f = 1/T;
    w = 2*pi*f;
    plot(t,square(w.*t));
    axis([0 3*T -1.5 1.5]);
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    title('Periodic Rectangular Signal with 3 Periods');
%3)Write the given Matlab code and generate the periodic sinusoid
    close all,
    clc
    %Fs = 100
    %k = 0:1/Fs:3;
    k = 0:300;
    %k =  0:600;
    x = sin(2*pi*k/100);
    plot(k/100,x);
    grid on;
    title('3 period sine wave');
    xlabel('Seconds');
    ylabel('Amplitude')
 %4)Now try this code and comment on the result. What changed and what happened?
    k = 0:15:300;
    x = sin(2*pi*k/100);
    figure, plot(k/100,x);
    grid on;
    title('3 period sine wave');
    xlabel('Seconds');
    ylabel('Amplitude')
 %5) Write the given code and generate the desiredsignal (a damping sinusoid).
    clear all
    clc
    close all
    Fs = 1e3;
    t = 0:1/Fs:1.023;
    T = 0.001;
    k = 201:1024;
    z = zeros(1,200);
    x = [z exp(-3*(k*T-0.2)) .* sin(12*pi*(k*T-0.2))];
    plot(t,x);
    grid on;
    title('damping sinusoidal signal')
    xlabel('Time (s)')
    ylabel('Amplitude')
 %6)Periodic signal with 3 period and add noise
    clear all
    clc
    close all
    Fs = 1e3;
    f = 1e1;
    T = 1/f;
    t = 0:1/Fs:3*T;
    w = 2*pi*f;
    y1 = sin(w*t);
    y2 = cos(10*w*t);
    %y2 = 1;
    y = y1+y2;
    plot(t,y);






    
