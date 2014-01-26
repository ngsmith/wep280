clear Readings;
Reading_Number = 1;



mA_State= NXT_GetOutputState(MOTOR_A);
            theta1tick = (pi);
            phi = l*theta1tick/r;
            tacho = 360 * phi / (2 * pi);
            tacho = floor(tacho);
            
            mA.TachoLimit = tacho; 
            mA.Power = 5;
            mA.SendToNXT();
            %mA.WaitFor();
            %mA.Stop('off');
            m = m+1;
offset = 3;
%m = 1;
    while( Reading_Number < 178 ) 
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
            if(mA_State.RotationCount == 180)
                mA.Power = mA.Power * -1;
            end
 

          
    end
%     
% mA.Power = -mA.Power;
% mA.SendToNXT();
% mA_State= NXT_GetOutputState(MOTOR_A);
% 
%     while( mA_State.RotationCount > 2 )   
%             z = GetUltrasonic(3, h)++offset;
%             if z < 255 && z>=0
%             sensor_angle = (90 - mA_State.RotationCount ) /180 * 3.14159;
% %             if(sensor_angle < 0) 
% %                 sensor_angle = sensor_angle + 2* pi;
% %             end
%            Readings(Reading_Number,1:2) = [ sensor_angle  , z]
%             Reading_Number = Reading_Number + 1;
%             end
%             mA_State= NXT_GetOutputState(MOTOR_A);
%     end   

    
    mA.Stop('off');