function [ outX, outY, outTheta ] = motionModel( x, y, theta, deltaX, deltaY, deltaTheta, numSamples )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    % Rotational alphas
    a1 = 0.01;
    a2 = 0.01;
    % Translational alphas
    a3 = 0.01;
    a4 = 0.01;


    %% compute new pose x',y',theta', we still should not update x(1), y(1), theta(1)
    theta_prime = theta(1) + deltaTheta;
    theta_prime = inRange(theta_prime); %force theta to belong to [-pi,pi]    
    x_prime = x(1) - deltaX*cos(theta_prime);
    y_prime = y(1) - deltaY*sin(theta_prime);
    
    for i = 2:numSamples
        dr1 = atan2(y_prime - y(1), x_prime - x(1)) - theta(1);
        dtr = sqrt((y(1) - y_prime)^2 + (x(1)- x_prime)^2);
        dr2 = theta_prime - theta(1) - dr1;
 
        dr1_h = dr1 - mysample(abs(a1*dr1 + a2*dtr));
        dtr_h = dtr - mysample(abs(a3*dtr + a4*(dr1+dr2)));
        dr2_h = dr2 - mysample(abs(a1*dr2 + a2*dtr));
       
        x(i) = x(i) + dtr_h*cos(inRange(theta(i)+dr1_h));
        
        y(i) = y(i) + dtr_h*sin(inRange(theta(i)+dr1_h));
        theta(i) = inRange(theta(i) + (dr1_h + dr2_h)); 
        
%        plot(-x(i), -y (i))
    end
    
    % compute new pose x(1),y(1),theta(1)
    % never forget that x(1) = final - current position, and a positive change in current
    % position is a NEGATIVE change in delta x(1)
    theta(1) = theta(1) + deltaTheta;
    theta(1) = inRange(theta(1)); %force theta(1) to belong to [-pi,pi]
    x(1) = x(1) - deltaX*cos(theta(1));
    y(1) = y(1) - deltaY*sin(theta(1));
    
    outX = x;
    outY = y;
    outTheta = theta;
end

