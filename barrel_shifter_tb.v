// barrel_shifter_tb.v

module barrel_shifter_tb #(  
                              parameter WIDTH = 64,                  // width of single port
                              parameter PORT = 8                    // number of ports
                          )
                     
                     (
                        output [(WIDTH*PORT-1):0] data_out

                     );

reg [(WIDTH*PORT)-1:0]     data;
reg [($clog2(PORT)-1):0] sel;


initial begin : data_TB
          #5  data = 0;
          #2  data = {$random} % (2*PORT);
        end


initial begin : sel_TB
          #5   sel = 0;
  forever #10  sel = (sel+1);
        end

barrel_shifter  #(WIDTH,PORT,$clog2(PORT),WIDTH*PORT) U1 ( .select(sel), .data_in(data), .data_out(data_out) );

endmodule