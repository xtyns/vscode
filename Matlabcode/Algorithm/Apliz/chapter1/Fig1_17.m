p=0.03;x=25.0216;
for y1=-0.002:0.0004:0.002
   y0=(-0.036:0.001:0.036)'*ones(1,73);
   z0=ones(73,1)*(-0.036:0.001:0.036);
   x0=(y0.^2+z0.^2)/(2*p);
   xn=(p^3+4*x0*2*p.*x0+p*(-4*y1*y0+3*2*p*x0))./(2*(p^2+2*p*x0));
   yn=(2*p*x0.*y0+p^2*(-y1+y0)+y1*(y0.^2-z0.^2))./(p^2+2*p*x0);
	zn=(p^2+2*p*x0+2*y1*y0).*z0./(p^2+2*p*x0);
	y=y0+(yn-y0).*(x-x0)./(xn-x0);
   z=z0+(zn-z0).*(x-x0)./(xn-x0);
   plot(y,z,'k.')
   hold on
end
 xlabel('y/m', 'fontsize',12)
 ylabel('z/m', 'fontsize',12)
