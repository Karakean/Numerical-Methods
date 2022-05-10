%1
K = [5,15,25,35];
for i = K
    [x,y,f,xp,yp] = rover(i);
    [XX,YY]=meshgrid(linspace(0,100,101),linspace(0,100,101));
    
    subplot(2,2,1)
    plot(xp,yp,'-o','linewidth',3);
    title("Rover's trajectory with K = ", num2str(i));
    xlabel('x[km]');
    ylabel('y[km]');
    
    subplot(2,2,2)
    plot3(x,y,f,'o');
    title("Values of collected samples with K = ", num2str(i));
    xlabel('x[km]');
    ylabel('y[km]');
    zlabel('f(x,y)');
    
    [p]=polyfit2d(x,y,f);
    [FF]=polyval2d(XX,YY,p);
    subplot(2,2,3);
    surf(XX,YY,FF);
    shading flat;
    title("Polynomial interpolation with K = ", num2str(i));
    xlabel('x[km]');
    ylabel('y[km]');
    zlabel('f(x,y)');
    
    [p] =trygfit2d(x,y,f);
    [FF]=trygval2d(XX,YY,p);
    subplot(2,2,4);
    surf(XX,YY,FF);
    shading flat;
    title("Trigonometric interpolation with K = ", num2str(i));
    xlabel('x[km]');
    ylabel('y[km]');
    zlabel('f(x,y)');

    saveas(gcf, strcat("ex1_K_", num2str(i), ".png"));
    clf
end

%2
poly_div=[];
trig_div=[];
K = 5:45;
for i = K
  [XX,YY]=meshgrid(linspace(0,1,101),linspace(0,1,101));
  [x,y,f,xp,yp] = rover(i);

  [p] = polyfit2d(x,y,f);
  [poly_FF]=polyval2d(XX,YY,p);

  [p] = trygfit2d(x,y,f);
  [trig_FF]=trygval2d(XX,YY,p);
  
  if i == 5
    prev_poly_FF = poly_FF;
    prev_trig_FF = trig_FF;
  else
    poly_div = [poly_div, max(max(abs(poly_FF-prev_poly_FF)))];
    trig_div = [trig_div, max(max(abs(trig_FF-prev_trig_FF)))];
    prev_poly_FF = poly_FF;
    prev_trig_FF = trig_FF;
  end
end
figure();
plot(6:45, poly_div);
title('Convergence of polynomial interpolation');
xlabel("Number of measuring points K");
ylabel('Maximum value of difference between interpolated functions');
saveas(gcf, 'ex2_polynomial.png');

figure();
plot(6:45, trig_div);
title('Convergence of trigonometric interpolation');
xlabel("Number of measuring points K");
ylabel('Maximum value of difference between  interpolated functions');
saveas(gcf, 'ex2_trigonometric.png');