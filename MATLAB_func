function[t,x1,x2,x3,lambda1,lambda2,lambda3,u] = fnHIV(s,m1,m2,m3,r,Tmax,k,n,T0,Ti0,V0,A,Tf)
 % This is the function file for the 3-state, 1-control model for HIV dynamics
 % x1 is T (concentration of uninfected T-cells) with lambda1
 % x2 is Ti (concentration of infected T-cells) with lambda2
 % x3 is V (concentration of free virus particles) with lambda 3

 % r = growth rate of T cells per day, Tmax = maximum cell count
 % m = natural death rate (1 = uninfected T-cells, 2 = infected T-cells, 3 = free virus particles)
 % N = # of virus particles produced in host cell before death
 % u = chemo strength (0 is maximum strength, 1 is no chemo)
 % A >= 0 is the cost/weight parameter

% ODE/convergence parameters
tmin = 0; tmax = Tf; % time interval
delta = 0.001; % tolerance parameter
N = 1000; % small time increment
t = linspace(tmin,tmax,N+1); % N+1 includes 0

h = tmax/N; % step size
h2 = h/2; % convenient for rk4

% initialization of x,u,lambda
u = zeros(N+1,1);
x1 = zeros(N+1,1);
x2 = zeros(N+1,1);
x3 = zeros(N+1,1);
lambda1 = zeros(N+1,1); % first adjoint
lambda2 = zeros(N+1,1); % second adjoint
lambda3 = zeros(N+1,1); % third adjoint
x1(1) = T0;
x2(1) = Ti0;
x3(1) = V0;

% transversality condition
lambda1(N+1) = 0;
lambda2(N+1) = 0;
lambda3(N+1) = 0;

% initialize convergence criteria
test = -1;

% storage for iterates of u
u_iterates = [];

% - - - - - - - START SOLVING - - - - - - - for x0 = 1
while (test < 0)

% storage for previous approximations
oldu = u;
oldx1 = x1;
oldx2 = x2;
oldx3 = x3;
oldlambda1 = lambda1;
oldlambda2 = lambda2;
oldlambda3 = lambda3;

% solve for x (forward) using RK4 algorithm
xPrime1 = @(t,x1,x2,x3,u) s./(1+x3) - m1.*x1 + r.*x1.*(1-(x1+x2)./Tmax)- u.*k.*x3.*x1; %T
xPrime2 = @(t,x1,x2,x3,u) u.*k.*x3.*x1 - m2.*x2; %Ti
xPrime3 = @(t,x1,x2,x3,u) n.*m2.*x2 - m3.*x3; %V

for i = 1:N
u2 = 0.5*(u(i)+u(i+1)); % midpoint between u-vector values

k11 = xPrime1(t(i),x1(i),x2(i),x3(i),u(i));
k12 = xPrime2(t(i),x1(i),x2(i),x3(i),u(i));
k13 = xPrime3(t(i),x1(i),x2(i),x3(i),u(i));

k21 = xPrime1(t(i)+h2,x1(i)+h2*k11,x2(i)+h2*k12,x3(i)+h2*k13,u2);
k22 = xPrime2(t(i)+h2,x1(i)+h2*k11,x2(i)+h2*k12,x3(i)+h2*k13,u2);
k23 = xPrime3(t(i)+h2,x1(i)+h2*k11,x2(i)+h2*k12,x3(i)+h2*k13,u2);

k31 = xPrime1(t(i)+h2,x1(i)+h2*k21,x2(i)+h2*k22,x3(i)+h2*k23,u2);
k32 = xPrime2(t(i)+h2,x1(i)+h2*k21,x2(i)+h2*k22,x3(i)+h2*k23,u2);
k33 = xPrime3(t(i)+h2,x1(i)+h2*k21,x2(i)+h2*k22,x3(i)+h2*k23,u2);

k41 = xPrime1(t(i)+h,x1(i)+h*k31,x2(i)+h*k32,x3(i)+h*k33,u(i+1));
k42 = xPrime2(t(i)+h,x1(i)+h*k31,x2(i)+h*k32,x3(i)+h*k33,u(i+1));
k43 = xPrime3(t(i)+h,x1(i)+h*k31,x2(i)+h*k32,x3(i)+h*k33,u(i+1));

x1(i+1) = x1(i) + h/6*(k11 + 2*k21 + 2*k31 + k41);
x2(i+1) = x2(i) + h/6*(k12 + 2*k22 + 2*k32 + k42);
x3(i+1) = x3(i) + h/6*(k13 + 2*k23 + 2*k33 + k43);

end

