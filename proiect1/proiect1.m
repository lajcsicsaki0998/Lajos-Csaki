Hf=tf([2],[1 1 0]);
tr=20;
G=0.1;
tita=abs(log(G))/(sqrt(abs(log(G))+(pi^2)));
wn=4/(tr*tita);
cv=wn/(2*tita);
Estv=1/cv;
dwb=wn*sqrt(1-2*(tita^2)+sqrt(2-4*(tita^2)+(4*tita^4)))

H0=tf([wn^2],[1 2*tita*wn wn^2]);
step(H0)
figure
t=0:0.1:100;
Gf=lsim(H0,t,t);
hold on
plot(t,Gf);
plot(t,t);
hold off
Hr=1/Hf*(H0/(1-H0));
Hrs=zpk(minreal(Hr))