clear Readings;
Reading_Number = 1;


mA.TachoLimit = 0; 
mA.Power = 10;
mA.SendToNXT();
mA_State= NXT_GetOutputState(MOTOR_A);
 
offset = 3;
    while( mA_State.RotationCount < 178 )  
            z = GetUltrasonic(3, h)+offset;
            if z < 255 && z>=0
            sensor_angle = (90 - mA_State.RotationCount ) /180 * 3.14159 ;
%             if(sensor_angle < 0) 
%                 sensor_angle = sensor_angle + 2* pi;
%             end
            Readings(Reading_Number,1:2) = [ sensor_angle  , z]
            Reading_Number = Reading_Number + 1;
            end
            mA_State= NXT_GetOutputState(MOTOR_A);
    end
    
mA.Power = -mA.Power;
mA.SendToNXT();
mA_State= NXT_GetOutputState(MOTOR_A);

    while( mA_State.RotationCount > 2 )   
            z = GetUltrasonic(3, h)++offset;
            if z < 255 && z>=0
            sensor_angle = (90 - mA_State.RotationCount ) /180 * 3.14159;
%             if(sensor_angle < 0) 
%                 sensor_angle = sensor_angle + 2* pi;
%             end
           Readings(Reading_Number,1:2) = [ sensor_angle  , z]
            Reading_Number = Reading_Number + 1;
            end
            mA_State= NXT_GetOutputState(MOTOR_A);
    end   

    
    mA.Stop('off');