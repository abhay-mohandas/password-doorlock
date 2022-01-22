module testbench;
wire access,alarm;
reg [31:0]in;
reg reset;
password p0(access,alarm,in,reset);
initial begin
	$monitor($time," Access=%b,Alarm=%b,Input=%h,Reset=%b",access,alarm,in,reset);
end

initial begin
	#10 in='h12345678;	reset=0;
	#10 in='h14343542;
	#10 in='h1242adcb;
	#10 in='h1234abcd;
	#10 in='h14343542;
	#10 in='h12345678;	reset=1;
	#10 in='h12342378;	reset=0;
	#10 in='h1234abcd;
	#10 in='h12345678;
	#10 in='h12acfe38;	reset=1;
	#10 in='h12345678;	reset=0;
	#10 in='h1242adcb;
	#10 in='h1234abcd;	
	#10 $stop;
end
endmodule