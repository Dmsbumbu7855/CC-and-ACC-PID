u0=20; g=9.81; m=1000; f=0.015; Theta=0;
rho=1.202; A=1; Cd=0.5; uw=2;
Tau=(m/(rho*A*Cd*(u0+uw))); K=Tau/m;

G_cl = zpk([], [0 -2], 20);
G_long = tf(K, [Tau 1]);

Gp = G_cl * G_long;

[numP_cc, denP_cc] = tfdata(Gp, 'v');

k_crit = 2.666;
t0 = 38.9;

%% PI cu z-n
t_i = 0.8 * t0;

kp = k_crit * 0.4;
ki = kp / t_i;

%% PID cu z-n
t_i = 0.5 * t0;
t_d = 0.125 * t0;
kp = k_crit * 0.6;
ki = kp / t_i;
kd = kp*t_d;

%% PID cu care am ramas
% suprareglare = 7%
% timp de crestere = 2.842s
% timp de r. tranz. 5% = 14.4s
kp = 3;
ki = 0.01;
kd = 50;
%%
