clear all
clc

t=-3:3;
y=heaviside(t-2);
plot(t, y, 'r')
grid on
hold on
axis(-3 3 -3 3);