[t,x1,x2,x3,lambda1,lambda2,lambda3,u] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;

figure(1) % standard conditions
plot(t,u, '-', 'DisplayName', 'Optimal Control u*(t)')
ylim([0 1])
title('Optimal Chemotherapy Treatment for Preliminary Parameters')
xlabel('Time')
ylabel('Optimal Control u*(t)')

figure(17)

subplot(3,1,1)
plot(t,x1,'-', 'DisplayName', 'Healthy CD4+ T-cell Concentration T(t)')
xlabel('Time')
ylabel('Optimal State Values')
title('Healthy CD4+ T-cell Concentration T(t) with Optimal Treatment Regimen')


subplot(3,1,2)
plot(t,x2,'-.', 'DisplayName', 'Infected CD4+ T-cell Concentration Ti(t)')
xlabel('Time')
ylabel('Optimal State Values')
title('Infected CD4+ T-cell Concentration Ti(t) with Optimal Treatment Regimen')

subplot(3,1,3)
plot(t,x3,':', 'DisplayName', 'HIV Virion Concentration V(t)')
xlabel('Time')
ylabel('Optimal State Values')
title('HIV Virion Concentrations V(t) with Optimal Treatment Regimen')


[t_1,x1_1,x2_1,x3_1,lambda1_1,lambda2_1,lambda3_1,u_1] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.025,20) ;

figure(2) % varying A (control)
subplot(2,2,1)
plot(t,u, '-', 'DisplayName', 'A = 0.05', 'LineWidth', 2)
hold on
plot(t_1,u_1, '-.', 'DisplayName', 'A = 0.025', 'LineWidth', 2)
hold off
ylim([0 1])
lgd = legend('Location', 'southeast');
title('Optimal Chemotherapy Treatment with A = 0.025')
xlabel('Time')
ylabel('Optimal Control u*(t)')

subplot(2,2,2)
plot(t,x1, '-', 'DisplayName', 'A = 0.05', 'LineWidth', 2)
hold on
plot(t_1,x1_1, '-.', 'DisplayName', 'A = 0.025', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northwest');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T(t) Values')

subplot(2,2,3)
plot(t,x2, '-', 'DisplayName', 'A = 0.05', 'LineWidth', 2)
hold on
plot(t_1,x2_1, '-.', 'DisplayName', 'A = 0.025', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of Infected CD4+ T-cells')
xlabel('Time')
ylabel('T_i(t) Values')

subplot(2,2,4)
plot(t,x3, '-', 'DisplayName', 'A = 0.05', 'LineWidth', 2)
hold on
plot(t_1,x3_1, '-.', 'DisplayName', 'A = 0.025', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of HIV virions')
xlabel('Time')
ylabel('V(t) Values')

[t_2,x1_2,x2_2,x3_2,lambda1_2,lambda2_2,lambda3_2,u_2] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,250,800,0.04,1.5,0.05,20) ;
[t_3,x1_3,x2_3,x3_3,lambda1_3,lambda2_3,lambda3_3,u_3] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,50,800,0.04,1.5,0.05,20) ;

figure(4) % varying N (control)
plot(t,u, ':', 'DisplayName', 'N = 300', 'LineWidth', 2)
hold on
plot(t_2,u_2, '-.', 'DisplayName', 'N = 250','LineWidth', 2)
plot(t_3,u_3, '-', 'DisplayName', 'N = 50','LineWidth', 2)
hold off
ylim([0 1])
title('Optimal Chemotherapy Treatment Varying N')
xlabel('Time')
ylabel('Optimal Control u*(t)')
lgd = legend('Location', 'southeast')

figure(5) % varying N (states)
subplot(3,1,1)
plot(t,x1, '--', 'DisplayName', 'N = 300', 'LineWidth', 2)
hold on
plot(t_2,x1_2, '-.', 'DisplayName', 'N = 250', 'LineWidth',2)
plot(t_3,x1_3, '-', 'DisplayName', 'N = 50', 'LineWidth', 2)
hold off
lgd = legend('Location', 'southeast');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T(t) Values')

subplot(3,1,2)
plot(t,x2, '--', 'DisplayName', 'N = 300', 'LineWidth', 2)
hold on
plot(t_2,x2_2, '-.', 'DisplayName', 'N = 250', 'LineWidth', 2)
plot(t_3,x2_3, '-', 'DisplayName', 'N = 50','LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of Infected CD4+ T-cells')
xlabel('Time')
ylabel('T_i(t) Values')

