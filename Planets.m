clear all;
close all;
% Planet rotation speed
W1 = 0.02;    
W2 = 0.015;
W3 = 0.01;
% Sun size
SunSize = 0.3;
% Orbit Detail
StepOrbit = 0.005;
% The size of the orbits of the planets
sizex1 = 1; sizex2 = 1.3; sizex3 = 1.8; sizex4 = 2.2;
sizey1 = 1; sizey2 = 1.3; sizey3 = 1.8; sizey4 = 2.2;
sizez1 = 1; sizez2 = 1.3; sizez3 = 1.8; sizez4 = 2.2;

% Orbit deflection angle
Ang1 = 3; Ang2 = -3; Ang3 = 0; Ang4 = 0;
% orbits, step
theta = 0:StepOrbit*pi:2*pi;
% Orbit deflection angle
OrbitAngle1 = Ang1*pi/180;
OrbitAngle2 = Ang2*pi/180;
OrbitAngle3 = Ang3*pi/180;
OrbitAngle4 = Ang4*pi/180;
% Trajectory 1 planet 
x_test = sizex1*cos(theta);
y_test = sizey1*cos(OrbitAngle1)*sin(theta);
z_test = sizez1*sin(OrbitAngle1)*sin(theta);
% Trajectory 2 planet
x_test1 = sizex2*cos(theta);
y_test1 = sizey2*cos(OrbitAngle2)*sin(theta);
z_test1 = sizez2*sin(OrbitAngle2)*sin(theta);
% Trajectory 3 planet 
x_test2 = sizex3*cos(theta);
y_test2 = sizey3*cos(OrbitAngle3)*sin(theta);
z_test2 = sizez3*sin(OrbitAngle3)*sin(theta);
% Trajectory 4 planet
x_test3 = sizex4*cos(theta);
y_test3 = sizey4*cos(OrbitAngle4)*sin(theta);
z_test3 = sizez4*sin(OrbitAngle4)*sin(theta);

% The sun, the size of the sun
[sphere_x,sphere_y,sphere_z] = sphere(25);
sphere_x = SunSize*sphere_x; 
sphere_y = SunSize*sphere_y; 
sphere_z = SunSize*sphere_z;
% Axles
figure('color','black');
axis([-2.2,2.2,-2.2,2.2,-2.2,2.2]);
axis tight
axis off
axis square;
% Axis turning
axis vis3d;
title Planet;
xlabel x; ylabel y; zlabel z;   
hold on
set(gcf,'Renderer','zbuffer') ;
Test = 1;
Stap2pln = 0;Stap3pln = 0;Stap4pln = 0;

for t = 0:0.01*pi:16*pi
  
     Stap2pln = Stap2pln + W1 ;
     Stap3pln = Stap3pln + W2 ;
     Stap4pln = Stap4pln + W3 ;
     cla
   
   Planet1 = plot3(x_test,y_test,z_test,'b',sizex1*cos(t),sizey1*cos(OrbitAngle1)*sin(t),...
        sizez1*sin(OrbitAngle1)*sin(t),'oy');
    

   Planet2 = plot3(x_test1,y_test1,z_test1,'r',sizex2*cos(Stap2pln),sizey2*cos(OrbitAngle2)*sin(Stap2pln),...
          sizez2*sin(OrbitAngle2)*sin(Stap2pln),'ow');
 
   Planet3 = plot3(x_test2,y_test2,z_test2,'g',sizex3*cos(Stap3pln),sizey3*cos(OrbitAngle3)*sin(Stap3pln),...
          sizez3*sin(OrbitAngle3)*sin(Stap3pln),'oy'); 
      
      Planet4 = plot3(x_test3,y_test3,z_test3,'b',sizex4*cos(Stap4pln),sizey4*cos(OrbitAngle4)*sin(Stap4pln),...
          sizez4*sin(OrbitAngle4)*sin(Stap4pln),'ow');  
      
      
      
     mesh(sphere_x,sphere_y,sphere_z,'EdgeColor',[1 1 0]);

     Movie(Test) = getframe(gcf);
      
     
end