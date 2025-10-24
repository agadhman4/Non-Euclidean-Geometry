function drawsphericaltriangle(z1,z2,z3)
% Draws and fills the spherical triangle in complex plane between z1, z2,
% z3 where these are all distinct and z1 can be Inf, in which case you have
% an unbounded region

% Number of points per triangle edge
n_points=1000;
tol=1e-9; % For edge cases
is_z1_inf=isinf(z1);

% Plots complex plane for set up
hold on; axis equal; grid on;
xlabel('Re(z)'); ylabel('Im(z)');
title('Spherical Triangle');
plot(0, 0, 'k+', 'MarkerSize', 8, 'LineWidth', 1.5); 
set(gca,'FontSize',15)

% Set plot limits to ensure triangle is in figure
if ~is_z1_inf
    plot_lim=2*max(abs([z1,z2,z3]));
else
    plot_lim=2*max(abs([z2,z3]));
end

xlim([-plot_lim,plot_lim]); ylim([-plot_lim,plot_lim]);

store_edges=cell(1,4);

% Edge z1z2
if is_z1_inf
    store_edges{1}=plot_line(z2,n_points,1);
    zend1=store_edges{1}(end);
else
    store_edges{1}=edge_plotter(z1,z2,n_points,tol);
end

% Edge z2z3
if ~is_z1_inf
    store_edges{2}=edge_plotter(z2,z3,n_points,tol);
else
    store_edges{2}=edge_plotter(z3,z2,n_points,tol);
end

% Edge z3z1
if is_z1_inf
    store_edges{3}=plot_line(z3,n_points,-1);
    zend2=store_edges{3}(1);
else
    store_edges{3}=edge_plotter(z3,z1,n_points,tol);
end

% Constructs and fills boundary of triangle, if z1 is inf then fills part
% of unbounded region by adding another line between the ends of the rays to get a quadrilateral

boundary_points=[store_edges{1};store_edges{2};store_edges{3}];
if ~is_z1_inf
    fill(real(boundary_points),imag(boundary_points),'c','FaceAlpha',0.3,'EdgeColor','none')
else
    store_edges{4}=linspace(zend1,zend2,n_points).';
    boundary_points= [store_edges{1};store_edges{4};store_edges{3};store_edges{2}]; % Ensures correct orientation when region is filled
    fill(real(boundary_points),imag(boundary_points),'c','FaceAlpha',0.3,'EdgeColor','none')

end
