function phase(action, fun)

% This demo shows some interesting details about the solution of the VanDer Pol 
% second order ODE. The solution is drawn in the top of the picture with a dot 
% moving around dragging a tail of the last 40 steps. 
% At the bottom is drawn a picture of the eigenvalues in the complex plane, 
% the scale is {-10 .. 10] in both directions, the origin is indicated by a green star.
% Together with the eigenvalues the points scaled by the stepsize is drawn as
% a green dot, it moves near the negative real axis and the endpoint of the stability region 
% is indicated by a green cross.
% When the demo runs the points will move around their respective closed curves illustrating
% what happens in the stepsize control, how it uses the stability interval and how the tail 
% gets short when the stiffness ratio gets large.
% The GUI is just the one adapted for the ODEdemo's in the Matlab distribution.
% The demo uses the two files vdpol.m and vdpjac.m
% The demo hs been tested in versions 5.3.1 (Unix) and student edition 4a (Mac)
% Submitted by Per Grove Thomsen
% Institute for Mathematical Modelling
% Danish Technical University
% Building 305, DK 2800 Lyngby , Denmark.
% E-mail: pgt@imm.dtu.dk
% URL: http://www.imm.dtu.dk/documents/users/pgt/homepage.html

play = 1;
stop =-1;

if nargin<1,
    action='initialize';
end;

if strcmp(action,'initialize'),
    oldFigNumber=watchon;
    
    global TitleOfFigure
    
    if isempty(TitleOfFigure), TitleOfFigure='Phase Plot'; end;
    figNumber=figure( ...
        'Name',TitleOfFigure, ...
        'NumberTitle','off', ...
	'Visible','off');
    axes( ...
        'Units','normalized', ...
        'Position',[0.05 0.10 0.75 0.95], ...
        'Visible','off');

    %text(0,0,'Press the "Start" button to see the VanDerPol demo', ...
	%'HorizontalAlignment','center');
    %axis([-1 1 -1 1]);

    %===================================
    % Information for all buttons
    labelColor=[0.8 0.8 0.8];
    yInitPos=0.90;
    xPos=0.85;
    btnLen=0.10;
    btnWid=0.10;
    % Spacing between the button and the next command's label
    spacing=0.05;

    %====================================
    % The CONSOLE frame
    frmBorder=0.02;
    yPos=0.05-frmBorder;
    frmPos=[xPos-frmBorder yPos btnLen+2*frmBorder 0.9+2*frmBorder];
    h=uicontrol( ...
        'Style','frame', ...
        'Units','normalized', ...
        'Position',frmPos, ...
	'BackgroundColor',[0.50 0.50 0.50]);
    
    %====================================
    % The START button
    btnNumber=1;
    yPos=0.90-(btnNumber-1)*(btnWid+spacing);
    labelStr='Start';
    cmdStr='start';
    callbackStr='phase(''start'');';

    % Generic button information
    btnPos=[xPos yPos-spacing btnLen btnWid];
    startHndl=uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',btnPos, ...
        'String',labelStr, ...
        'Interruptible','on', ...
        'Callback',callbackStr);
     