subplot(3,1,3)
plot(t,x3, '--', 'DisplayName', 'N = 300','LineWidth', 2)
hold on
plot(t_2,x3_2, '-.', 'DisplayName', 'N = 250','LineWidth', 2)
plot(t_3,x3_3, '-', 'DisplayName', 'N = 50','LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of HIV virions')
xlabel('Time')
ylabel('V(t) Values')

[t_4,x1_4,x2_4,x3_4,lambda1_4,lambda2_4,lambda3_4,u_4] = fnHIV(10,0.02,0.5,4.4,0.045,1500,0.000024,300,800,0.04,1.5,0.05,20) ;

figure(6) % varying r control
subplot(2,2,1)
plot(t,u, '-', 'DisplayName', 'r = 0.03', 'LineWidth', 2)
hold on
plot(t_4,u_4, '-.', 'DisplayName', 'r = 0.045', 'LineWidth', 2)
hold off
ylim([0 1])
title('Optimal Chemotherapy Treatment Varying r')
xlabel('Time')
ylabel('Optimal Control u*(t)')
lgd = legend('Location', 'southeast')

 % varying r states
subplot(2,2,2)
plot(t,x1, '-', 'DisplayName', 'r = 0.03', 'LineWidth', 2)
hold on
plot(t_4,x1_4, '-.', 'DisplayName', 'r = 0.045', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northwest');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T(t) Values')

