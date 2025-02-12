/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adderTest_11 (
    input clk,
    input rst,
    input button,
    output reg [7:0] checkoff,
    output reg [3:0] flag,
    output reg [15:0] s
  );
  
  
  
  wire [16-1:0] M_fa_s;
  wire [1-1:0] M_fa_z;
  wire [1-1:0] M_fa_v;
  wire [1-1:0] M_fa_n;
  reg [16-1:0] M_fa_x;
  reg [16-1:0] M_fa_y;
  reg [6-1:0] M_fa_op;
  sixteen_bit_full_adder_17 fa (
    .x(M_fa_x),
    .y(M_fa_y),
    .op(M_fa_op),
    .s(M_fa_s),
    .z(M_fa_z),
    .v(M_fa_v),
    .n(M_fa_n)
  );
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_9 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  reg [7:0] M_checkoff_reg_d, M_checkoff_reg_q = 1'h0;
  reg [3:0] M_flag_reg_d, M_flag_reg_q = 1'h0;
  reg [15:0] M_s_reg_d, M_s_reg_q = 1'h0;
  localparam START_testCase = 3'd0;
  localparam PPP_testCase = 3'd1;
  localparam PNN_testCase = 3'd2;
  localparam P00_testCase = 3'd3;
  localparam PPV_testCase = 3'd4;
  localparam ERR_testCase = 3'd5;
  localparam END_testCase = 3'd6;
  localparam ERROR_STATE_testCase = 3'd7;
  
  reg [2:0] M_testCase_d, M_testCase_q = START_testCase;
  
  localparam PPP_X = 16'h5e94;
  
  localparam PPP_ALUFN = 6'h00;
  
  localparam PPP_Y = 16'h132f;
  
  localparam PPP_S = 16'h71c3;
  
  localparam PPP_Z = 1'h0;
  
  localparam PPP_V = 1'h0;
  
  localparam PPP_N = 1'h0;
  
  localparam PNN_X = 16'h000f;
  
  localparam PNN_ALUFN = 6'h00;
  
  localparam PNN_Y = 16'hffec;
  
  localparam PNN_S = 16'hfffb;
  
  localparam PNN_Z = 1'h0;
  
  localparam PNN_V = 1'h0;
  
  localparam PNN_N = 1'h1;
  
  localparam P00_X = 1'h0;
  
  localparam P00_ALUFN = 6'h00;
  
  localparam P00_Y = 1'h0;
  
  localparam P00_S = 1'h0;
  
  localparam P00_Z = 1'h1;
  
  localparam P00_V = 1'h0;
  
  localparam P00_N = 1'h0;
  
  localparam PPV_X = 16'h0001;
  
  localparam PPV_ALUFN = 6'h00;
  
  localparam PPV_Y = 16'h7fff;
  
  localparam PPV_S = 16'h8000;
  
  localparam PPV_Z = 1'h0;
  
  localparam PPV_V = 1'h1;
  
  localparam PPV_N = 1'h1;
  
  localparam ERR_X = 16'h0001;
  
  localparam ERR_ALUFN = 6'h00;
  
  localparam ERR_Y = 16'h0001;
  
  localparam ERR_S = 16'h000f;
  
  localparam ERR_Z = 1'h1;
  
  localparam ERR_V = 1'h1;
  
  localparam ERR_N = 1'h1;
  
  always @* begin
    M_testCase_d = M_testCase_q;
    M_flag_reg_d = M_flag_reg_q;
    M_s_reg_d = M_s_reg_q;
    M_checkoff_reg_d = M_checkoff_reg_q;
    
    checkoff = M_checkoff_reg_q;
    flag = M_flag_reg_q;
    s = M_s_reg_q;
    M_fa_x = 1'h0;
    M_fa_y = 1'h0;
    M_fa_op = 1'h0;
    M_edge_detector_in = button;
    
    case (M_testCase_q)
      START_testCase: begin
        M_flag_reg_d = 8'h00;
        M_s_reg_d = 16'hadd0;
        M_checkoff_reg_d = 16'h0000;
        if (M_edge_detector_out == 1'h1) begin
          M_testCase_d = PPP_testCase;
        end
      end
      PPP_testCase: begin
        M_fa_x = 16'h5e94;
        M_fa_y = 16'h132f;
        M_fa_op = 6'h00;
        M_checkoff_reg_d[7+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h0);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h0);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'h71c3);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'h71c3 & M_fa_z == 1'h0 & M_fa_n == 1'h0 & M_fa_v == 1'h0) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = PNN_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      PNN_testCase: begin
        M_fa_x = 16'h000f;
        M_fa_y = 16'hffec;
        M_fa_op = 6'h00;
        M_checkoff_reg_d[6+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h0);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'hfffb);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'hfffb & M_fa_z == 1'h0 & M_fa_n == 1'h1 & M_fa_v == 1'h0) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = P00_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      P00_testCase: begin
        M_fa_x = 1'h0;
        M_fa_y = 1'h0;
        M_fa_op = 6'h00;
        M_checkoff_reg_d[5+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h1);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h0);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h0);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 1'h0);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 1'h0 & M_fa_z == 1'h1 & M_fa_n == 1'h0 & M_fa_v == 1'h0) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = PPV_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      PPV_testCase: begin
        M_fa_x = 16'h0001;
        M_fa_y = 16'h7fff;
        M_fa_op = 6'h00;
        M_checkoff_reg_d[4+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h1);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'h8000);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'h8000 & M_fa_z == 1'h0 & M_fa_n == 1'h1 & M_fa_v == 1'h1) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = ERR_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      ERR_testCase: begin
        M_fa_x = 16'h0001;
        M_fa_y = 16'h0001;
        M_fa_op = 6'h00;
        M_checkoff_reg_d[3+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h1);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h1);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'h000f);
        M_s_reg_d = 16'hdead;
        if (M_fa_s == 16'h000f & M_fa_z == 1'h1 & M_fa_n == 1'h1 & M_fa_v == 1'h1) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = ERR_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      ERROR_STATE_testCase: begin
        if (M_edge_detector_out == 1'h1) begin
          M_testCase_d = END_testCase;
        end
      end
      END_testCase: begin
        M_flag_reg_d = 8'hff;
        M_checkoff_reg_d = 8'hff;
        M_s_reg_d = 16'hc001;
        s = M_s_reg_q;
        flag = M_flag_reg_q;
        checkoff = M_checkoff_reg_q;
        if (M_edge_detector_out == 1'h1) begin
          M_testCase_d = START_testCase;
        end
      end
    endcase
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
      M_checkoff_reg_q <= 1'h0;
    end else begin
      M_checkoff_reg_q <= M_checkoff_reg_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_testCase_q <= 1'h0;
    end else begin
      M_testCase_q <= M_testCase_d;
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
