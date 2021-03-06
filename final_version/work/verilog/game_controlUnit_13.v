/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_controlUnit_13 (
    input clk,
    input rst,
    input [8:0] button,
    input clear_button,
    input pass_button,
    input reset_button,
    input z,
    input [15:0] t,
    input toggle,
    output reg we,
    output reg [3:0] wdsel,
    output reg [2:0] asel,
    output reg [2:0] bsel,
    output reg [5:0] alufn,
    output reg [15:0] wr,
    output reg [15:0] button_sig,
    output reg increase,
    output reg time_show,
    output reg time_froze
  );
  
  
  
  
  localparam PREPARE_game_fsm = 6'd0;
  localparam START_game_fsm = 6'd1;
  localparam SET_PATTERN_game_fsm = 6'd2;
  localparam RESET_SCORE_game_fsm = 6'd3;
  localparam RESET_LEVEL_game_fsm = 6'd4;
  localparam SET_DECREMENT_TIMER_game_fsm = 6'd5;
  localparam IDLE_game_fsm = 6'd6;
  localparam CLEAR_BOARD_game_fsm = 6'd7;
  localparam GENERATE_PATTERN_game_fsm = 6'd8;
  localparam ADD_LEVEL_game_fsm = 6'd9;
  localparam CHECK_LEVEL_game_fsm = 6'd10;
  localparam CHECK_LEVEL_TRANS_game_fsm = 6'd11;
  localparam CHECK_PATTERN_game_fsm = 6'd12;
  localparam ADD_SCORE_game_fsm = 6'd13;
  localparam UPDATE_STATE1_game_fsm = 6'd14;
  localparam UPDATE_STATE2_game_fsm = 6'd15;
  localparam UPDATE_STATE3_game_fsm = 6'd16;
  localparam UPDATE_STATE4_game_fsm = 6'd17;
  localparam UPDATE_STATE5_game_fsm = 6'd18;
  localparam UPDATE_STATE6_game_fsm = 6'd19;
  localparam UPDATE_STATE7_game_fsm = 6'd20;
  localparam UPDATE_STATE8_game_fsm = 6'd21;
  localparam UPDATE_STATE9_game_fsm = 6'd22;
  localparam UPDATE_TRANS_game_fsm = 6'd23;
  localparam CHECK_TIME_game_fsm = 6'd24;
  localparam DECRESE_GAME_TIMER_game_fsm = 6'd25;
  localparam LOSE_PATTERN1_game_fsm = 6'd26;
  localparam LOSE_PATTERN2_game_fsm = 6'd27;
  localparam LOSE_PATTERN3_game_fsm = 6'd28;
  localparam LOSE_PATTERN4_game_fsm = 6'd29;
  localparam LOSE_PATTERN5_game_fsm = 6'd30;
  localparam LOSE_PATTERN6_game_fsm = 6'd31;
  localparam CHECKWINLOSE_game_fsm = 6'd32;
  localparam WIN_PATTERN1_game_fsm = 6'd33;
  localparam WIN_PATTERN2_game_fsm = 6'd34;
  localparam WIN_PATTERN3_game_fsm = 6'd35;
  localparam WIN_PATTERN4_game_fsm = 6'd36;
  localparam WIN_PATTERN5_game_fsm = 6'd37;
  localparam WIN_PATTERN6_game_fsm = 6'd38;
  localparam WIN_PATTERN7_game_fsm = 6'd39;
  localparam WIN_PATTERN8_game_fsm = 6'd40;
  localparam WIN_PATTERN9_game_fsm = 6'd41;
  localparam CHECKWINLOSE_TRANS_game_fsm = 6'd42;
  localparam GAMEOVER_game_fsm = 6'd43;
  
  reg [5:0] M_game_fsm_d, M_game_fsm_q = PREPARE_game_fsm;
  
  always @* begin
    M_game_fsm_d = M_game_fsm_q;
    
    we = 1'h0;
    wdsel = 3'h0;
    asel = 3'h0;
    bsel = 3'h0;
    alufn = 6'h00;
    wr = 16'h0000;
    button_sig = 16'h0000;
    increase = 1'h0;
    time_show = 1'h1;
    time_froze = 1'h0;
    
    case (M_game_fsm_q)
      PREPARE_game_fsm: begin
        M_game_fsm_d = PREPARE_game_fsm;
        time_show = 1'h0;
        if (reset_button) begin
          M_game_fsm_d = START_game_fsm;
        end
      end
      START_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h1;
        wr = 16'h0001;
        M_game_fsm_d = RESET_SCORE_game_fsm;
      end
      RESET_SCORE_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h1;
        wr = 16'h0002;
        M_game_fsm_d = RESET_LEVEL_game_fsm;
      end
      RESET_LEVEL_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h1;
        wr = 16'h0003;
        M_game_fsm_d = SET_PATTERN_game_fsm;
      end
      SET_PATTERN_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h2;
        wr = 16'h0000;
        M_game_fsm_d = IDLE_game_fsm;
      end
      IDLE_game_fsm: begin
        if (t[0+3-:4] == 4'h0 && t[4+3-:4] == 4'h0 && t[8+3-:4] == 4'h0 && t[12+3-:4] == 4'h0) begin
          M_game_fsm_d = LOSE_PATTERN1_game_fsm;
        end else begin
          if (clear_button) begin
            M_game_fsm_d = CLEAR_BOARD_game_fsm;
          end else begin
            if (button[0+0-:1]) begin
              M_game_fsm_d = UPDATE_STATE1_game_fsm;
            end else begin
              if (button[1+0-:1]) begin
                M_game_fsm_d = UPDATE_STATE2_game_fsm;
              end else begin
                if (button[2+0-:1]) begin
                  M_game_fsm_d = UPDATE_STATE3_game_fsm;
                end else begin
                  if (button[3+0-:1]) begin
                    M_game_fsm_d = UPDATE_STATE4_game_fsm;
                  end else begin
                    if (button[4+0-:1]) begin
                      M_game_fsm_d = UPDATE_STATE5_game_fsm;
                    end else begin
                      if (button[5+0-:1]) begin
                        M_game_fsm_d = UPDATE_STATE6_game_fsm;
                      end else begin
                        if (button[6+0-:1]) begin
                          M_game_fsm_d = UPDATE_STATE7_game_fsm;
                        end else begin
                          if (button[7+0-:1]) begin
                            M_game_fsm_d = UPDATE_STATE8_game_fsm;
                          end else begin
                            if (button[8+0-:1]) begin
                              M_game_fsm_d = UPDATE_STATE9_game_fsm;
                            end else begin
                              if (pass_button) begin
                                M_game_fsm_d = CHECK_LEVEL_game_fsm;
                              end else begin
                                if (reset_button) begin
                                  M_game_fsm_d = START_game_fsm;
                                end else begin
                                  M_game_fsm_d = IDLE_game_fsm;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      CLEAR_BOARD_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h1;
        wr = 16'h0001;
        M_game_fsm_d = IDLE_game_fsm;
      end
      UPDATE_STATE1_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0001;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE2_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0002;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE3_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0004;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE4_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0008;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE5_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0010;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE6_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0020;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE7_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0040;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE8_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0080;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_STATE9_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h1;
        bsel = 3'h0;
        alufn = 6'h3f;
        wr = 16'h0001;
        button_sig = 16'h0100;
        M_game_fsm_d = UPDATE_TRANS_game_fsm;
      end
      UPDATE_TRANS_game_fsm: begin
        wdsel = 3'h0;
        asel = 3'h0;
        bsel = 3'h0;
        alufn = 6'h33;
        M_game_fsm_d = CHECK_PATTERN_game_fsm;
      end
      CHECK_PATTERN_game_fsm: begin
        if (z == 1'h1) begin
          M_game_fsm_d = ADD_SCORE_game_fsm;
        end else begin
          M_game_fsm_d = IDLE_game_fsm;
        end
      end
      ADD_SCORE_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h0;
        asel = 3'h4;
        bsel = 3'h2;
        alufn = 6'h00;
        wr = 16'h0002;
        increase = 1'h1;
        M_game_fsm_d = CHECK_LEVEL_game_fsm;
      end
      CHECK_LEVEL_game_fsm: begin
        asel = 3'h3;
        bsel = 3'h1;
        alufn = 6'h33;
        M_game_fsm_d = CHECK_LEVEL_TRANS_game_fsm;
      end
      CHECK_LEVEL_TRANS_game_fsm: begin
        if (z == 1'h1) begin
          M_game_fsm_d = CHECKWINLOSE_game_fsm;
        end else begin
          M_game_fsm_d = ADD_LEVEL_game_fsm;
        end
      end
      CHECKWINLOSE_game_fsm: begin
        asel = 3'h3;
        bsel = 3'h3;
        alufn = 6'h33;
        M_game_fsm_d = CHECKWINLOSE_TRANS_game_fsm;
      end
      CHECKWINLOSE_TRANS_game_fsm: begin
        if (z == 1'h1) begin
          M_game_fsm_d = WIN_PATTERN1_game_fsm;
        end else begin
          M_game_fsm_d = LOSE_PATTERN1_game_fsm;
        end
      end
      WIN_PATTERN1_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 3'h6;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN2_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN1_game_fsm;
        end
      end
      WIN_PATTERN2_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 3'h7;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN3_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN2_game_fsm;
        end
      end
      WIN_PATTERN3_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'h8;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN4_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN3_game_fsm;
        end
      end
      WIN_PATTERN4_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'h9;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN5_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN4_game_fsm;
        end
      end
      WIN_PATTERN5_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'ha;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN6_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN5_game_fsm;
        end
      end
      WIN_PATTERN6_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'hb;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN7_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN6_game_fsm;
        end
      end
      WIN_PATTERN7_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'hc;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN8_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN7_game_fsm;
        end
      end
      WIN_PATTERN8_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'hd;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = WIN_PATTERN9_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN8_game_fsm;
        end
      end
      WIN_PATTERN9_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 4'he;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = GAMEOVER_game_fsm;
        end else begin
          M_game_fsm_d = WIN_PATTERN9_game_fsm;
        end
      end
      ADD_LEVEL_game_fsm: begin
        we = 1'h1;
        asel = 3'h4;
        bsel = 3'h1;
        wdsel = 3'h0;
        alufn = 6'h00;
        wr = 16'h0003;
        M_game_fsm_d = GENERATE_PATTERN_game_fsm;
      end
      GENERATE_PATTERN_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h2;
        wr = 16'h0000;
        M_game_fsm_d = IDLE_game_fsm;
      end
      LOSE_PATTERN1_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h4;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = LOSE_PATTERN2_game_fsm;
        end else begin
          M_game_fsm_d = LOSE_PATTERN1_game_fsm;
        end
      end
      LOSE_PATTERN2_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h3;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = LOSE_PATTERN3_game_fsm;
        end else begin
          M_game_fsm_d = LOSE_PATTERN2_game_fsm;
        end
      end
      LOSE_PATTERN3_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h4;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = LOSE_PATTERN4_game_fsm;
        end else begin
          M_game_fsm_d = LOSE_PATTERN3_game_fsm;
        end
      end
      LOSE_PATTERN4_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h3;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = LOSE_PATTERN5_game_fsm;
        end else begin
          M_game_fsm_d = LOSE_PATTERN4_game_fsm;
        end
      end
      LOSE_PATTERN5_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h4;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = LOSE_PATTERN6_game_fsm;
        end else begin
          M_game_fsm_d = LOSE_PATTERN5_game_fsm;
        end
      end
      LOSE_PATTERN6_game_fsm: begin
        we = 1'h1;
        wdsel = 3'h3;
        wr = 16'h0001;
        if (toggle) begin
          M_game_fsm_d = LOSE_PATTERN6_game_fsm;
        end else begin
          M_game_fsm_d = GAMEOVER_game_fsm;
        end
      end
      GAMEOVER_game_fsm: begin
        time_froze = 1'h1;
        we = 1'h1;
        wdsel = 3'h5;
        wr = 16'h0001;
        M_game_fsm_d = GAMEOVER_game_fsm;
        if (reset_button) begin
          M_game_fsm_d = START_game_fsm;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_game_fsm_q <= 1'h0;
    end else begin
      M_game_fsm_q <= M_game_fsm_d;
    end
  end
  
endmodule
