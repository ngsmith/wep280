%% Caluculate the rest of the array, ie: the values with added
%probability and error x(1),y(1),theta(1) are old values and primes are
%new values
for i = 2:100
        dr1 = atan2(y_prime - y(1), x_prime - x(1)) - theta(1);
        dtr = sqrt((y(1) - y_prime)^2 + (x(1)- x_prime)^2);
        dr2 = theta_prime - theta(1) - dr1;
 
        dr1_h = dr1 - mysample(abs(a1*dr1 + a2*dtr));
        dtr_h = dtr - mysample(abs(a3*dtr + a4*(dr1+dr2)));
        dr2_h = dr2 - mysample(abs(a1*dr2 + a2*dtr));
       
        x(i) = x(i) + dtr_h*cos(inRange(theta(i)+dr1_h));
        y(i) = y(i) + dtr_h*sin(inRange(theta(i)+dr1_h));
        theta(i) = inRange(theta(i) + (dr1_h + dr2_h));         
    
end 


%% compute new pose x,y,theta(Real position of the robot)
    theta(1) = theta(1) + deltaTheta;
    theta(1) = inRange(theta(1)); %force theta to belong to [-pi,pi]    
    x(1) = x(1) + deltaX*cos(theta(1));
    y(1) = y(1) + deltaY*sin(theta(1));
    

    
    