%    %====================================
%    % The STOP button
%    btnNumber=2;
%    yPos=0.90-(btnNumber-1)*(btnWid+spacing);
%    labelStr='Stop';
%   % Setting userdata to -1 (=stop) will stop the demo.
%    
%    %callbackStr='set(gca,''Userdata'',-1)';    
%    callbackstr='InitCon = [NaN NaN];';
%    
%    % Generic  button information
%    btnPos=[xPos yPos-spacing btnLen btnWid];
%    stopstopHndl=uicontrol( ...
%        'Style','pushbutton', ...
%        'Units','normalized', ...
%        'Position',btnPos, ...
%        'Enable','on', ...
%        'String',labelStr, ...
%        'Callback',callbackStr);

     
    %====================================
    % The NEXT button
    btnNumber=3;
    yPos=0.90-(btnNumber-1)*(btnWid+spacing);
    labelStr='Next';
    % Setting userdata to -1 (=stop) will stop the demo.
    
    callbackStr='set(gca,''Userdata'',-1)';    
    
    % Generic  button information
    btnPos=[xPos yPos-spacing btnLen btnWid];
    stopHndl=uicontrol( ...
        'Style','pushbutton', ...
        'Units','normalized', ...
        'Position',btnPos, ...
        'Enable','off', ...
        'String',labelStr, ...
        'Callback',callbackStr);

    %====================================
    % The INFO button
    labelStr='Info';
    callbackStr='phase(''info'')';
    infoHndl=uicontrol( ...
        'Style','push', ...
        'Units','normalized', ...
        'position',[xPos 0.20 btnLen 0.10], ...
        'string',labelStr, ...
        'call',callbackStr);

    %====================================
    % The CLOSE button
    labelStr='Close';
    callbackStr='close(gcf)';
    closeHndl=uicontrol( ...
        'Style','push', ...
        'Units','normalized', ...
        'position',[xPos 0.05 btnLen 0.10], ...
        'string',labelStr, ...
        'call',callbackStr);
    
    % Uncover the figure
    hndlList=[startHndl stopHndl infoHndl closeHndl];
    set(figNumber,'Visible','on', ...
	'UserData',hndlList);

    watchoff(oldFigNumber);
    figure(figNumber);

elseif strcmp(action,'start'),
    axHndl=gca;
    figNumber=gcf;
    hndlList=get(figNumber,'UserData');
    startHndl=hndlList(1);
    stopHndl=hndlList(2);
    infoHndl=hndlList(3);
    closeHndl=hndlList(4);
    set([startHndl closeHndl infoHndl],'Enable','off');
    set(stopHndl,'Enable','on');

    % ====== Start of Demo
    set(figNumber,'Backingstore','on');
    % The graphics axis limits are set to values known 
    % to contain the solution.
    
    global AxesLims;
    XL = max(abs(AxesLims(1:2)));
    YL = max(abs(AxesLims(3:4)));
    if XL>10, XLp = floor(XL/5)*5;stepX = 5; else, XLp = XL; stepX = 1;end;
    if YL>10, YLp = floor(YL/5)*5;stepY = 5; else, YLp = YL; stepY = 1;end;
    
    
    global ViewPointPhase
    if isempty(ViewPointPhase), ViewPointPhase = [0,90]; end;
     %    'XLim',[-XLp XLp],'YLim',[-YLp YLp],'ZLim',[0 10], ...

    set(axHndl, ...
      	'XLim',[AxesLims(1) AxesLims(2)],'YLim',[AxesLims(3) AxesLims(4)],'ZLim',[0 10], ...
	'Userdata',play, ...
        'XTick',[-XLp:stepX:XLp],'YTick',[-YLp:stepY:YLp],'ZTick',[7], ...
	'Drawmode','fast', ...
        'Visible','off', ...
	'NextPlot','add', ...
        'Userdata',play, ...
        'View',ViewPointPhase);

    xlabel('y1');
    ylabel('y2');
    zlabel('Z');
    vdpstr1 = ['Van Der Pol problem                 '];
    vdpstr2 = ['y" = -mu (1-y^2)y` - y              '];
    vdpstr3 = ['for  mu = 5.0                       '];
    %text(-9,-9,5,vdpstr,'fontsize',12);

    % The values of the global parameters are
    global mu
    mu = 2.;
   
    % The numerical integration, and the display of the evolving solution,
    % are handled by the function ODE23P.
    
    FunFcn='funkce';
    % The initial conditions below will produce good results
    %y0 = [ 5 0];
    
    global InitCon
    if size(InitCon,1)>1,
       global InitConPom;
       InitConPom = InitCon;
       lt = length(InitConPom);
       for i = 1:lt,
          InitCon = InitConPom(i,:);
          phase('start');
       end;
       InitCon = [NaN NaN];
       %InitCon = InitConPom;
       return;
    end;
    
    global flag_revtime;
        flag_revtime = 0;

    if any([isnan((InitCon)),isempty(InitCon)]),
       [InitCon1 InitCon2 Button] = ginput(1);
       if Button == 3, InitCon = [InitCon1+j InitCon2]; else, InitCon = [InitCon1 InitCon2];end;
       phase('start');
    end;
    
    global flag_revtime;
    if any(imag(InitCon)~=0), 
       InitCon = real(InitCon);
       flag_revtime = 1;
    end;
    
       
    y0(1)=InitCon(1);
    y0(2)=InitCon(2);
    
    InitCon = [NaN NaN];
    
    t0=0;
    tfinal=100;
    pow = 1/3;
    tol = 0.0001;
 
    t = t0;
    hmax = (tfinal - t)/5;
    hmin = (tfinal - t)/20000;
    h = (tfinal - t)/100;
    y = y0(:);
    yd=[1.0*y; 7];
    tau = tol * max(norm(y,'inf'),1);
    % Compute the eigenvalues of the Jacobian.
    %z=vdpjac(t,y,mu);
                % Save L steps and plot like a comet tail.
    L = 40;
    Y = yd*ones(1,L);
    	zz = [0;0;0];
  	stb =[-2.5; 0;0];
    cla;
   % figure(1)
   nulpkt = line( ...
	'color','k', ...
	'linestyle','+', ...
	'markersize',15, ...
	'erase','none', ...
	'xdata',zz(1),'ydata',zz(2),'zdata',zz(3));

