% Script to plot the required hyperbolic subdivisions for n=8,9
% Substitute in expressions for magnitude of vertices
r1=sqrt(-(sqrt(3)*tan(pi/7)-1)/(sqrt(3)*tan(pi/7)+1));
r2=sqrt(-(sqrt(3)*tan(pi/8)-1)/(sqrt(3)*tan(pi/8)+1));
w1=sqrt(-(2*sin(pi/7)-1)/(2*sin(pi/7)+1));
w2=sqrt(-(2*sin(pi/8)-1)/(2*sin(pi/8)+1));
% Plots subdivisions in 2 different figures
fig1=figure;
hold on;
for k=1:7
  drawhyperbolictriangle(0,r1*exp(2*1i*(k-1)*pi/7),w1*exp(1i*(2*k-1)*pi/7));
  drawhyperbolictriangle(0,w1*exp(1i*(2*k-1)*pi/7),r1*exp(2*1i*(k)*pi/7));
end
fig2=figure;
hold on;
for k=1:8
  drawhyperbolictriangle(0,r2*exp(2*1i*(k-1)*pi/8),w2*exp(1i*(2*k-1)*pi/8));
  drawhyperbolictriangle(0,w2*exp(1i*(2*k-1)*pi/8),r2*exp(2*1i*(k)*pi/8));
end
