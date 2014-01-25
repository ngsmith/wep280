function [ sonarReadings ] = doRobotScan( requestedReadings )

scanPower = 30;

sonarMotor = NXTMotor(MOTOR_A);
ULTRASONIC_SENSOR_PORT = 3;
OpenUltrasonic( ULTRASONIC_SENSOR_PORT );

% sonarMotorCCW.SpeedRegulation   = false;  % not for sync mode
% sonarMotorCCW.TachoLimit        = 90 * ;
% sonarMotor.SmoothStart       = true;
% sonarMotor.Power=10;
% sonarMotor.SendToNXT();
% sonarMotor.WaitFor();

sonarMotor.Power=-10;
sonarMotor.TachoLimit=0;
sonarMotor.SendToNXT();
sonarMotor.SmoothStart = true;

done = false;
sonarReadings = [;];
while size(sonarReadings,1) < requestedReadings;
    motorInfo = sonarMotor.ReadFromNXT();
    if( motorInfo.Position > 180 )
      sonarMotor.Power=-10;
      sonarMotor.SendToNXT();
    end
    if( motorInfo.Position < -180 )
      sonarMotor.Power=10;
      sonarMotor.SendToNXT();
    end
    motorInfo.Position;
    distance = GetUltrasonic( ULTRASONIC_SENSOR_PORT );
    reading = [distance motorInfo.Position]
    sonarReadings(end+1,:) = reading;
end
sonarMotor.Stop('OFF');
 
end

