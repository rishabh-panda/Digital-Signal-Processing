clc;
close all;
clear all;
Fsampling=10;
Fmessage=3;
Amessage=2;
Asaw=3;
t=0:0.001:1; 
saw_signal=Asaw*sawtooth(2*pi*Fsampling*t); 
subplot(4,1,1);
plot(t,saw_signal); 
title('Comparator Wave');
xlabel('Time Axis');
ylabel('Amessageplitude');

m_t=Amessage.*sin(2*pi*Fmessage*t); 
subplot(4,1,2);
plot(t,m_t);
title('Message Signal');
xlabel('Time Axis');
ylabel('Amessageplitude');

for i=1:length(saw_signal)
if (m_t(i)>=saw_signal(i))
    pwm(i)=1; 
else
    pwm(i)=0;
end
end

subplot(4,1,3);
plot(t,pwm,'g');
title('PWM');
xlabel('Time Axis');
ylabel('Amessageplitude');
axis([0 1 0 1.1]);

%demodulation
dt = pwm.*saw_signal;
[b,a] = butter(4,0.01);
retrieved = filter(b,a,dt);

subplot(4,1,4);
plot(t, retrieved);
title('Demodulated Signal');
xlabel('Time Axis');
ylabel('Amessageplitude');