function [ sonarReadings ] = doRobotScan( currentPose, requestedReadings )

scanPower = 30;
scanRange = 60;
sonarMotor = NXTMotor(MOTOR_A);
ULTRASONIC_SENSOR_PORT = 3;
OpenUltrasonic( ULTRASONIC_SENSOR_PORT );

sonarMotor.Power=-10;
sonarMotor.TachoLimit=0;
sonarMotor.SendToNXT();
sonarMotor.SmoothStart = true;

done = false;
sonarReadings = [;];
while size(sonarReadings,1) < requestedReadings;
    motorInfo = sonarMotor.ReadFromNXT();
    if( motorInfo.Position > scanRange )
      sonarMotor.Power=-10;
      sonarMotor.SendToNXT();
    end
    if( motorInfo.Position < -scanRange )
      sonarMotor.Power=10;
      sonarMotor.SendToNXT();
    end
    theta = motorInfo.Position;
    theta = deg2rad( theta );
    theta = theta + currentPose(3);
    theta = inRange( theta );
    distance = GetUltrasonic( ULTRASONIC_SENSOR_PORT );
    reading = [distance theta ];
    sonarReadings(end+1,:) = reading;
end
sonarMotor.Stop('OFF');
 
end

