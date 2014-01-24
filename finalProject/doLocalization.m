function [ currentLocation ] = doLocalization( input_args )
        
        
        % scan with sonar -> get samples
        sonarSamples = pingRoom();
        probabilites = applyMeasurementModel( sonarSamples );
        normalizeProbabilities( probabilites );
        
        X = [  x, y, theta, prob ];
        X = datasample(X(2:100,:),99,'Weights',X(2:100,4)); 
        
        x(2:100) = X(2:100,1);
        y(2:100) = X(2:100,2);
        theta(2:100) = X(2:100,3);
        
        % fit sistributions
        pdx = fitdist(x(2:100)','Normal');
        pdy = fitdist(y(2:100)','Normal');
        pdtheta = fitdist(theta(2:100)','Normal');
        
        x(1) = pdx.mu;
        y(1) = pdx.mu;
        theta(1) = pdTheta.mu;


end

