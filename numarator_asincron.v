//implementarea unui numarator asincron crescator modulo 4 cu bistabile de tip D

module dff_ar (
input d, clk, rst_b,
output reg q,
output qn
);
always @ (posedge clk, negedge rst_b) begin
if (!rst_b) q <= 1'b0;
 else q <= d;
end

assign qn = ~q;

endmodule

module numarator (
    input clk,
    input rst_b,
    output [2:0] out
);

wire q0;
wire qn0;
wire q1;
wire qn1;

dff_ar dff0(.d(qn0),
            .clk(clk),
            .rst_b(rst_b),
            .q(q0),
            .qn(qn0));

dff_ar dff1(.d(qn1),
            .clk(clk),
            .rst_b(rst_b),
            .q(q1),
            .qn(qn1));

assign out = {qn1, qn0};

endmodule