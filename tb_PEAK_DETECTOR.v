
module tb_peak_detector;
reg clk;
reg rst;
reg [7:0]data_in;
wire peak;

peak_detector uut(
.clk(clk),
.rst(rst),
.data_in(data_in),
.peak(peak)
);

always #5 clk=~clk;


initial begin 
clk=0;
rst=1;
data_in=0;

#10 rst=0;

data_in = 12; #10;
data_in = 22; #10;
data_in = 16; #10;

data_in = 27; #10;
data_in = 32; #10;
data_in = 30; #10;

data_in = 04; #10;
data_in = 05; #10;
data_in = 03; #10;
#20 $finish;
end

initial begin
$display("Time\tdata_in\tpeak");
$monitor("%0t\t%d\t%b",$time,data_in,peak);
end

endmodule

