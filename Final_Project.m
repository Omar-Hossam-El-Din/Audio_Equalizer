close all; clc; clear variables;
fprintf('*****************WELCOME TO AUDIO EQUALIZER*****************\n');
fprintf('-----------------------------------\n');
filename=input('Enter the wave file name: ','s');
[y,Fs]=audioread(filename);
fprintf('-----------------------------------\n');
type=input('Enter the type of filters used (IIR-FIR): ','s');
fprintf('-----------------------------------\n');
fouts=input('Enter the output sample rate: ');
fprintf('-----------------------------------\n');
G1=input('Enter the gain for filter (1) in dB: ');
G2=input('Enter the gain for filter (2) in dB: ');
G3=input('Enter the gain for filter (3) in dB: ');
G4=input('Enter the gain for filter (4) in dB: ');
G5=input('Enter the gain for filter (5) in dB: ');
G6=input('Enter the gain for filter (6) in dB: ');
G7=input('Enter the gain for filter (7) in dB: ');
G8=input('Enter the gain for filter (8) in dB: ');
G9=input('Enter the gain for filter (9) in dB: ');
fprintf('-----------------------------------\n');
%Converting the gain from (dB) to ordinary unit in order to be easily multiplied
G1=10^(G1/20);
G2=10^(G2/20);
G3=10^(G3/20);
G4=10^(G4/20);
G5=10^(G5/20);
G6=10^(G6/20);
G7=10^(G7/20);
G8=10^(G8/20);
G9=10^(G9/20);
%In Case the Type of filters used is (IIR)
if (strcmpi(type,'IIR'))==1 
    n=4;    %Order of the used IIR Filters
    %Filter 1 (Low Pass Filter)
    Fc=170; 
    [num1,den1]=butter(n,Fc/(Fs/2)); 
    [Hd1,wd1]=freqz(num1,den1); 
    mag1=abs(Hd1);  
    phase1=angle(Hd1)*180/pi; 
    [z1,p1,k1]=butter(n,Fc/(Fs/2)); 
    sys1=tf(num1,den1);
    %Filter 2 (Band Pass Filter)
    fc=[170,310]/(Fs/2); 
    [num2,den2]=butter(n,fc);  
    [Hd2,wd2]=freqz(num2,den2); 
    mag2=abs(Hd2); 
    phase2=angle(Hd2)*180/pi;  
    [z2,p2,k2]=butter(n,fc); 
    sys2=tf(num2,den2); 
    %Filter 3 (Band Pass Filter)
    fc=[310,600]/(Fs/2); 
    [num3,den3]=butter(n,fc);  
    [Hd3,wd3]=freqz(num3,den3); 
    mag3=abs(Hd3); 
    phase3=angle(Hd3)*180/pi;  
    [z3,p3,k3]=butter(n,fc); 
    sys3=tf(num3,den3); 
    %Filter 4 (Band Pass Filter)
    fc=[600,1000]/(Fs/2);  
    [num4,den4]=butter(n,fc);  
    [Hd4,wd4]=freqz(num4,den4); 
    mag4=abs(Hd4); 
    phase4=angle(Hd4)*180/pi;  
    [z4,p4,k4]=butter(n,fc); 
    sys4=tf(num4,den4); 
    %Filter 5 (Band Pass Filter)
    fc=[1000,3000]/(Fs/2); 
    [num5,den5]=butter(n,fc);  
    [Hd5,wd5]=freqz(num5,den5); 
    mag5=abs(Hd5); 
    phase5=angle(Hd5)*180/pi;  
    [z5,p5,k5]=butter(n,fc); 
    sys5=tf(num5,den5); 
    %Filter 6 (Band Pass Filter)
    fc=[3000,6000]/(Fs/2); 
    [num6,den6]=butter(n,fc);  
    [Hd6,wd6]=freqz(num6,den6); 
    mag6=abs(Hd6); 
    phase6=angle(Hd6)*180/pi;  
    [z6,p6,k6]=butter(n,fc); 
    sys6=tf(num6,den6); 
    %Filter 7 (Band Pass Filter)
    fc=[6000,12000]/(Fs/2);
    [num7,den7]=butter(n,fc);  
    [Hd7,wd7]=freqz(num7,den7); 
    mag7=abs(Hd7); 
    phase7=angle(Hd7)*180/pi;  
    [z7,p7,k7]=butter(n,fc); 
    sys7=tf(num7,den7); 
    %Filter 8 (Band Pass Filter)
    fc=[12000,14000]/(Fs/2);  
    [num8,den8]=butter(n,fc);  
    [Hd8,wd8]=freqz(num8,den8); 
    mag8=abs(Hd8); 
    phase8=angle(Hd8)*180/pi;  
    [z8,p8,k8]=butter(n,fc); 
    sys8=tf(num8,den8); 
    %Filter 9 (Band Pass Filter)
    fc=[14000,16000]/(Fs/2); 
    [num9,den9]=butter(n,fc);  
    [Hd9,wd9]=freqz(num9,den9); 
    mag9=abs(Hd9); 
    phase9=angle(Hd9)*180/pi;  
    [z9,p9,k9]=butter(n,fc); 
    sys9=tf(num9,den9); 
    
    %Plotting Magnitude and Phase of the developed filters (IIR) Type
    figure('Name','Magnitude and Phase of IIR FILTERS');    
    subplot(9,2,1);plot(wd1/pi,mag1,'linewidth',1.25);grid on;title('Filter 1 Magnitude'); 
    subplot(9,2,2);plot(wd1/pi,phase1,'linewidth',1.25);grid on;title('Filter 1 Phase');
    subplot(9,2,3);plot(wd2/pi,mag2,'linewidth',1.25);grid on;title('Filter 2 Magnitude'); 
    subplot(9,2,4);plot(wd2/pi,phase2,'linewidth',1.25);grid on;title('Filter 2 Phase');
    subplot(9,2,5);plot(wd3/pi,mag3,'linewidth',1.25);grid on;title('Filter 3 Magnitude'); 
    subplot(9,2,6);plot(wd3/pi,phase3,'linewidth',1.25);grid on;title('Filter 3 Phase');
    subplot(9,2,7);plot(wd4/pi,mag4,'linewidth',1.25);grid on;title('Filter 4 Magnitude'); 
    subplot(9,2,8);plot(wd4/pi,phase4,'linewidth',1.25);grid on;title('Filter 4 Phase');
    subplot(9,2,9);plot(wd5/pi,mag5,'linewidth',1.25);grid on;title('Filter 5 Magnitude'); 
    subplot(9,2,10);plot(wd5/pi,phase5,'linewidth',1.25);grid on;title('Filter 5 Phase');
    subplot(9,2,11);plot(wd6/pi,mag6,'linewidth',1.25);grid on;title('Filter 6 Magnitude'); 
    subplot(9,2,12);plot(wd6/pi,phase6,'linewidth',1.25);grid on;title('Filter 6 Phase');
    subplot(9,2,13);plot(wd7/pi,mag7,'linewidth',1.25);grid on;title('Filter 7 Magnitude'); 
    subplot(9,2,14);plot(wd7/pi,phase7,'linewidth',1.25);grid on;title('Filter 7 Phase');
    subplot(9,2,15);plot(wd8/pi,mag8,'linewidth',1.25);grid on;title('Filter 8 Magnitude'); 
    subplot(9,2,16);plot(wd8/pi,phase8,'linewidth',1.25);grid on;title('Filter 8 Phase');
    subplot(9,2,17);plot(wd9/pi,mag9,'linewidth',1.25);grid on;title('Filter 9 Magnitude'); 
    subplot(9,2,18);plot(wd9/pi,phase9,'linewidth',1.25);grid on;title('Filter 9 Phase');
    
    %Plotting Impulse Responce and step responce of the developed filters (IIR) Type
    figure('Name','Impulse Responce and Step Responce of IIR FILTERS');    
    subplot(9,2,1);step(sys1);grid on; 
    subplot(9,2,2);impulse(sys1);grid on;
    subplot(9,2,3);step(sys2);grid on;
    subplot(9,2,4);impulse(sys2);grid on;
    subplot(9,2,5);step(sys3);grid on;
    subplot(9,2,6);impulse(sys3);grid on;
    subplot(9,2,7);step(sys4);grid on;
    subplot(9,2,8);impulse(sys4);grid on;
    subplot(9,2,9);step(sys5);grid on;
    subplot(9,2,10);impulse(sys5);grid on;
    subplot(9,2,11);step(sys6);grid on;
    subplot(9,2,12);impulse(sys6);grid on;
    subplot(9,2,13);step(sys7);grid on;
    subplot(9,2,14);impulse(sys7);grid on;
    subplot(9,2,15);step(sys8);grid on;
    subplot(9,2,16);impulse(sys8);grid on;
    subplot(9,2,17);step(sys9);grid on;
    subplot(9,2,18);impulse(sys9);grid on;
