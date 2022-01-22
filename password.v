module password(access,alarm,in,reset);
parameter [31:0]pass = 'h1234abcd;
output access,alarm;						
input [31:0]in;
input reset;
reg access,alarm,condition;							
integer count;
initial begin 
	count = 0;
	access = 0;					
	alarm = 0;
	condition = 1;
end
always@(in,reset) begin
	if ((in==pass)&&(condition==1)) begin
		access = 1;
		condition = 0;
	end
	else if(condition==1) begin
		count = count+1;
	end
	if (count==4) begin
		alarm = 1;
		condition = 0;
	end
	if (reset==1) begin
		access = 0;
		alarm = 0;
		count = 0;
		condition = 1;
	end
end
endmodule
 