// Code your testbench here
// or browse Examples
module tb();
  wire clk;
  wire [7:0] data_in;
  wire rd_en,wr_en;
  reg [7:0] out_data;
  reg full,empty;

  fifo_sync fifo_sync(.*);
  
  initial clk=0;
  always #5 clk=~clk; 
  
  initial
    begin
      $monitor(" %d ,  %d , %d , %d \n",data_in,out_data, full, empty);
      rd_en = 0;
      wr_en = 0;
      data_in = 8'd56;
      
      #8 wr_en = 1;
      #8 data_in = 8'd07;
      #9 data_in = 8'd41;
      #9 data_in = 8'd5;
      #9 data_in = 8'd12;
      #8 data_in = 8'd6;
      #4 rd_en = 1;
      #8 data_in = 8'd8;
      #8 data_in = 8'd33;
      #9 $end 
    end     
  
  endmodule