%In Case the Type of filters used is (FIR)
else
    den1=1;
    den2=1;
    den3=1;
    den4=1;
    den5=1;
    den6=1;
    den7=1;
    den8=1;
    den9=1;
    n=25;  %Order of the used FIR Filters
    %Filter 1 (Low Pass Filter)
    Fc=170;
    fc=Fc/(Fs/2);
    num1=fir1(n,fc);  %provide filter coefficients
    [H1,w1]=freqz(num1,1,512); %determine the frequency response 
    phase1=angle(H1)*180/pi;  
    [z1,p1,k1]=tf2zpk(num1,1); 
    sys1=tf(num1,ones(1,51)); 
    %Filter 2 (Band Pass Filter)
    Fc=[170,310];
    fc=Fc/(Fs/2);
    num2=fir1(n,fc); %provide filter coefficients
    [H2,w2]=freqz(num2,1,512); %determine the frequency response 
    phase2=angle(H2)*180/pi;  
    [z2,p2,k2]=tf2zpk(num2,1); 
    sys2=tf(num2,ones(1,51)); 
    %Filter 3 (Band Pass Filter)
    Fc=[310,600];
    fc=Fc/(Fs/2);
    num3=fir1(n,fc); %provide filter coefficients
    [H3,w3]=freqz(num3,1,512); %determine the frequency response 
    phase3=angle(H3)*180/pi;  
    [z3,p3,k3]=tf2zpk(num3,1); 
    sys3=tf(num3,ones(1,51)); 
    %Filter 4 (Band Pass Filter)
    Fc=[600,1000];
    fc=Fc/(Fs/2);
    num4=fir1(n,fc); %provide filter coefficients
    [H4,w4]=freqz(num4,1,512); %determine the frequency response 
    phase4=angle(H4)*180/pi;  
    [z4,p4,k4]=tf2zpk(num4,1); 
    sys4=tf(num4,ones(1,51)); 
    %Filter 5 (Band Pass Filter)
    Fc=[1000,3000];
    fc=Fc/(Fs/2);
    num5=fir1(n,fc); %provide filter coefficients
    [H5,w5]=freqz(num5,1,512); %determine the frequency response 
    phase5=angle(H5)*180/pi;  
    [z5,p5,k5]=tf2zpk(num5,1); 
    sys5=tf(num5,ones(1,51)); 
    %Filter 6 (Band Pass Filter)
    Fc=[3000,6000];
    fc=Fc/(Fs/2);
    num6=fir1(n,fc); %provide filter coefficients
    [H6,w6]=freqz(num6,1,512); %determine the frequency response 
    phase6=angle(H6)*180/pi;  
    [z6,p6,k6]=tf2zpk(num6,1); 
    sys6=tf(num6,ones(1,51)); 
    %Filter 7 (Band Pass Filter)
    Fc=[6000,12000];
    fc=Fc/(Fs/2);
    num7=fir1(n,fc); %provide filter coefficients
    [H7,w7]=freqz(num7,1,512); %determine the frequency response 
    phase7=angle(H7)*180/pi;  
    [z7,p7,k7]=tf2zpk(num7,1); 
    sys7=tf(num7,ones(1,51)); 
    %Filter 8 (Band Pass Filter)
    Fc=[12000,14000];
    fc=Fc/(Fs/2);
    num8=fir1(n,fc); %provide filter coefficients
    [H8,w8]=freqz(num8,1,512); %determine the frequency response 
    phase8=angle(H8)*180/pi;  
    [z8,p8,k8]=tf2zpk(num8,1); 
    sys8=tf(num8,ones(1,51)); 
    %Filter 9 (Band Pass Filter)
    Fc=[14000,16000];
    fc=Fc/(Fs/2);
    num9=fir1(n,fc); %provide filter coefficients
    [H9,w9]=freqz(num9,1,512); %determine the frequency response 
    phase9=angle(H9)*180/pi;  
    [z9,p9,k9]=tf2zpk(num9,1); 
    sys9=tf(num9,ones(1,51)); 
    den1=1;den2=1;den3=1;den4=1;den5=1;den6=1;den7=1;den8=1;den9=1;

    %Plotting Magnitude and Phase of the developed filters (FIR) Type
    figure('Name','Magnitude and Phase of FIR FILTERS');    
    subplot(9,2,1);plot(w1/pi,abs(H1),'linewidth',1.25);grid on;title('Filter 1 Magnitude');
    subplot(9,2,2);plot(w1/pi,phase1,'linewidth',1.25);grid on;title('Filter 1 Phase'); 
    subplot(9,2,3);plot(w2/pi,abs(H2),'linewidth',1.25);grid on;title('Filter 2 Magnitude');
    subplot(9,2,4);plot(w2/pi,phase2,'linewidth',1.25);grid on;title('Filter 2 Phase');
    subplot(9,2,5);plot(w3/pi,abs(H3),'linewidth',1.25);grid on;title('Filter 3 Magnitude');
    subplot(9,2,6);plot(w3/pi,phase3,'linewidth',1.25);grid on;title('Filter 3 Phase');
    subplot(9,2,7);plot(w4/pi,abs(H4),'linewidth',1.25);grid on;title('Filter 4 Magnitude');
    subplot(9,2,8);plot(w4/pi,phase4,'linewidth',1.25);grid on;title('Filter 4 Phase'); 
    subplot(9,2,9);plot(w5/pi,abs(H5),'linewidth',1.25);grid on;title('Filter 5 Magnitude');
    subplot(9,2,10);plot(w5/pi,phase5,'linewidth',1.25);grid on;title('Filter 5 Phase');
    subplot(9,2,11);plot(w6/pi,abs(H6),'linewidth',1.25);grid on;title('Filter 6 Magnitude');
    subplot(9,2,12);plot(w6/pi,phase6,'linewidth',1.25);grid on;title('Filter 6 Phase');
    subplot(9,2,13);plot(w7/pi,abs(H7),'linewidth',1.25);grid on;title('Filter 7 Magnitude');
    subplot(9,2,14);plot(w7/pi,phase7,'linewidth',1.25);grid on;title('Filter 7 Phase');
    subplot(9,2,15);plot(w8/pi,abs(H8),'linewidth',1.25);grid on;title('Filter 8 Magnitude');
    subplot(9,2,16);plot(w8/pi,phase8,'linewidth',1.25);grid on;title('Filter 8 Phase');
    subplot(9,2,17);plot(w9/pi,abs(H9),'linewidth',1.25);grid on;title('Filter 9 Magnitude');
    subplot(9,2,18);plot(w9/pi,phase9,'linewidth',1.25);grid on;title('Filter 9 Phase'); 

    %Plotting Impulse Responce and step responce of the developed filters (FIR) Type
    figure('Name','Impulse Responce and Step Responce of FIR FILTERS');    
    subplot(9,2,1);step(sys1);grid on; 
    subplot(9,2,2);impulse(sys1);grid on;
    subplot(9,2,3);step(sys2);grid on; 
    subplot(9,2,4);impulse(sys2);grid on;
    subplot(9,2,5);step(sys3);grid on; 
    subplot(9,2,6);impulse(sys3);grid on;
    subplot(9,2,7);step(sys4);grid on; 
    subplot(9,2,8);impulse(sys4);grid on;
    subplot(9,2,9);step(sys5);grid on; 
    subplot(9,2,10);impulse(sys5);grid on;
    subplot(9,2,11);step(sys6);grid on; 
    subplot(9,2,12);impulse(sys6);grid on;
    subplot(9,2,13);step(sys7);grid on; 
    subplot(9,2,14);impulse(sys7);grid on;
    subplot(9,2,15);step(sys8);grid on; 
    subplot(9,2,16);impulse(sys8);grid on;
    subplot(9,2,17);step(sys9);grid on; 
    subplot(9,2,18);impulse(sys9);grid on;
