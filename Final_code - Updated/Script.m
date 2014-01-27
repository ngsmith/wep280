% %% Feedback Control
% clc
% clear all
% COM_CloseNXT all
% close all

poseInitial = [13 ; 65 ; 0];
Initialize
localize = 1;

% Targets = [ 40 40;...
%     60 60;...
%     60 80;...
%     90 80;...
%     20 20;];

Targets = [62 118;...
    90 145;...
    108 124;...
    140 120;...
    141 84;...
    150 40];
Names = [1;2;3;4;5];
plot(Targets(:,1), Targets(:,2),'go'); 
text(Targets(:,1), Targets(:,2), num2str(Names), 'VerticalAlignment','bottom','HorizontalAlignment','right');

Get_readings

Target_number = 1;
while Target_number<=length(Targets)

Goal = Targets(Target_number,:);

angle_to_rotate = atan2(Targets(Target_number,2)-y(1), Targets(Target_number,1)-x(1))- theta(1);

rotate(angle_to_rotate,10,5.7,2.7)
Encoder_B_a = NXT_GetOutputState(MOTOR_B)

while(Encoder_B_a. RunStateByte ~= 0)
    Read_Encoders;
    Xprime;
    Motion_measurement_model;
end

mB.Stop('off');
mC.Stop('off');

distance_to_travel = sqrt((x(1) - Targets(Target_number,1))^2 + (y(1) - Targets(Target_number,2))^2);
Straight(distance_to_travel, 20, 2.7);
Encoder_B_a = NXT_GetOutputState(MOTOR_B);
while(Encoder_B_a. RunStateByte ~= 0)
    Read_Encoders;
    Xprime;
    Motion_measurement_model;
    plot(x(1),y(1),'.b');
    drawnow
    distanceBorder = GetUltrasonic(3, h)+3
    if(distanceBorder < 25 && distanceBorder > 0)
        'distance to low'
        break
    end
end

%% Measurement model

if(localize == 1)
     mB.Stop('off');
     mC.Stop('off');
     Get_readings
     
     
     
     
 for i = 2:100
    if(x(i) >=0 && x(i) < size(map_bw,2) && y(i) >=0 && y(i) < size(map_bw,1) )
        %Call measurement model, gives probability
        output = measurement_model(x(i), y(i), Readings(:,1)+theta(i), Readings(:,2), map_bw);
        %Save probability and state
        prob(i) = output(1);
        myX(i,1:4) = [x(i),y(i),theta(i),prob(i)];
        % Plotting
        if mod(m,2) == 0
            plot(x(i), y(i),'r');
        else
            plot(x(i), y(i),'g');
        end
    else
        myX(i,1:4) = [x(i),y(i),theta(i),0];
    end
 end
    Calculate_probabilities;
    x(1) = pdx.mu;
    y(1) = pdy.mu;
    theta(1) = pdtheta.mu;
    %plot(x(1),x(2),'.w','MarkerSize', 10);
    %localize = 0; 
   
end

    tolerance = 5;
    if(abs(x(1)-Goal(1)) < tolerance && abs(y(1)-Goal(2)) < tolerance)
        targetReached = true;
    else targetReached = false;
    end

if(targetReached)
    Target_number = Target_number+1
end


end



% tic;
% 
% while ~targetReached
%     
%     
%     if( floor(mod(toc,9)) == 8 )
%         localize = 0;
%     end
%     
%     if localize == 1
%         mB.Stop('off');
%         mC.Stop('off');
%         Get_readings
%         tic;
%     end
%     
%     %%send new speeds to NXT
%     Closed_loop_control_Monte_Carlo_mainloop
%     
%     drawnow;
%     
% end
% 
% Closed_loop_control_Monte_Carlo_end_connections