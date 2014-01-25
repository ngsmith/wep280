function [ correctedPose ] = performLocalization( currentPose, samples, mapImage )
    
    deltaX = 0;
    deltaY = 0;
    %deltaTheta = 1*pi/16;
    deltaTheta = 0;
    
    [samples(:,1), samples(:,3), samples(:,3)] = ...
        motionModel( samples(:,1), samples(:,2), samples(:,3), deltaX, deltaY, deltaTheta); 
    
    % set the new positon: really just old position + deltas
    newPoseFromMotionModel(1:3) = samples(1,1:3);
    sonarResults = getMockSonarResults( mapImage, newPoseFromMotionModel, pi, pi, 1 );
    
    weights = calculateWeights( samples, sonarResults, mapImage );
   
    samples(:,4) = weights.';
    
    
    % need mcl to finalize correctedPose
    correctedPose = newPoseFromMotionModel;  % hack for now
end

