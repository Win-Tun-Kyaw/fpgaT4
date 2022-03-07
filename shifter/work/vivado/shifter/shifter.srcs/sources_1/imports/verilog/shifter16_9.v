/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter16_9 (
    input [15:0] x,
    input [15:0] y,
    input [5:0] op,
    output reg [15:0] s
  );
  
  
  
  always @* begin
    s = x;
    
    case (op[0+1-:2])
      1'h0: begin
        s = x << y[0+3-:4];
      end
      1'h1: begin
        s = x >> y[0+3-:4];
      end
      2'h3: begin
        s = $signed(x) >>> y[0+3-:4];
      end
    endcase
  end
endmodule
