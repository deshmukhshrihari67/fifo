// Code your design here
module fifo_sync (input clk, 
                  input [7:0]data_in,
                  input rd_en,
                  input wr_en 
                  output [7:0]out_data,
                  output reg full,
                  output reg empty
                 );
  reg [7:0] fifo[0:1];
  reg [5:0]w_ptr,r_ptr;
  
  reg w_ovf,r_ovf;
  
  initial
    begin
      {w_ovf,w_ptr} = 0;
      {r_ovf,r_ptr} = 0;
    end
  
  always@(posedge clk)
    begin
      full = w_ovf!=r_ovf && w_ptr == r_ptr;
      empty = w_ovf==r_ovf && w_ptr == r_ptr;
    end
      
  always@(posedge clk)
    begin
      if(wr_en)
        begin
          if(!full)
            begin
              fifo[w_ptr]<=data_in;
              {w_ovf,w_ptr}<={w_ovf,w_ptr}+7'd1;
            end
        end     
    end

    always@(posedge clk)
    begin
      if(rd_en)
        begin
          if(!empty)
            begin
              data_out<=fifo[r_ptr];//<=data_in;
              {r_ovf,r_ptr}<={r_ovf,r_ptr}+7'd1;
            end
        end     
    end

  
  
  
endmodule