% solve for lambda (backward)
lambdaPrime1 = @(t,x1,x2,x3,u,lambda1,lambda2,lambda3)  -A + m1.*lambda1 - r.*lambda1.*(1-(x1+x2)./Tmax) + (r.*x1.*lambda1)./Tmax + k.*u.*x3.*lambda1 - k.*u.*x3.*lambda2;
lambdaPrime2 = @(t,x1,x2,x3,u,lambda1,lambda2,lambda3)  (r.*lambda1.*x1)./Tmax + lambda2.*m2 - lambda3.*n.*m2 ;
lambdaPrime3 = @(t,x1,x2,x3,u,lambda1,lambda2,lambda3)  k.*x1.*u.*lambda1 + (s.*lambda1)./(1+x3).^2 - k.*x1.*u.*lambda2 + m3.*lambda3;


for i = 1:N % j index is backward movement
j = N + 2 - i;
u2 = 0.5*(u(j)+u(j-1)); % evaluating midpoints
x15 = 0.5*(x1(j)+x1(j-1));
x25 = 0.5*(x2(j)+x2(j-1));
x35 = 0.5*(x3(j)+x3(j-1));

k11 = lambdaPrime1(t(j),x1(j), x2(j),x3(j),u(j),lambda1(j), lambda2(j), lambda3(j)); % subtraction for backward movement
k12 = lambdaPrime2(t(j),x1(j), x2(j),x3(j),u(j),lambda1(j), lambda2(j), lambda3(j)); % subtraction for backward movement
k13 = lambdaPrime3(t(j),x1(j), x2(j),x3(j),u(j),lambda1(j), lambda2(j), lambda3(j)); % subtraction for backward movement

k21 = lambdaPrime1(t(j) - h2,x15, x25, x35,u2, lambda1(j)-h2*k11, lambda2(j)-h2*k12,lambda3(j)-h2*k13);
k22 = lambdaPrime2(t(j) - h2,x15, x25, x35,u2, lambda1(j)-h2*k11, lambda2(j)-h2*k12,lambda3(j)-h2*k13);
k23 = lambdaPrime3(t(j) - h2,x15, x25, x35,u2, lambda1(j)-h2*k11, lambda2(j)-h2*k12,lambda3(j)-h2*k13);

k31 = lambdaPrime1(t(j) - h2,x15, x25,x35,u2,lambda1(j)-h2*k21, lambda2(j)-h2*k22, lambda3(j)-h2*k23);
k32 = lambdaPrime2(t(j) - h2,x15, x25,x35,u2,lambda1(j)-h2*k21, lambda2(j)-h2*k22, lambda3(j)-h2*k23);
k33 = lambdaPrime3(t(j) - h2,x15, x25,x35,u2,lambda1(j)-h2*k21, lambda2(j)-h2*k22, lambda3(j)-h2*k23);

k41 = lambdaPrime1(t(j) - h, x1(j-1), x2(j-1), x3(j-1),u(j-1),lambda1(j)-h*k31, lambda2(j)-h*k32, lambda3(j)-h*k33);
k42 = lambdaPrime2(t(j) - h, x1(j-1), x2(j-1), x3(j-1),u(j-1),lambda1(j)-h*k31, lambda2(j)-h*k32, lambda3(j)-h*k33);
k43 = lambdaPrime3(t(j) - h, x1(j-1), x2(j-1), x3(j-1),u(j-1),lambda1(j)-h*k31, lambda2(j)-h*k32, lambda3(j)-h*k33);

lambda1(j-1) = lambda1(j) - h/6*(k11 + 2*k21 + 2*k31 + k41);
lambda2(j-1) = lambda2(j) - h/6*(k12 + 2*k22 + 2*k32 + k42);
lambda3(j-1) = lambda3(j) - h/6*(k13 + 2*k23 + 2*k33 + k43);

end

% update u
u1 = min(1, max(0, 1 - 0.5.*k.*x1.*x3.*lambda1 + 0.5.*k.*x3.*x1.*lambda2)); % u star
u = 0.5*(u1+oldu);

% store iterates of u
u_iterates = [u_iterates,u];

temp1 = delta*sum(abs(u)) - sum(abs(oldu - u));
temp21 = delta*sum(abs(x1)) - sum(abs(oldx1 - x1));
temp22 = delta*sum(abs(x2)) - sum(abs(oldx2 - x2));
temp23 = delta*sum(abs(x3)) - sum(abs(oldx3 - x3));
temp2 = min(temp21,min(temp22, temp23));
temp31 = delta*sum(abs(lambda1)) - sum(abs(oldlambda1 - lambda1));
temp32 = delta*sum(abs(lambda2)) - sum(abs(oldlambda2 - lambda2));
temp33 = delta*sum(abs(lambda3)) - sum(abs(oldlambda3 - lambda3));
temp3 = min(temp31, min(temp32, temp33));

test = min(temp1, min(temp2, temp3));
end
