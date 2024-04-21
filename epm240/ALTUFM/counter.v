module counter ( input clk,  output  reg  led1, output reg led2 );

    parameter PERIODLED=2;
              //altumf_osc osc(.oscena(1'b1),.osc(clk));
    integer countone=0; // Счетчик одноразовый
    integer count=0;    // Счетчик периодичный
    always @ (posedge clk)	
      begin
	// Вариант непосредственного указания
	if (countone<5)      led1<=0;
	if (countone>=5 && countone<10)     led1<=1;
	else led1<=0;
	countone=countone+1;

	// Вариант периодичности
	if (count<=PERIODLED) 
	   begin                          
	    led2<=0;
	    count=count+1;
	  end                          
	else if (count>=PERIODLED && count<=PERIODLED*2)
	   begin
	    led2<=1;
	    count=count+1;
	   end 
         else count=0;
    end              
endmodule