global FlagAnimation;
if isempty(FlagAnimation), FlagAnimiation = 'no'; end; 

ClrSpot = 'r';
if strcmp(FlagAnimation,'yes'),
   ClrArrow = 'g'; ClrTail = 'b'; ClrBody = 'y';
	head = line( ...
	'color','r', ...
	'linestyle','.', ...
	'markersize',25, ...
	'erase','xor', ...
   'xdata',yd(1),'ydata',yd(2),'zdata',yd(3));
else
   ClrArrow = 'b'; ClrTail = 'b'; ClrBody = 'b';
end;
	
	body = line( ...
	'color',ClrBody, ...
	'linestyle','-', ...
	'markersize',5, ...
	'erase','none', ...
	'xdata',[],'ydata',[],'zdata',[]);

	tail=line( ...
	'color',ClrTail, ...
	'linestyle','-', ...
	'markersize',5, ...
	'erase','none', ...
   'xdata',[],'ydata',[],'zdata',[]);

	arrowR=line( ...
	'color',ClrArrow, ...
	'linestyle','>', ...
	'markersize',5, ...
	'erase','none', ...
	'xdata',[],'ydata',[],'zdata',[]);
   
 	arrowL=line( ...
	'color',ClrArrow, ...
	'linestyle','<', ...
	'markersize',5, ...
	'erase','none', ...
	'xdata',[],'ydata',[],'zdata',[]);

 	arrowU=line( ...
	'color',ClrArrow, ...
	'linestyle','^', ...
	'markersize',5, ...
	'erase','none', ...
	'xdata',[],'ydata',[],'zdata',[]);

   arrowD=line( ...
	'color',ClrArrow, ...
	'linestyle','v', ...
	'markersize',5, ...
	'erase','none', ...
	'xdata',[],'ydata',[],'zdata',[]);

   spot=line( ...
	'color',ClrSpot, ...
	'linestyle','o', ...
	'markersize',2, ...
	'erase','none', ...
	'xdata',[],'ydata',[],'zdata',[]);


   
	%text(-19,-9,10,vdpstr1,'fontsize',12);
	%text(-19,-9,9,vdpstr2,'fontsize',12);
	%text(-19,-9,8,vdpstr3,'fontsize',12);
	
% and now the eigenvalues
    % The main loop
    
