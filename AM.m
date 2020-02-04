%程序名称：c1.m 
%程序功能：调用函数modulate,demod实现AM调制解调
%程序作者：曹雪锋
%最后修改时间：2017-1-12
%=========程序代码 ======== 
Fs=960;  %采样频率
N=960;    %采样点
n=0:N-1;t=n/Fs;  %时间序列
A0=1;  %载波信号振幅 
A1=1;   %调制信号振幅 
fc=120;  %载波信号频率 
fm=30;    %调制信号频率
f=n*Fs/N;  %频率
w0=2*fc*pi; 
w1=2*fm*pi;

Uc=A0*cos(w0*t);     %载波信号 
C1=fft(Uc);             %对载波信号进行傅里叶变换 
cxf=abs(C1);           %进行傅里叶变换  
figure(1); 
subplot(2,1,1); plot(t,Uc); title('载波信号波形'); axis([0 0.1 -1 1]);
subplot(2,1,2); plot(f(1:N/2),cxf(1:N/2));title('载波信号频谱'); 

mes=1+A1*cos(w1*t);   %调制信号 
C2=fft(mes);             % 对调制信号进行傅里叶变换 
zxc=abs(C2);        
figure(2)
subplot(2,1,1); plot(t,mes); title('调制信号');axis([0 0.5 0 2]);  
subplot(2,1,2);  plot(f(1:N/2),zxc(1:N/2)); title('调制信号频谱'); 

Uam=modulate(mes,fc,Fs,'am');%AM 已调信号
C3=fft(Uam);              %  对AM已调信号进行傅里叶变换
asd=abs(C3);
figure(3)
subplot(2,1,1);plot(t,Uam); grid on; title('AM已调信号波形'); 
subplot(2,1,2);plot(f(1:N/2),asd(1:N/2)),grid; title('AM已调信号频谱'); 
Dam=demod(Uam,fc,Fs,'am');  %对AM调制信号进行解调 
C4=fft(Dam);              %  对AM解调信号进行傅里叶变换  
wqe=abs(C4);
figure(4)
subplot(2,1,1); plot(t,Dam); grid on; title('AM解调信号波形');
axis([0 0.5 0 2]);
subplot(2,1,2); plot(f(1:N/2),wqe(1:N/2)),grid; title('AM解调信号频谱');

k=awgn(Uam,1);  %加大噪声，信噪比为1
pp=fft(k,960);
zs=abs(pp);
figure(6)
subplot(2,1,1);plot(t,k);
title('加大噪声后得到AM信号时域波形');%加大噪声后得到AM信号时域波形
subplot(2,1,2);plot(f(1:N/2),zs(1:N/2));
title('加大噪声后得到AM信号频域波形'); %加大噪声后得到AM信号频域波形
grid on;

qaz=demod(k,fc,Fs,'am'); %加大噪声后解调
figure(7)
subplot(2,1,1);plot(t,qaz);title('加大噪声后解调得到信号时域波形'); %加大噪声后解调得到信号时域波形
wsx=fft(qaz,960);
edc=abs(wsx);
subplot(2,1,2);
plot(f(1:N/2),edc(1:N/2));title('加大噪声后解调得到信号频域波形');  %加大噪声后解调得到信号频域波形
grid on;
d=Uam+awgn(Uam,20); %加小噪声，信噪比为20
op=fft(d,960);
mm=abs(op);
figure(8)
subplot(2,1,1);plot(t,d);
title('加小噪声后得到AM信号时域波形'); %加小噪声后得到AM信号时域波形
subplot(2,1,2);plot(f(1:N/2),mm(1:N/2));
title('加小噪声后得到AM信号频域波形'); %加小噪声后得到AM信号频域波形
grid on;
vb=demod(d,fc,Fs,'am'); %加小噪声后解调
figure(9)
subplot(2,1,1);plot(t,vb);
title('加小噪声后解调得到信号时域波形'); %加小噪声后解调得到信号时域波形fg=fft(vb,960);
ty=abs(fg);
subplot(2,1,2);
plot(f(1:N/2),ty(1:N/2));
title('加小噪声后解调得到信号频域波形');  %加小噪声后解调得到信号频域波形grid on;

