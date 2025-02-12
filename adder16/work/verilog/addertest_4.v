/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module addertest_4 (
    input clk,
    input rst,
    input button,
    input endbutton,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n,
    output reg [7:0] checkoff,
    output reg [7:0] flag,
    output reg [15:0] s
  );
  
  
  
  wire [16-1:0] M_fa_s;
  wire [1-1:0] M_fa_z;
  wire [1-1:0] M_fa_v;
  wire [1-1:0] M_fa_n;
  reg [16-1:0] M_fa_x;
  reg [16-1:0] M_fa_y;
  reg [6-1:0] M_fa_op;
  sixteen_bit_full_adder_9 fa (
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
  edge_detector_10 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [1-1:0] M_end_detector_out;
  reg [1-1:0] M_end_detector_in;
  edge_detector_10 end_detector (
    .clk(clk),
    .in(M_end_detector_in),
    .out(M_end_detector_out)
  );
  reg [7:0] M_checkoff_reg_d, M_checkoff_reg_q = 1'h0;
  reg [7:0] M_flag_reg_d, M_flag_reg_q = 1'h0;
  reg [15:0] M_s_reg_d, M_s_reg_q = 1'h0;
  localparam START_testCase = 4'd0;
  localparam PPP_testCase = 4'd1;
  localparam PPN_testCase = 4'd2;
  localparam PNN_testCase = 4'd3;
  localparam PPV_testCase = 4'd4;
  localparam PNV_testCase = 4'd5;
  localparam PP0_testCase = 4'd6;
  localparam ERR_testCase = 4'd7;
  localparam END_testCase = 4'd8;
  localparam ERROR_STATE_testCase = 4'd9;
  
  reg [3:0] M_testCase_d, M_testCase_q = START_testCase;
  
  localparam PPP_X = 16'h5e94;
  
  localparam PPP_ALUFN = 6'h00;
  
  localparam PPP_Y = 16'h132f;
  
  localparam PPP_S = 16'h71c3;
  
  localparam PPP_Z = 1'h0;
  
  localparam PPP_V = 1'h0;
  
  localparam PPP_N = 1'h0;
  
  localparam PPN_X = 16'h1a4d;
  
  localparam PPN_ALUFN = 6'h01;
  
  localparam PPN_Y = 16'h34ff;
  
  localparam PPN_S = 16'he54e;
  
  localparam PPN_Z = 1'h0;
  
  localparam PPN_V = 1'h0;
  
  localparam PPN_N = 1'h1;
  
  localparam PNN_X = 16'h2ff3;
  
  localparam PNN_ALUFN = 6'h00;
  
  localparam PNN_Y = 16'h9f22;
  
  localparam PNN_S = 16'hcf15;
  
  localparam PNN_Z = 1'h0;
  
  localparam PNN_V = 1'h0;
  
  localparam PNN_N = 1'h1;
  
  localparam PPV_X = 16'h0001;
  
  localparam PPV_ALUFN = 5'h00;
  
  localparam PPV_Y = 16'h7fff;
  
  localparam PPV_S = 16'h8000;
  
  localparam PPV_Z = 1'h0;
  
  localparam PPV_V = 1'h1;
  
  localparam PPV_N = 1'h1;
  
  localparam PNV_X = 16'h8000;
  
  localparam PNV_ALUFN = 6'h01;
  
  localparam PNV_Y = 16'h0001;
  
  localparam PNV_S = 16'h7fff;
  
  localparam PNV_Z = 1'h0;
  
  localparam PNV_V = 1'h1;
  
  localparam PNV_N = 1'h0;
  
  localparam PP0_X = 16'h0001;
  
  localparam PP0_ALUFN = 6'h01;
  
  localparam PP0_Y = 16'h0001;
  
  localparam PP0_S = 16'h0000;
  
  localparam PP0_Z = 1'h1;
  
  localparam PP0_V = 1'h0;
  
  localparam PP0_N = 1'h0;
  
  localparam ERR_X = 16'h0001;
  
  localparam ERR_ALUFN = 6'h00;
  
  localparam ERR_Y = 16'h0001;
  
  localparam ERR_S = 16'hffff;
  
  localparam ERR_Z = 1'h1;
  
  localparam ERR_V = 1'h1;
  
  localparam ERR_N = 1'h1;
  
  always @* begin
    M_testCase_d = M_testCase_q;
    M_flag_reg_d = M_flag_reg_q;
    M_s_reg_d = M_s_reg_q;
    M_checkoff_reg_d = M_checkoff_reg_q;
    
    out = 16'habcd;
    v = M_fa_v;
    n = M_fa_n;
    z = M_fa_z;
    checkoff = M_checkoff_reg_q;
    flag = M_flag_reg_q;
    s = M_s_reg_q;
    out = 1'h0;
    M_fa_x = 1'h0;
    M_fa_y = 1'h0;
    M_fa_op = 1'h0;
    M_edge_detector_in = button;
    M_end_detector_in = endbutton;
    
    case (M_testCase_q)
      START_testCase: begin
        flag = 8'h00;
        checkoff = 8'h00;
        s = 16'h0000;
        M_flag_reg_d = 8'h00;
        M_s_reg_d = 16'h0000;
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
            M_testCase_d = PPN_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      PPN_testCase: begin
        M_fa_x = 16'h1a4d;
        M_fa_y = 16'h34ff;
        M_fa_op = 6'h01;
        M_checkoff_reg_d[6+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h0);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'he54e);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'he54e & M_fa_z == 1'h0 & M_fa_n == 1'h1 & M_fa_v == 1'h0) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = PNN_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      PNN_testCase: begin
        M_fa_x = 16'h2ff3;
        M_fa_y = 16'h9f22;
        M_fa_op = 6'h00;
        M_checkoff_reg_d[5+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h0);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'hcf15);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'hcf15 & M_fa_z == 1'h0 & M_fa_n == 1'h1 & M_fa_v == 1'h0) begin
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
        M_fa_op = 5'h00;
        M_checkoff_reg_d[4+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h1);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'h8000);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'h8000 & M_fa_z == 1'h0 & M_fa_n == 1'h1 & M_fa_v == 1'h1) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = PNV_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      PNV_testCase: begin
        M_fa_x = 16'h8000;
        M_fa_y = 16'h0001;
        M_fa_op = 6'h01;
        M_checkoff_reg_d[3+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h0);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h1);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h0);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'h7fff);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'h7fff & M_fa_z == 1'h0 & M_fa_n == 1'h0 & M_fa_v == 1'h1) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = PP0_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      PP0_testCase: begin
        M_fa_x = 16'h0001;
        M_fa_y = 16'h0001;
        M_fa_op = 6'h01;
        M_checkoff_reg_d[2+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h1);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h0);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h0);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'h0000);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'h0000 & M_fa_z == 1'h1 & M_fa_n == 1'h0 & M_fa_v == 1'h0) begin
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
        M_checkoff_reg_d[1+0-:1] = 1'h1;
        M_flag_reg_d[3+0-:1] = (M_fa_z != 1'h1);
        M_flag_reg_d[2+0-:1] = (M_fa_v != 1'h1);
        M_flag_reg_d[1+0-:1] = (M_fa_n != 1'h1);
        M_flag_reg_d[0+0-:1] = (M_fa_s != 16'hffff);
        M_s_reg_d = M_fa_s;
        if (M_fa_s == 16'hffff & M_fa_z == 1'h1 & M_fa_n == 1'h1 & M_fa_v == 1'h1) begin
          if (M_edge_detector_out == 1'h1) begin
            M_testCase_d = END_testCase;
          end
        end else begin
          M_testCase_d = ERROR_STATE_testCase;
        end
      end
      ERROR_STATE_testCase: begin
        if (M_edge_detector_out == 1'h1) begin
          M_testCase_d = START_testCase;
        end else begin
          if (M_end_detector_out == 1'h1) begin
            M_testCase_d = END_testCase;
          end
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
      M_s_reg_q <= 1'h0;
    end else begin
      M_s_reg_q <= M_s_reg_d;
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
      M_testCase_q <= 1'h0;
    end else begin
      M_testCase_q <= M_testCase_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_checkoff_reg_q <= 1'h0;
    end else begin
      M_checkoff_reg_q <= M_checkoff_reg_d;
    end
  end
  
endmodule
