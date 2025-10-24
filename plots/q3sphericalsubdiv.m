% Script to plot the required spherical subdivisions for n=3,4,5
% Substitute in expressions for magnitude of vertices
r1=sqrt((sqrt(3)*tan(pi/3)-1)/(sqrt(3)*tan(pi/3)+1));
r2=sqrt((sqrt(3)*tan(pi/4)-1)/(sqrt(3)*tan(pi/4)+1));
r3=sqrt((sqrt(3)*tan(pi/5)-1)/(sqrt(3)*tan(pi/5)+1));
w1=sqrt((2*sin(pi/3)-1)/(2*sin(pi/3)+1));
w2=sqrt((2*sin(pi/4)-1)/(2*sin(pi/4)+1));
w3=sqrt((2*sin(pi/5)-1)/(2*sin(pi/5)+1));

% Plots subdivisions in 3 different figures
fig1=figure;
hold on;
for k=1:3
  drawsphericaltriangle(0,r1*exp(2*1i*(k-1)*pi/3),w1*exp(1i*(2*k-1)*pi/3));
  drawsphericaltriangle(0,w1*exp(1i*(2*k-1)*pi/3),r1*exp(2*1i*(k)*pi/3));
end
fig2=figure;
hold on;
for k=1:4
  drawsphericaltriangle(0,r2*exp(2*1i*(k-1)*pi/4),w2*exp(1i*(2*k-1)*pi/4));
  drawsphericaltriangle(0,w2*exp(1i*(2*k-1)*pi/4),r2*exp(2*1i*(k)*pi/4));
end
fig3=figure;
hold on;
for k=1:5
  drawsphericaltriangle(0,r3*exp(2*1i*(k-1)*pi/5),w3*exp(1i*(2*k-1)*pi/5));
  drawsphericaltriangle(0,w3*exp(1i*(2*k-1)*pi/5),r3*exp(2*1i*(k)*pi/5));
end
