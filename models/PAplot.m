function PAplot(film,f,steps)
% Plotting figures to illustrate the Principle of Argument
%
% PAplot draws a unit circle and a countour resulting from the rational 
% function  f  evaluated on the unit circle
%
%   film        =0 drawing in one go, = 1 producing a "movie"
%   f           the rational transfer function to be evaluaetd
%   steps       the nuber of steps used while plotting
%
%   The performance is paused twice / press any key to continue
%   You can manually enlarge the figure during the first pause
%  
%   Copyright: M. Sebek -  May 6, 2007 



% computing axis
step=2*pi/steps;
t=0:step:2*pi;
x=cos(t);y=sin(t);
vf=value(f,x+j*y);
vx=real(vf);vy=imag(vf);
%minx=min([-1,vx]);maxx=max([1,vx]);
%miny=min([-1,vy]);maxy=max([1,vy]);
%poles=roots(f.den);rp=real(poles);ip=imag(poles);
%zeros=roots(f.num);rz=real(zeros);iz=imag(zeros);

poles=roots(f.den);poles=poles.';rp=real(poles);ip=imag(poles);
zeros=roots(f.num);zeros=zeros.';rz=real(zeros);iz=imag(zeros);
minx=min([-1,vx,rp,rz]);maxx=max([1,vx,rp,rz]);
miny=min([-1,vy,ip,iz]);maxy=max([1,vy,ip,iz]);

if film ~=1     % plotting in one go
    p=plot(x,y,'b.',vx,vy,'r.',rp,ip,'kx',rz,iz,'ko',0,0,'g*','MarkerSize',20);
    axis([minx-1 maxx+1 miny-1 maxy+1]);
    grid on
else            % plotting step by step like a movie
    p=plot(x,y,'b.',0,0,'g*','EraseMode','none','MarkerSize',10);hold on
    axis([minx-1 maxx+1 miny-1 maxy+1]);
    grid on;
    pause
    set(p,'XData',rp,'YData',ip,'Marker','x','Color','k','MarkerSize',15);
    drawnow
    set(p,'XData',rz,'YData',iz,'Marker','o','Color','k','MarkerSize',15);
    drawnow
    pause
    for t=0:step:2*pi;
        x=cos(-t);y=sin(-t);
        vf=value(f,x+j*y);
        vx=real(vf);vy=imag(vf);
        set(p,'XData',x,'YData',y,'Color','b','Marker','.','MarkerSize',30);
        drawnow,
        set(p,'XData',vx,'YData',vy,'Color','r','Marker','.','MarkerSize',30);
        drawnow
    end
    hold off;
end

end %PAplot


