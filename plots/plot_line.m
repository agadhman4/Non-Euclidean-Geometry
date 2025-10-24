function edge =plot_line(p,n_points,sign)
% Plots line between point p and Inf through origin, with given orientation
if sign==1
    line=linspace(p,100*p,n_points);
    plot(real(line),imag(line),'b-','LineWidth',1.5);
    edge=line.';
elseif sign==-1 
    line=linspace(100*p,p,n_points);
    plot(real(line),imag(line),'b-','LineWidth',1.5);
    edge=line.';
end
