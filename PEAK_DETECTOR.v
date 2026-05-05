module peak_detector(
input clk,
input rst,
input[7:0] data_in,
output reg peak);
reg [7:0] prev;
reg [7:0] curr;

always @(posedge clk or posedge rst) begin
if (rst) begin

prev<=0;
curr<=0;
peak<=0;

end else begin
//peak dectection
if((curr > prev) && (curr>data_in))
peak<=1;
else
peak <= 0;

prev <= curr;
curr <= data_in;
end
end

endmodule




