global TimeType;    
if isempty(TimeType), TimeType = 'c'; end;    
switch TimeType,
case 'd'
    
    flagpom = 1;
    countt = 2;
    
    tst = strcmp(FlagAnimation, 'yes');
    limitX = (2*XL) * (tst) + XL*~tst; 
    limitY = (2*YL) * (tst) + YL*~tst; 
    while (get(axHndl,'Userdata')==play) & abs(yd(1))<=limitX & abs(yd(2))<=limitY,        
      
          if t + h > tfinal, h = tfinal - t; end
          
          % Compute the slopes
                
      	 %s1 = feval(FunFcn, t, y,mu);
      	 %s2 = feval(FunFcn, t+h, y+h*s1,mu);
          %s3 = feval(FunFcn, t+h/2, y+h*(s1+s2)/4,mu);
        
 
      	% Estimate the error and the acceptable error
      	%delta = norm(h*(s1 - 2*s3 + s2)/3,'inf');
      	%tau = tol*max(norm(y,'inf'),1.0);
         %xtau = inf;
         
      	% Update the solution only if the error is acceptable
      	ts = t;
         ys = y;
         
         countt = countt+1;
         
         delta = 1; tau = 10;
      	if delta <= tau
            t = t + 1;
            
            y = feval(FunFcn, t, y,mu);
            
            %y = y + h*(s1 + 4*s3 + s2)/6;
            yd=[1.0*y ;7];
            
         % Compute the eigenvalues of the Jacobian.   
            %z=vdpjac(t,y,mu);
            %e=eig(z);
            %al1=real(e(1)); be1 = imag(e(1));
            %al2=real(e(2)); be2 = imag(e(2));
 		   	%ev1=[al1,be1]';
 			   %ev2=[al2,be2]';
 		   	%hE1 = h*ev1;
 		   	%hE2 = h*ev2;
             
            				% spot
            set(spot,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1));             
 
             
            % Update the plot
            Y = [yd Y(:,1:L-1)];
            %E1 = [ev1 E1(:,1:L-1)];
            %E2 =[ev2 E2(:,1:L-1)];
            set(body,'xdata',Y(1,1:2),'ydata',Y(2,1:2),'zdata',Y(3,1:2))
            if tst,
					set(head,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1))
               set(tail,'xdata',Y(1,L-1:L),'ydata',Y(2,L-1:L),'zdata',Y(3,L-1:L))
            end;
            
            assignin('base', 'Y',Y);
            
            % left-right arrow
            if ( ( (Y(2,1)-Y(2,2))<=0 & (Y(2,2)-Y(2,3))>=0 ) | ( (Y(2,1)-Y(2,2))>=0 & (Y(2,2)-Y(2,3))<=0 ) )& countt > 7
               if Y(1,1)<Y(1,2),
                  switch flag_revtime
                  case 0,
                     set(arrowL,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowR,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
          
               else
                  switch flag_revtime
                  case 0,
                     set(arrowR,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowL,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
                  
               end;
            end;
            
            % up-down arrow
            if ( ( (Y(1,1)-Y(1,2))<=0 & (Y(1,2)-Y(1,3))>=0 ) | ( (Y(1,1)-Y(1,2))>=0 & (Y(1,2)-Y(1,3))<=0 ) )& countt > 7
               if Y(2,1)<Y(2,2),
                  switch flag_revtime
                  case 1,
                     set(arrowU,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowD,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
          
               else
                  switch flag_revtime
                  case 1,
                     set(arrowD,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowU,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
                  
               end;
            end;

            drawnow;
         end      		           
 
      	% Update the step size
      	if delta ~= 0.0
            %h = min(hmax, 0.9*h*(tau/delta)^pow);
      	end

    end;    % Main loop ...

case 'c'
   
    flagpom = 1;
    countt = 2;
    
    tst = strcmp(FlagAnimation, 'yes');
    limitX = (2*XL) * (tst) + XL*~tst; 
    limitY = (2*YL) * (tst) + YL*~tst; 
    while (get(axHndl,'Userdata')==play) & (h >= hmin) & abs(yd(1))<=limitX & abs(yd(2))<=limitY,        
      
          if t + h > tfinal, h = tfinal - t; end
          
          % Compute the slopes
                
      	 s1 = feval(FunFcn, t, y,mu);
      	 s2 = feval(FunFcn, t+h, y+h*s1,mu);
          s3 = feval(FunFcn, t+h/2, y+h*(s1+s2)/4,mu);
        
 
      	% Estimate the error and the acceptable error
      	delta = norm(h*(s1 - 2*s3 + s2)/3,'inf');
      	tau = tol*max(norm(y,'inf'),1.0);
         %xtau = inf;
         
      	% Update the solution only if the error is acceptable
      	ts = t;
         ys = y;
         
         countt = countt+1;
         
      	if delta <= tau
            t = t + h;
            y = y + h*(s1 + 4*s3 + s2)/6;
            yd=[1.0*y ;7];
            
         % Compute the eigenvalues of the Jacobian.   
            %z=vdpjac(t,y,mu);
            %e=eig(z);
            %al1=real(e(1)); be1 = imag(e(1));
            %al2=real(e(2)); be2 = imag(e(2));
 		   	%ev1=[al1,be1]';
 			   %ev2=[al2,be2]';
 		   	%hE1 = h*ev1;
 		   	%hE2 = h*ev2;
            % Update the plot
            Y = [yd Y(:,1:L-1)];
            %E1 = [ev1 E1(:,1:L-1)];
            %E2 =[ev2 E2(:,1:L-1)];
            set(body,'xdata',Y(1,1:2),'ydata',Y(2,1:2),'zdata',Y(3,1:2))
            if tst,
					set(head,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1))
               set(tail,'xdata',Y(1,L-1:L),'ydata',Y(2,L-1:L),'zdata',Y(3,L-1:L))
            end;
            
            assignin('base', 'Y',Y);
            
            % left-right arrow
            if ( ( (Y(2,1)-Y(2,2))<=0 & (Y(2,2)-Y(2,3))>=0 ) | ( (Y(2,1)-Y(2,2))>=0 & (Y(2,2)-Y(2,3))<=0 ) )& countt > 7
               if Y(1,1)<Y(1,2),
                  switch flag_revtime
                  case 0,
                     set(arrowL,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowR,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
          
               else
                  switch flag_revtime
                  case 0,
                     set(arrowR,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowL,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
                  
               end;
            end;
            
            % up-down arrow
            if ( ( (Y(1,1)-Y(1,2))<=0 & (Y(1,2)-Y(1,3))>=0 ) | ( (Y(1,1)-Y(1,2))>=0 & (Y(1,2)-Y(1,3))<=0 ) )& countt > 7
               if Y(2,1)<Y(2,2),
                  switch flag_revtime
                  case 1,
                     set(arrowU,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowD,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
          
               else
                  switch flag_revtime
                  case 1,
                     set(arrowD,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  otherwise
                     set(arrowU,'xdata',Y(1,1),'ydata',Y(2,1),'zdata',Y(3,1)); flagpom = 0; countt=0;
                  end;
                  
               end;
            end;

            
            
            drawnow;
         end      		           
 
      	% Update the step size
      	if delta ~= 0.0
            h = min(hmax, 0.9*h*(tau/delta)^pow);
      	end

    end;    % Main loop ...
 end %switch   
   


    % ====== End of Demo
    set([startHndl closeHndl infoHndl],'Enable','on');
    set(stopHndl,'Enable','off');

elseif strcmp(action,'info');
    ttlStr='Phase Plot Info';
    hlpStr= ...                                             
        ['                                               '  
         ' Use the "Start" and "Next" buttons to control '  
         ' the animation.                                '  
         '                                               '  ];
      
    helpfun(ttlStr,hlpStr);                                 

end;    % if strcmp(action, ...

