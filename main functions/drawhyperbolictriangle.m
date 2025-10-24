function drawhyperbolictriangle(z1,z2,z3)
% Plots the hyperbolic triangle between z1,z2,z3 inside unit disk
% Number of points per triangle edge
n_points=1000;
tol=1e-9; % For edge cases
% Plots complex plane for set up
hold on; axis equal; grid on;
xlabel('Re(z)'); ylabel('Im(z)');
title('Hyperbolic Triangle');
plot(0, 0, 'k+', 'MarkerSize', 8, 'LineWidth', 1.5); 
set(gca,'FontSize', 15);
xlim([-1.5,1.5]); ylim([-1.5,1.5]);
theta_uniform=linspace(-pi,pi,n_points);
unit_circle=exp(1i*theta_uniform);
plot(real(unit_circle),imag(unit_circle),'k','LineWidth',1.5);

store_edges=cell(1,3);

% Plots edges
store_edges{1}=hypedge_plotter(z1,z2,n_points,tol);
store_edges{2}=hypedge_plotter(z2,z3,n_points,tol);
store_edges{3}=hypedge_plotter(z3,z1,n_points,tol);

% Fills region in between
boundary_points=[store_edges{1};store_edges{2};store_edges{3}];
fill(real(boundary_points),imag(boundary_points),'c','FaceAlpha',0.3,'EdgeColor','none')