u0=20; g=9.81; m=1000; f=0.015; Theta=0;
rho=1.202; A=1; Cd=0.5; uw=2;
Tau=(m/(rho*A*Cd*(u0+uw))); K=Tau/m;

G_cl = zpk([], [0 -2], 20);
G_long = tf([K], [Tau 1]);

gp = G_cl * G_long * tf(1, [1 0]); % integrator ptr ca pozitie
[numP_acc1, denP_acc1] = tfdata(gp, 'v');

%% 
sigma = 0.043;
ev = 0.1;
zeta = -log(sigma)/sqrt(pi^2+log(sigma)^2)
zeta = 0.5
t_t = 3;
w_tr = 4/(zeta*t_tr)
w_ev = 2 * zeta / ev 
w = max(w_tr, w_ev)
%%
p3 = -10*zeta*w
%p3 = -50;
%p3 = -5;
%%
g0 = tf(w^2, [1 2*zeta*w w^2]) * tf(p3, [1 -p3]) * tf(p3, [1 -p3])
[num0, den0] = tfdata(g0, 'v');



gr = minreal(g0/(gp*(1-g0)));
[numR_acc1, denR_acc1] = tfdata(gr, 'v');