subplot(2,2,3)
plot(t,x2, '-', 'DisplayName', 'r =0.03', 'LineWidth', 2)
hold on
plot(t_4,x2_4, '-.', 'DisplayName', 'r = 0.045', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of Infected CD4+ T-cells')
xlabel('Time')
ylabel('T_i(t) Values')

subplot(2,2,4)
plot(t,x3, '-', 'DisplayName', 'r = 0.03', 'LineWidth', 2)
hold on
plot(t_4,x3_4, '-.', 'DisplayName', 'r = 0.045', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of HIV virions')
xlabel('Time')
ylabel('V(t) Values')

% varying infection rate k
[t_5,x1_5,x2_5,x3_5,lambda1_5,lambda2_5,lambda3_5,u_5] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000032,300,800,0.04,1.5,0.05,20) ;

figure(8) % varying k control
subplot(2,2,1)
plot(t,u, '-', 'DisplayName', 'k = 0.000024', 'LineWidth', 2)
hold on
plot(t_5,u_5, '-.', 'DisplayName', 'k = 0.000032', 'LineWidth', 2)
hold off
ylim([0 1])
title('Optimal Chemotherapy Treatment Varying k')
xlabel('Time')
ylabel('Optimal Control u*(t)')
lgd = legend('Location', 'southeast')

subplot(2,2,2)
plot(t,x1, '-', 'DisplayName', 'k = 0.000024', 'LineWidth', 2)
hold on
plot(t_5,x1_5, '-.', 'DisplayName', 'k = 0.000032', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northwest');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T(t) Concentration')

subplot(2,2,3)
plot(t,x2, '-', 'DisplayName', 'k = 0.000024', 'LineWidth', 2)
hold on
plot(t_5,x2_5, '-.', 'DisplayName', 'k = 0.000032', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of Infected CD4+ T-cells')
xlabel('Time')
ylabel('T_i(t) Concentration')

subplot(2,2,4)
plot(t,x3, '-', 'DisplayName', 'k = 0.000024', 'LineWidth', 2)
hold on
plot(t_5,x3_5, '-.', 'DisplayName', 'k = 0.00032', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of HIV virions')
xlabel('Time')
ylabel('V(t) Concentration')

% varying s new cell production rate
[t_6,x1_6,x2_6,x3_6,lambda1_6,lambda2_6,lambda3_6,u_6] = fnHIV(9,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
[t_7,x1_7,x2_7,x3_7,lambda1_7,lambda2_7,lambda3_7,u_7] = fnHIV(8,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
[t_8,x1_8,x2_8,x3_8,lambda1_8,lambda2_8,lambda3_8,u_8] = fnHIV(7,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;

figure(10) % varying s control
subplot(2,2,1)
plot(t,u, '-', 'DisplayName', 's = 10', 'LineWidth', 2)
hold on
plot(t_6,u_6, '-.', 'DisplayName', 's = 9', 'LineWidth', 2)
plot(t_7,u_7, ':', 'DisplayName', 's = 8', 'LineWidth', 2)
plot(t_8,u_8, '--', 'DisplayName', 's = 7', 'LineWidth', 2)
hold off
ylim([0 1])
title('Optimal Chemotherapy Treatment Varying s')
xlabel('Time')
ylabel('Optimal Control u*(t)')
lgd = legend('Location', 'southeast')

subplot(2,2,2)
plot(t,x1, '-', 'DisplayName', 's = 10', 'LineWidth', 2)
hold on
plot(t_6,x1_6, '-.', 'DisplayName', 's = 9', 'LineWidth', 2)
plot(t_7,x1_7, ':', 'DisplayName', 's = 8', 'LineWidth', 2)
plot(t_8,x1_8, '--', 'DisplayName', 's = 7', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northwest');
title('Concentration of Healthy CD4+ T-cells Varying s')
xlabel('Time')
ylabel('T(t) Values')

subplot(2,2,3)
plot(t,x2, '-', 'DisplayName', 's = 10', 'LineWidth', 2)
hold on
plot(t_6,x2_6, '-.', 'DisplayName', 's = 9', 'LineWidth', 2)
plot(t_7,x2_7, ':', 'DisplayName', 's = 8', 'LineWidth', 2)
plot(t_8,x2_8, '--', 'DisplayName', 's = 7', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of Infected CD4+ T-cells Varying s')
xlabel('Time')
ylabel('T_i(t) Values')

subplot(2,2,4)
plot(t,x3, '-', 'DisplayName', 's = 10', 'LineWidth', 2)
hold on
plot(t_6,x3_6, '-.', 'DisplayName', 's = 9', 'LineWidth', 2)
plot(t_7,x3_7, ':', 'DisplayName', 's = 8', 'LineWidth', 2)
plot(t_8,x3_8, '--', 'DisplayName', 's = 7', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northeast');
title('Concentration of HIV virions Varying s')
xlabel('Time')
ylabel('V(t) Values')

% varying Tmax
[t_9,x1_9,x2_9,x3_9,lambda1_9,lambda2_9,lambda3_9,u_9] = fnHIV(10,0.02,0.5,4.4,0.03,1200,0.000024,300,800,0.04,1.5,0.05,20) ;

% varying Tmax control and T(t)
figure(12)
subplot(3,1,1)
plot(t,u, '-', 'DisplayName', 'Tmax = 1500', 'LineWidth', 2)
hold on
plot(t_9,u_9, '-.', 'DisplayName', 'Tmax = 1200', 'LineWidth', 2)
hold off
ylim([0 1])
title('Optimal Chemotherapy Treatment Varying Tmax')
xlabel('Time')
ylabel('Optimal Control u*(t)')
lgd = legend('Location', 'southwest')

subplot(3,1,2)
plot(t,x1, '-', 'DisplayName', 'Tmax = 1500', 'LineWidth', 2)
hold on
plot(t_9,x1_9, '-.', 'DisplayName', 'Tmax = 1200', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northwest');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T(t) Values')

subplot(3,1,3)
plot(t,x2, '-', 'DisplayName', 'Tmax = 1500', 'LineWidth', 2)
hold on
plot(t_9,x2_9, '-.', 'DisplayName', 'Tmax = 1200', 'LineWidth', 2)
hold off
lgd = legend('Location', 'northwest');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T_i(t) Values')

% varying Tf
[t_10,x1_10,x2_10,x3_10,lambda1_10,lambda2_10,lambda3_10,u_10] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,10) ;
[t_11,x1_11,x2_11,x3_11,lambda1_11,lambda2_11,lambda3_11,u_11] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.1,10) ;

% varying Tf control
figure(13)
plot(t,u, '-', 'DisplayName', 'Tf = 20', 'LineWidth', 2)
hold on
plot(t_10,u_10, '-.', 'DisplayName', 'Tf = 10', 'LineWidth', 2)
plot(t_11,u_11, '-.', 'DisplayName', 'Tf = 10, A = 0.1', 'LineWidth', 2)
hold off
ylim([0 1])
title('Optimal Chemotherapy Treatment Varying Tf')
xlabel('Time')
ylabel('Optimal Control u*(t)')
lgd = legend('Location', 'southeast')

figure(14) % states varying Tf
subplot(3,1,1)
plot(t,x1, '-', 'DisplayName', 'Tf = 20', 'LineWidth', 2)
hold on
plot(t_10,x1_10, '-.', 'DisplayName', 'Tf = 10', 'LineWidth', 2)
plot(t_11,x1_11, ':', 'DisplayName', 'Tf = 10, A = 0.1', 'LineWidth', 2)
hold off
lgd = legend('Location', 'southeast');
title('Concentration of Uninfected CD4+ T-cells')
xlabel('Time')
ylabel('T(t) Values')

subplot(3,1,2)
plot(t,x2, '-', 'DisplayName', 'Tf = 20', 'LineWidth', 2)
hold on
plot(t_10,x2_10, '-.', 'DisplayName', 'Tf = 10', 'LineWidth', 2)
plot(t_11,x2_11, ':', 'DisplayName', 'Tf = 10, A = 0.1', 'LineWidth', 2)
hold off
lgd = legend('Location', 'southeast');
title('Concentration of Infected CD4+ T-cells')
xlabel('Time')
ylabel('T_i(t) Values')

subplot(3,1,3)
plot(t,x2, '-', 'DisplayName', 'Tf = 20', 'LineWidth', 2)
hold on
plot(t_10,x2_10, '-.', 'DisplayName', 'Tf = 10', 'LineWidth', 2)
plot(t_11,x2_11, ':', 'DisplayName', 'Tf = 10, A = 0.1', 'LineWidth', 2)
hold off
lgd = legend('Location', 'southeast');
title('Concentration of HIV virions')
xlabel('Time')
ylabel('V(t) Values')

% varying death rates:
% doubling and halving m1
[t_12,x1_12,x2_12,x3_12,lambda1_12,lambda2_12,lambda3_12,u_12] = fnHIV(10,0.03,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
[t_13,x1_13,x2_13,x3_13,lambda1_13,lambda2_13,lambda3_13,u_13] = fnHIV(10,0.01,0.5,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
% doubling and halving m2
[t_14,x1_14,x2_14,x3_14,lambda1_14,lambda2_14,lambda3_14,u_14] = fnHIV(10,0.02,0.8,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
[t_15,x1_15,x2_15,x3_15,lambda1_15,lambda2_15,lambda3_15,u_15] = fnHIV(10,0.02,0.25,4.4,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
% doubling and halving m3
[t_16,x1_16,x2_16,x3_16,lambda1_16,lambda2_16,lambda3_16,u_16] = fnHIV(10,0.02,0.5,6.6,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;
[t_17,x1_17,x2_17,x3_17,lambda1_17,lambda2_17,lambda3_17,u_17] = fnHIV(10,0.02,0.5,2.2,0.03,1500,0.000024,300,800,0.04,1.5,0.05,20) ;

figure(15) % controls for varying death rates
subplot(3,1,1)
plot(t,u, 'DisplayName', 'm1 = 0.02', '-','LineWidth', 2)
hold on
plot(t_12,u_12, 'DisplayName', 'm1 = 0.03', '--','LineWidth', 2)
plot(t_13,u_13, 'DisplayName', 'm1 = 0.01', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Optimal Control u*(t)')
title('Optimal Chemotherapy Treatment Varying m1')

subplot(3,1,2)
plot(t,u, 'DisplayName', 'm2 = 0.5', '-','LineWidth', 2)
hold on
plot(t_14,u_14, 'DisplayName', 'm2 = 0.8', '--','LineWidth', 2)
plot(t_15,u_15, 'DisplayName', 'm2 = 0.25', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Optimal Control u*(t)')
title('Optimal Chemotherapy Treatment Varying m2')

subplot(3,1,3)
plot(t,u, 'DisplayName', 'm3 = 4.4','-', 'LineWidth', 2)
hold on
plot(t_16,u_16, 'DisplayName', 'm3 = 6.6','--', 'LineWidth', 2)
plot(t_17,u_17, 'DisplayName', 'm3 = 2.2', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Optimal Control u*(t)')
title('Optimal Chemotherapy Treatment Varying m3')

% changing initial conditions
% doubling and halving T0
[t_18,x1_18,x2_18,x3_18,lambda1_18,lambda2_18,lambda3_18,u_18] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,1000,0.04,1.5,0.05,20) ;
[t_19,x1_19,x2_19,x3_19,lambda1_19,lambda2_19,lambda3_19,u_19] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,400,0.04,1.5,0.05,20) ;
% doubling and halving Ti0
[t_20,x1_20,x2_20,x3_20,lambda1_20,lambda2_20,lambda3_20,u_20] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.08,1.5,0.05,20) ;
[t_21,x1_21,x2_21,x3_21,lambda1_21,lambda2_21,lambda3_21,u_21] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.02,1.5,0.05,20) ;
% doubling and halving V0
[t_22,x1_22,x2_22,x3_22,lambda1_22,lambda2_22,lambda3_22,u_22] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,3,0.05,20) ;
[t_23,x1_23,x2_23,x3_23,lambda1_23,lambda2_23,lambda3_23,u_23] = fnHIV(10,0.02,0.5,4.4,0.03,1500,0.000024,300,800,0.04,0.75,0.05,20) ;

figure(16) % states for varying T0
subplot(3,1,1)
plot(t,x1, 'DisplayName', 'T0 = 800', '-','LineWidth', 2)
hold on
plot(t_18,x1_18, 'DisplayName', 'T0 = 1000','--', 'LineWidth', 2)
plot(t_19,x1_19, 'DisplayName', 'T0 = 400', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Healthy CD4+ T-cells T(t)')
title('Optimal CD4+ T-cell Count Varying T0')

subplot(3,1,2)
plot(t,u, 'DisplayName', 'T0 = 800','-', 'LineWidth', 2)
hold on
plot(t_18,u_18, 'DisplayName', 'T0 = 1000','--', 'LineWidth', 2)
plot(t_19,u_19, 'DisplayName', 'T0 = 400', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Optimal Control u*(t)')
title('Optimal Chemotherapy Treatment Varying T0')

figure(18) % states for varying Ti0

subplot(3,1,1)
plot(t,x1, 'DisplayName', 'Ti0 = 0.04', '-','LineWidth', 2)
hold on
plot(t_20,x1_20, 'DisplayName', 'Ti0 = 0.08', '--','LineWidth', 2)
plot(t_21,x1_21, 'DisplayName', 'Ti0 = 0.02', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Healthy CD4+ T-cells T(t)')
title('Optimal CD4+ T-cell Count Varying Ti0')

subplot(3,1,2)
plot(t,x2, 'DisplayName', 'Ti0 = 0.04', 'LineWidth', 2)
hold on
plot(t_20,x2_20, 'DisplayName', 'Ti0 = 0.08', '--','LineWidth', 2)
plot(t_21,x2_21, 'DisplayName', 'Ti0 = 0.02', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Infected CD4+ T-cells T(t)')
title('Optimal Infected CD4+ T-cell Count Varying Ti0')

subplot(3,1,3)
plot(t,x3, 'DisplayName', 'Ti0 = 0.04', 'LineWidth', 2)
hold on
plot(t_20,x3_20, 'DisplayName', 'Ti0 = 0.08','--', 'LineWidth', 2)
plot(t_21,x3_21, 'DisplayName', 'Ti0 = 0.02', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('HIV virions V(t)')
title('Optimal HIV Virion Count Varying Ti0')

figure(19) % states for varying V0

subplot(2,1,1)
plot(t,u, 'DisplayName', 'V0 = 1.5', 'LineWidth', 2)
hold on
plot(t_22,u_22, 'DisplayName', 'V0 = 3', '--','LineWidth', 2)
plot(t_23,u_23, 'DisplayName', 'V0 = 0.75', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('Optimal Control u*(t)')
title('Optimal Chemotherapy Treatment Varying V0')

subplot(2,1,2)
plot(t,x3, 'DisplayName', 'V0 = 1.5', 'LineWidth', 2)
hold on
plot(t_22,x3_22, 'DisplayName', 'V0 = 3', '--','LineWidth', 2)
plot(t_23,x3_23, 'DisplayName', 'V0 = 0.75', '-.','LineWidth', 2)
hold off
lgd = legend;
xlabel('Time')
ylabel('HIV Virions V(t)')
title('Optimal HIV Virion Count Varying V0')
