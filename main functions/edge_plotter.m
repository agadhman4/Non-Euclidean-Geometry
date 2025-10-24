function edge = edge_plotter(p1,p2,n_points,tol)
% Calculates set of edge points for spherical arc between p1 and p2 and
% plots it
% Plots straight line if points are collinear with the origin
if abs(p1*conj(p2)-p2*conj(p1))< tol
    plot([real(p1),real(p2)],[imag(p1),imag(p2)],'b-','LineWidth',1.5);
    edge=linspace(p1,p2,n_points).';
% Calculates centre first then circular arc otherwise
else
    a=(p2*(abs(p1)^2-1)-p1*(abs(p2)^2-1))/(conj(p1)*p2-p1*conj(p2));
    rad_sq=abs(a)^2+1;
    r=sqrt(rad_sq);
    theta1=angle(p1-a);
    theta2=angle(p2-a);
    delta=theta2-theta1;
% Ensures we take the smaller arc by comparing lengths on the sphere
    delta=mod(delta+pi,2*pi)-pi;
    theta_arc1=theta1+linspace(0, delta, n_points);
    theta_arc2=theta1-linspace(0,sign(delta)*(2*pi - abs(delta)),n_points);
    arc_points1 = a + r * exp(1i*theta_arc1);
    arc_points2 = a + r * exp(1i*theta_arc2);

    arc_sphere1=invstereo(arc_points1);
    arc_sphere2=invstereo(arc_points2);
    arc_length1=zeros(1,n_points);
    arc_length2=zeros(1,n_points);

for m=1:n_points-1
    arc_length1(m)=acos(dot(arc_sphere1(m,:),arc_sphere1(m+1,:)));
    arc_length2(m)=acos(dot(arc_sphere2(m,:),arc_sphere2(m+1,:)));
end

l1=sum(arc_length1);
l2=sum(arc_length2);
if l1<l2
    edge = arc_points1.'; 
else
    edge = arc_points2.';
end
 % Plot the calculated shorter arc
    plot(real(edge), imag(edge), 'b-', 'LineWidth', 1.5);
end
end

