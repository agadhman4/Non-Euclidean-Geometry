function edge = hypedge_plotter(p1,p2,n_points,tol)
% Calculates set of edge points for hyperbolic arc between p1 and p2 and
% plots it
% Plots straight line if points are collinear with the origin
if abs(p1*conj(p2)-p2*conj(p1))< tol
    plot([real(p1),real(p2)],[imag(p1),imag(p2)],'b-','LineWidth',1.5);
    edge=linspace(p1,p2,n_points).';
% Calculates centre first then circular arc otherwise
else
    a=(p2*(abs(p1)^2+1)-p1*(abs(p2)^2+1))/(conj(p1)*p2-p1*conj(p2));
    rad_sq=abs(a)^2-1;
    r=sqrt(rad_sq);
    theta1=angle(p1-a);
    theta2=angle(p2-a);
    delta=theta2-theta1;
% Ensures we take the smaller arc
    delta=mod(delta+pi,2*pi)-pi;

    theta_arc=theta1+linspace(0, delta, n_points);
    arc_points = a + r * exp(1i * theta_arc);
    edge = arc_points.'; 
 % Plot the calculated shorter arc
    plot(real(arc_points), imag(arc_points), 'b-', 'LineWidth', 1.5);
end


