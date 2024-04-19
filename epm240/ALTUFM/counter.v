module counter ( input clk,  output  reg  led );

    parameter PERIODLED=2;
//altumf_osc osc(.oscena(1'b1),.osc(clk));
    integer count=0;
    always @ (posedge clk)	begin
	if (count<=PERIODLED) begin                          
	    led<=0;
	    count=count+1;
	  end                          
	else if (count>=PERIODLED && count<=PERIODLED*2)
	  begin
	    led<=1;
	    count=count+1;
	  end else count=0;
	end              
endmodule
