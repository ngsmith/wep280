%% Normalize probabilities and Plot
    for b = 1:1
    Normalizer = sum(myX(2:100,4));
    myX(2:100,4) = myX(2:100,4) ./ Normalizer; %%Normalized
    if myX(2:100) ~= 0
      newX = datasample(myX(2:100,:),99,'Weights',myX(2:100,4));  
      myX(2:100,:)=newX;
    else 
      myX(2:100,:) = 1/99;
    end
    
    
    end
    
    x(2:100) = myX(2:100,1);
    y(2:100) = myX(2:100,2);
    theta(2:100) = myX(2:100,3);
    
    pdx = fitdist(x(2:100)','Normal');
    pdy = fitdist(y(2:100)','Normal');
    pdtheta = fitdist(theta(2:100)','Normal');
    probX= pdx.mu;
    probY = pdy.mu;
    plot(probX,probY, '.w','MarkerSize', 12);
    
    ang=0:0.01:2*pi; 
    xp=pdx.sigma*cos(ang)*1;
    yp=pdy.sigma*sin(ang)*1;
    plot(probX+xp,probY+yp,'w');