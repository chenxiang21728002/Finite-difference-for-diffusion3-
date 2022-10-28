clear; close all;

theta=1;
d=0.1;
L=2;
h=0.01;
N=L/h+1;
k=1/h;
T=1;
dt=5*10^-6;
K=dt/h/h;
M=T/dt;
x=0:h:L;
t=0:dt:T;
Se=zeros(N,1);

Set=zeros(N,1);

for i=1:k;
Se(i,1)=1;
end
for i=k+1:N;
Se(i,1)=0;
end

ft(1)=Se(1,1)*1;

j=1;


while(j<M);
    
    ft(j+1)=0;
    

    
    
    %2--k-1
    for i=2:k-1;
    Set(i)=Se(i)+K*(Se(i+1)-2*Se(i)+Se(i-1));
    
    end
    
    Set(1)=Set(2);
    
    
    
    
    %k+1--N-1
    for i=k+1:N-1;
    Set(i)=Se(i)+K/d*(Se(i+1)-2*Se(i)+Se(i-1));
  
    end
    
    %k
    Set(k)=(Set(k+1)+d*Set(k-1))/(d+1);

    %N
    Set(N)=Set(N-1)/(1+theta*h*d);
    
    
    Se=Set;
    
    for i=1:N-1;
        
    ft(j+1)=ft(j+1)+(Se(i)+Se(i+1))/2*h;
    end
 
       
    j=j+1;
end
 subplot(1,2,1);plot(x,Se);ylabel('Se');axis([x(1) x(end) 0 1]);
 subplot(1,2,2);plot(t,ft);ylabel('ft');axis([t(1) t(end) 0 1]);

