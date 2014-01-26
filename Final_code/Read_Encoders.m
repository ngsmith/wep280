 %%read encoders
   
    Encoder_B_a = NXT_GetOutputState(MOTOR_B);
    Encoder_C_a = NXT_GetOutputState(MOTOR_C);
    deltaEncoder1 = Encoder_B_a.RotationCount - Encoder_B_b.RotationCount;
    deltaEncoder2 = Encoder_C_a.RotationCount - Encoder_C_b.RotationCount;
    
 %Save encoder values for next loop
    Encoder_B_b = Encoder_B_a;
    Encoder_C_b = Encoder_C_a;