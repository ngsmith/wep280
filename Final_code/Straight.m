function Straight(distance, power, r)
% robot drives on a straight line for a given distance with a given power

Ports = [MOTOR_B; MOTOR_C];  % motorports for left and right wheel

mB                    = NXTMotor(MOTOR_B);
mB.SpeedRegulation    = true;  % not for sync mode
mB.Power              = power;
mB.TachoLimit         = floor(360/(2*pi) * distance/r);%floor(l*angle);%
mB.ActionAtTachoLimit = 'coast';

mC                    = NXTMotor(MOTOR_C);
mC.SpeedRegulation    = true;  % not for sync mode
mC.Power              = power;
mC.TachoLimit         = floor(360/(2*pi) * distance/r);%floor(l*angle);%
mC.ActionAtTachoLimit = 'coast';

% send wheel configurations to NXT
mB.SendToNXT();
mC.SendToNXT();

% wait for wheels to stop
% mB.WaitFor();
% mC.WaitFor();
%    
% mB.Stop('off');
% mC.Stop('off');

% %% Get back to infinite rotation
% mStraight.TachoLimit = 0;


end