    %% compute new deltaX, deltaY, deltaTheta
    deltaX = (0.5*(deltaEncoder1 + deltaEncoder2)*(2*pi*r/360));
    deltaY = (0.5*(deltaEncoder1 + deltaEncoder2)*(2*pi*r/360));
    deltaTheta = ((deltaEncoder2-deltaEncoder1)*(2*pi*r/360)/(2*l));
    
    %% compute new pose x',y',theta', we still should not update x(1), y(1), theta(1)
    theta_prime = theta(1) + deltaTheta;
    theta_prime = inRange(theta_prime); %force theta to belong to [-pi,pi]    
    x_prime = x(1) + deltaX*cos(theta_prime)
    y_prime = y(1) + deltaY*sin(theta_prime)