end
%plotting poles&zeros for all filters
figure('Name','Poles and Zeros of all FILTERS'); 
subplot(3,3,1);zplane(z1,p1);grid on;title('Filter 1');
subplot(3,3,2);zplane(z2,p2);grid on;title('Filter 2');
subplot(3,3,3);zplane(z3,p3);grid on;title('Filter 3');
subplot(3,3,4);zplane(z4,p4);grid on;title('Filter 4');
subplot(3,3,5);zplane(z5,p5);grid on;title('Filter 5');
subplot(3,3,6);zplane(z6,p6);grid on;title('Filter 6');
subplot(3,3,7);zplane(z7,p7);grid on;title('Filter 7');
subplot(3,3,8);zplane(z8,p8);grid on;title('Filter 8');
subplot(3,3,9);zplane(z9,p9);grid on;title('Filter 9');
%Filter the wave file using the filters developed
%Draw the output signals in Time and frequency domains
figure('Name','Filter the wave file using the filters (1, 2, 3)');
%Filter 1 (Low Pass Filter)
x1=filter(num1,den1,y);  
subplot(3,2,1);stem(x1);grid on;title('Output from Filter 1 in Time Domain');ylabel('Amplitude');xlabel('Time');
X1=fftshift(fft(x1)); 
subplot(3,2,2);stem(abs(X1));grid on;title('Output from Filter 1 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 2 (Band Pass Filter)
x2=filter(num2,den2,y);  
subplot(3,2,3);stem(x2);grid on;title('Output from Filter 2 in Time Domain');ylabel('Amplitude');xlabel('Time'); 
X2=fftshift(fft(x2)); 
subplot(3,2,4);stem(abs(X2));grid on;title('Output from Filter 2 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 3 (Band Pass Filter)
x3=filter(num3,den3,y);  
subplot(3,2,5);stem(x3);grid on;title('Output from Filter 3 in Time Domain');ylabel('Amplitude');xlabel('Time');  
X3=fftshift(fft(x3)); 
subplot(3,2,6);stem(abs(X3));grid on;title('Output from Filter 3 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 4 (Band Pass Filter)
figure('Name','Filter the wave file using the filters (4, 5, 6)');
x4=filter(num4,den4,y);  
subplot(3,2,1);stem(x4);grid on;title('Output from Filter 4 in Time Domain');ylabel('Amplitude');xlabel('Time');   
X4=fftshift(fft(x4)); 
subplot(3,2,2);stem(abs(X4));grid on;title('Output from Filter 4 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 5 (Band Pass Filter)
x5=filter(num5,den5,y);  
subplot(3,2,3);stem(x5);grid on;title('Output from Filter 5 in Time Domain');ylabel('Amplitude');xlabel('Time');    
X5=fftshift(fft(x5)); 
subplot(3,2,4);stem(abs(X5));grid on;title('Output from Filter 5 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 6 (Band Pass Filter)
x6=filter(num6,den6,y);  
subplot(3,2,5);stem(x6);grid on;title('Output from Filter 6 in Time Domain');ylabel('Amplitude');xlabel('Time');  
X6=fftshift(fft(x6)); 
subplot(3,2,6);stem(abs(X6));grid on;title('Output from Filter 6 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 7 (Band Pass Filter)
figure('Name','Filter the wave file using the filters (7, 8, 9)');
x7=filter(num7,den7,y);  
subplot(3,2,1);stem(x7);grid on;title('Output from Filter 7 in Time Domain');ylabel('Amplitude');xlabel('Time');   
X7=fftshift(fft(x7)); 
subplot(3,2,2);stem(abs(X7));grid on;title('Output from Filter 7 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 8 (Band Pass Filter)
x8=filter(num8,den8,y);  
subplot(3,2,3);stem(x8);grid on;title('Output from Filter 8 in Time Domain');ylabel('Amplitude');xlabel('Time');   
X8=fftshift(fft(x8)); 
subplot(3,2,4);stem(abs(X8));grid on;title('Output from Filter 8 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Filter 9 (Band Pass Filter)
x9=filter(num9,den9,y);  
subplot(3,2,5);stem(x9);grid on;title('Output from Filter 9 in Time Domain');ylabel('Amplitude');xlabel('Time');    
X9=fftshift(fft(x9)); 
subplot(3,2,6);stem(abs(X9));grid on;title('Output from Filter 9 in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
%Amplify the output signals using the user defined gain 
x1=G1*x1; 
x2=G2*x2;
x3=G3*x3; 
x4=G4*x4; 
x5=G5*x5; 
x6=G6*x6; 
x7=G7*x7;
x8=G8*x8; 
x9=G9*x9;
%Add the amplified - output signals in time domain to form composite signal
xt=x1+x2+x3+x4+x5+x6+x7+x8+x9;
% Draw and compare the composite signal with the original signal in time domain 
figure('Name','Comparing the Composite with the Original in Time Domain');
subplot(2,1,1);stem(xt);grid on;title('Composite Signal in Time Domain');ylabel('Amplitude');xlabel('Time');
subplot(2,1,2);stem(y);grid on;title('Original Signal in Time Domain');ylabel('Amplitude');xlabel('Time'); 
xf=fftshift(fft(xt)); 
yf=fftshift(fft(y));
% Draw and compare the composite signal with the original signal in frequency domain
figure('Name','Comparing the Composite with the Original in Freq Domain');
subplot(2,1,1);stem(abs(xf));grid on;title('Composite Signal in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
subplot(2,1,2);stem(abs(yf));grid on;title('Original Signal in Frequency Domain');ylabel('Magnitude');xlabel('Frequency'); 
%Playing the output wave signal
sound(xt,fouts);
xt=resample(xt,fouts,Fs);
figure('Name','Output Signal After Resampling with Output Sample Rate');
subplot(2,1,1);stem(xt);grid on;title('Output Signal after Resampling in Time Domain');ylabel('Amplitude');xlabel('Time');
xf=fftshift(fft(xt)); 
subplot(2,1,2);stem(abs(xf));grid on;title('Output Signal after Resampling in Frequency Domain');ylabel('Magnitude');xlabel('Frequency');
fprintf('*****************THANK YOU*****************\n');