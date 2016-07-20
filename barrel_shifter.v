// barrel_shifter.v

module barrel_shifter #(  parameter WIDTH = 8,                  // width of single port
                          parameter PORT = 8,                   // number of ports
                          parameter SHIFT = $clog2(PORT),       // select lines for port selection
                          parameter WIDE = WIDTH*PORT           // width of input & output ports

                       )
                 
                     (
                        input  [SHIFT-1:0] select, 

                        input  [WIDE-1:0] data_in, 
                        output [WIDE-1:0] data_out

                     );

wire [(2*WIDE)-1:0] data_in_double;
wire [WIDE-1:0] array [0:WIDE-1];

assign data_in_double = {data_in,data_in};

assign data_out = data_in_double[(select*WIDTH)+(WIDE-1)-:WIDE];

endmodule