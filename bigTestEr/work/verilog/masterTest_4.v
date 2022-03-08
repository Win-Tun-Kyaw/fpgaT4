/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module masterTest_4 (
    input clk,
    input rst,
    input button,
    output reg [13:0] checkoff,
    output reg [15:0] s,
    output reg [3:0] flag
  );
  
  
  
  wire [1-1:0] M_nextMod_out;
  reg [1-1:0] M_nextMod_in;
  edge_detector_9 nextMod (
    .clk(clk),
    .in(M_nextMod_in),
    .out(M_nextMod_out)
  );
  reg [13:0] M_checkoff_reg_d, M_checkoff_reg_q = 1'h0;
  reg [3:0] M_flag_reg_d, M_flag_reg_q = 1'h0;
  reg [15:0] M_s_reg_d, M_s_reg_q = 1'h0;
  wire [8-1:0] M_addertest_checkoff;
  wire [4-1:0] M_addertest_flag;
  wire [16-1:0] M_addertest_s;
  addertest_10 addertest (
    .clk(clk),
    .rst(rst),
    .checkoff(M_addertest_checkoff),
    .flag(M_addertest_flag),
    .s(M_addertest_s)
  );
  wire [16-1:0] M_shifterTest_out;
  wire [14-1:0] M_shifterTest_checkoff;
  wire [1-1:0] M_shifterTest_flag;
  wire [16-1:0] M_shifterTest_s;
  shifterTest_11 shifterTest (
    .clk(clk),
    .rst(rst),
    .out(M_shifterTest_out),
    .checkoff(M_shifterTest_checkoff),
    .flag(M_shifterTest_flag),
    .s(M_shifterTest_s)
  );
  localparam START_selectModCase = 2'd0;
  localparam ADD_selectModCase = 2'd1;
  localparam SHIFT_selectModCase = 2'd2;
  localparam END_selectModCase = 2'd3;
  
  reg [1:0] M_selectModCase_d, M_selectModCase_q = START_selectModCase;
  
  always @* begin
    M_selectModCase_d = M_selectModCase_q;
    M_flag_reg_d = M_flag_reg_q;
    M_s_reg_d = M_s_reg_q;
    M_checkoff_reg_d = M_checkoff_reg_q;
    
    M_nextMod_in = button;
    s = M_s_reg_q;
    flag = M_flag_reg_q;
    checkoff = M_checkoff_reg_q;
    
    case (M_selectModCase_q)
      START_selectModCase: begin
        flag = 8'h00;
        checkoff = 8'h00;
        s = 16'h57a7;
        M_flag_reg_d = 8'h00;
        M_s_reg_d = 16'h57a7;
        M_checkoff_reg_d = 16'h0000;
        if (M_nextMod_out == 1'h1) begin
          M_selectModCase_d = ADD_selectModCase;
        end
      end
      ADD_selectModCase: begin
        M_s_reg_d = M_addertest_s;
        M_flag_reg_d[3+0-:1] = M_addertest_flag[0+0-:1];
        M_flag_reg_d[0+2-:3] = M_addertest_flag[1+2-:3];
        M_checkoff_reg_d = M_addertest_checkoff;
        if (M_addertest_checkoff == 7'h7f) begin
          if (M_nextMod_out == 1'h1) begin
            M_selectModCase_d = SHIFT_selectModCase;
          end
        end
      end
      SHIFT_selectModCase: begin
        M_s_reg_d = M_shifterTest_s;
        M_flag_reg_d[3+0-:1] = M_shifterTest_flag;
        M_checkoff_reg_d = M_shifterTest_checkoff;
        if (M_addertest_checkoff == 14'h3fff) begin
          if (M_nextMod_out == 1'h1) begin
            M_selectModCase_d = END_selectModCase;
          end
        end
      end
      END_selectModCase: begin
        M_s_reg_d = 16'hc001;
        M_flag_reg_d[3+0-:1] = 3'h7;
        M_checkoff_reg_d = 16'hffff;
        if (M_nextMod_out == 1'h1) begin
          M_selectModCase_d = START_selectModCase;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_checkoff_reg_q <= 1'h0;
    end else begin
      M_checkoff_reg_q <= M_checkoff_reg_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_flag_reg_q <= 1'h0;
    end else begin
      M_flag_reg_q <= M_flag_reg_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_selectModCase_q <= 1'h0;
    end else begin
      M_selectModCase_q <= M_selectModCase_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_s_reg_q <= 1'h0;
    end else begin
      M_s_reg_q <= M_s_reg_d;
    end
  end
  
endmodule
