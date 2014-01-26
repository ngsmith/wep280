function rotate(angle_rad,power,l,r)
% robot will rotate a given angle about its center of gravity at a given speed
if angle_rad < 0 
    power = -power;
end

angle_rad = abs(angle_rad);
%% Initialize motor-objects:
mB                    = NXTMotor(MOTOR_B);
mB.SpeedRegulation    = true;  % not for sync mode
mB.Power              = -power;
mB.TachoLimit         = floor(360*((l*angle_rad)/(2*pi*r)));%floor(l*angle);%
mB.ActionAtTachoLimit = 'coast';

mC                    = NXTMotor(MOTOR_C);
mC.SpeedRegulation    = true;  % not for sync mode
mC.Power              = power;
mC.TachoLimit         = floor(360*((l*angle_rad)/(2*pi*r)));%floor(l*angle);%
mC.ActionAtTachoLimit = 'coast';

% send wheel configurations to NXT
mB.SendToNXT();
mC.SendToNXT();

% % wait for wheels to stop
% mB.WaitFor();
% mC.WaitFor();
%    
% mB.Stop('off');
% mC.Stop('off');


% %% Get back to infinite rotation
% mB.TachoLimit = 0;
% mC.TachoLimit = 0;
% send wheel configurations to NXT
% mB.SendToNXT();
% mC.SendToNXT();

end