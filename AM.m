%�������ƣ�c1.m 
%�����ܣ����ú���modulate,demodʵ��AM���ƽ��
%�������ߣ���ѩ��
%����޸�ʱ�䣺2017-1-12
%=========������� ======== 
Fs=960;  %����Ƶ��
N=960;    %������
n=0:N-1;t=n/Fs;  %ʱ������
A0=1;  %�ز��ź���� 
A1=1;   %�����ź���� 
fc=120;  %�ز��ź�Ƶ�� 
fm=30;    %�����ź�Ƶ��
f=n*Fs/N;  %Ƶ��
w0=2*fc*pi; 
w1=2*fm*pi;

Uc=A0*cos(w0*t);     %�ز��ź� 
C1=fft(Uc);             %���ز��źŽ��и���Ҷ�任 
cxf=abs(C1);           %���и���Ҷ�任  
figure(1); 
subplot(2,1,1); plot(t,Uc); title('�ز��źŲ���'); axis([0 0.1 -1 1]);
subplot(2,1,2); plot(f(1:N/2),cxf(1:N/2));title('�ز��ź�Ƶ��'); 

mes=1+A1*cos(w1*t);   %�����ź� 
C2=fft(mes);             % �Ե����źŽ��и���Ҷ�任 
zxc=abs(C2);        
figure(2)
subplot(2,1,1); plot(t,mes); title('�����ź�');axis([0 0.5 0 2]);  
subplot(2,1,2);  plot(f(1:N/2),zxc(1:N/2)); title('�����ź�Ƶ��'); 

Uam=modulate(mes,fc,Fs,'am');%AM �ѵ��ź�
C3=fft(Uam);              %  ��AM�ѵ��źŽ��и���Ҷ�任
asd=abs(C3);
figure(3)
subplot(2,1,1);plot(t,Uam); grid on; title('AM�ѵ��źŲ���'); 
subplot(2,1,2);plot(f(1:N/2),asd(1:N/2)),grid; title('AM�ѵ��ź�Ƶ��'); 
Dam=demod(Uam,fc,Fs,'am');  %��AM�����źŽ��н�� 
C4=fft(Dam);              %  ��AM����źŽ��и���Ҷ�任  
wqe=abs(C4);
figure(4)
subplot(2,1,1); plot(t,Dam); grid on; title('AM����źŲ���');
axis([0 0.5 0 2]);
subplot(2,1,2); plot(f(1:N/2),wqe(1:N/2)),grid; title('AM����ź�Ƶ��');

k=awgn(Uam,1);  %�Ӵ������������Ϊ1
pp=fft(k,960);
zs=abs(pp);
figure(6)
subplot(2,1,1);plot(t,k);
title('�Ӵ�������õ�AM�ź�ʱ����');%�Ӵ�������õ�AM�ź�ʱ����
subplot(2,1,2);plot(f(1:N/2),zs(1:N/2));
title('�Ӵ�������õ�AM�ź�Ƶ����'); %�Ӵ�������õ�AM�ź�Ƶ����
grid on;

qaz=demod(k,fc,Fs,'am'); %�Ӵ���������
figure(7)
subplot(2,1,1);plot(t,qaz);title('�Ӵ����������õ��ź�ʱ����'); %�Ӵ����������õ��ź�ʱ����
wsx=fft(qaz,960);
edc=abs(wsx);
subplot(2,1,2);
plot(f(1:N/2),edc(1:N/2));title('�Ӵ����������õ��ź�Ƶ����');  %�Ӵ����������õ��ź�Ƶ����
grid on;
d=Uam+awgn(Uam,20); %��С�����������Ϊ20
op=fft(d,960);
mm=abs(op);
figure(8)
subplot(2,1,1);plot(t,d);
title('��С������õ�AM�ź�ʱ����'); %��С������õ�AM�ź�ʱ����
subplot(2,1,2);plot(f(1:N/2),mm(1:N/2));
title('��С������õ�AM�ź�Ƶ����'); %��С������õ�AM�ź�Ƶ����
grid on;
vb=demod(d,fc,Fs,'am'); %��С��������
figure(9)
subplot(2,1,1);plot(t,vb);
title('��С���������õ��ź�ʱ����'); %��С���������õ��ź�ʱ����fg=fft(vb,960);
ty=abs(fg);
subplot(2,1,2);
plot(f(1:N/2),ty(1:N/2));
title('��С���������õ��ź�Ƶ����');  %��С���������õ��ź�Ƶ����grid on;

