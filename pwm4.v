module pwm4(clk,duty_cycle,pwm,ir);

input clk,ir;
input [7:0]duty_cycle;  
output reg pwm;

reg [7:0] counter;
reg [7:0] threshold;


always @(posedge clk) begin

	if (ir) pwm=0; 
	
	else begin 
 
	
	
  counter <= counter + 1;

  if (counter == 255) begin
    counter <= 0;
  end

  if (counter < duty_cycle) begin
    threshold <= 255;
  end else begin
    threshold <= 0;
  end

  if (counter < threshold) begin
    pwm <= 1;
  end else begin
    pwm <= 0;
  end
 end 
end

endmodule