module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    generate 
        for (i = 0; i<$bits(sum) ;i++)begin : fa_gen
            if (i == 0) begin
                fa add_inst(a[0],b[0],cin,cout[0], sum[0]);
            end
            else begin
                fa add_inst(a[i],b[i],cout[i-1],cout[i],sum[i]);
            end
    	end
    endgenerate 
endmodule

module fa (input a, input b, input cin, output cout, output sum );
    wire [1:0] totalsum;
    assign totalsum = a + b + cin;
    assign sum = totalsum[0];
    assign cout  = totalsum[1];
endmodule