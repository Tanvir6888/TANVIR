module pwm3(clk,pwm,tin,ir,led1,led2);

input clk,tin,ir; 
output reg led1,led2;
output reg pwm;


reg [7:0] counter;
reg [7:0] threshold;
reg [7:0] duty_cycle;

always @(posedge clk) begin

	if (ir) begin pwm=0; led1=1'b0; end 
	
	else begin 
 
	if(tin) begin
	 duty_cycle=180; led2=1'b1; led1=1'b1;  end
	else begin	duty_cycle=150; 
		 led1=1'b1; led2=1'b0;  end
	
  counter <= counter + 1;

  if (counter == 255) begin
    counter <= 0;
  end

  if (counter < duty_cycle) begin
    threshold <= 8'hFF;
  end else begin
    threshold <= 8'h00;
  end

  if (counter < threshold) begin
    pwm <= 1;
  end else begin
    pwm <= 0;
  end
 end 
end

endmodule