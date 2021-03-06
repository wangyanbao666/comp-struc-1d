/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    input usb_rx,
    output reg usb_tx,
    input [8:0] button,
    input clear_button,
    input pass_button,
    input reset_button,
    output reg [8:0] player,
    output reg [8:0] pattern,
    output reg [6:0] score_seg,
    output reg [6:0] timer_seg,
    output reg [3:0] timer_sel,
    output reg [7:0] led
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_beta_current_state;
  wire [16-1:0] M_beta_pattern;
  wire [4-1:0] M_beta_score;
  wire [1-1:0] M_beta_time_show;
  wire [1-1:0] M_beta_timer_froze;
  reg [9-1:0] M_beta_play_button;
  reg [1-1:0] M_beta_clear_button;
  reg [1-1:0] M_beta_pass_button;
  reg [1-1:0] M_beta_reset_edge;
  reg [16-1:0] M_beta_t;
  reg [32-1:0] M_beta_randnum_val;
  game_beta_1 beta (
    .clk(clk),
    .rst(clk),
    .play_button(M_beta_play_button),
    .clear_button(M_beta_clear_button),
    .pass_button(M_beta_pass_button),
    .reset_edge(M_beta_reset_edge),
    .t(M_beta_t),
    .randnum_val(M_beta_randnum_val),
    .current_state(M_beta_current_state),
    .pattern(M_beta_pattern),
    .score(M_beta_score),
    .time_show(M_beta_time_show),
    .timer_froze(M_beta_timer_froze)
  );
  
  wire [16-1:0] M_timer_out;
  reg [1-1:0] M_timer_reset_button;
  reg [1-1:0] M_timer_time_froze;
  reg [1-1:0] M_timer_signal;
  time_countdown_2 timer (
    .clk(clk),
    .rst(rst),
    .reset_button(M_timer_reset_button),
    .time_froze(M_timer_time_froze),
    .signal(M_timer_signal),
    .out(M_timer_out)
  );
  
  wire [1-1:0] M_counter1_value;
  counter_3 counter1 (
    .clk(clk),
    .rst(rst),
    .value(M_counter1_value)
  );
  
  wire [1-1:0] M_edge_detector1_out;
  reg [1-1:0] M_edge_detector1_in;
  edge_detector_4 edge_detector1 (
    .clk(clk),
    .in(M_edge_detector1_in),
    .out(M_edge_detector1_out)
  );
  
  wire [7-1:0] M_score_segs;
  reg [4-1:0] M_score_char;
  seven_seg_5 score (
    .char(M_score_char),
    .segs(M_score_segs)
  );
  
  wire [7-1:0] M_time_seven_seg_seg;
  wire [4-1:0] M_time_seven_seg_sel;
  reg [16-1:0] M_time_seven_seg_values;
  multi_seven_seg_6 time_seven_seg (
    .clk(clk),
    .rst(rst),
    .values(M_time_seven_seg_values),
    .seg(M_time_seven_seg_seg),
    .sel(M_time_seven_seg_sel)
  );
  
  wire [32-1:0] M_randnum_num;
  reg [1-1:0] M_randnum_next;
  reg [32-1:0] M_randnum_seed;
  pn_gen_7 randnum (
    .clk(clk),
    .rst(rst),
    .next(M_randnum_next),
    .seed(M_randnum_seed),
    .num(M_randnum_num)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_8 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_reset_edge_detector_out;
  reg [1-1:0] M_reset_edge_detector_in;
  edge_detector_9 reset_edge_detector (
    .clk(clk),
    .in(M_reset_edge_detector_in),
    .out(M_reset_edge_detector_out)
  );
  wire [1-1:0] M_reset_button_cond_out;
  reg [1-1:0] M_reset_button_cond_in;
  button_conditioner_10 reset_button_cond (
    .clk(clk),
    .in(M_reset_button_cond_in),
    .out(M_reset_button_cond_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    M_timer_time_froze = M_beta_timer_froze;
    M_edge_detector1_in = M_counter1_value;
    M_timer_signal = M_edge_detector1_out;
    M_beta_play_button = button;
    M_beta_pass_button = pass_button;
    M_beta_clear_button = clear_button;
    M_reset_button_cond_in = ~reset_button;
    M_reset_edge_detector_in = M_reset_button_cond_out;
    M_beta_reset_edge = M_reset_edge_detector_out;
    M_timer_reset_button = M_reset_button_cond_out;
    M_beta_t = M_timer_out;
    M_score_char = M_beta_score;
    M_randnum_seed = 32'habcdefff;
    M_randnum_next = M_reset_edge_detector_out;
    M_beta_randnum_val = M_randnum_num;
    led = M_randnum_num;
    player = M_beta_current_state[0+8-:9];
    pattern = M_beta_pattern[0+8-:9];
    M_time_seven_seg_values = M_timer_out;
    timer_seg = M_time_seven_seg_seg;
    if (M_beta_time_show == 1'h1) begin
      score_seg = ~M_score_segs;
      timer_sel = ~M_time_seven_seg_sel;
    end else begin
      score_seg = 7'h7f;
      timer_sel = 4'hf;
    end
  end
endmodule
