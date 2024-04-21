`timescale 1ms/ 1 ms
module test_counter();

reg clk;
wire led1, led2;

//устанавливаем экземпляр тестируемого модуля
counter counter_inst( clk, led1, led2 );
//моделируем сигнал тактовой частоты
always
  #10  clk = ~clk;

//от начала времени...
initial
begin
  clk = 0;
  //пауза длительностью "50"
  #50  $display("Running---%d",$time);
       //$monitor(led);        
end 

//заканчиваем симуляцию в момент времени "400"
initial
begin
  #400 $finish;
end

//создаем файл VCD для последующего анализа сигналов
initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,test_counter);
end

//наблюдаем на некоторыми сигналами системы
initial
$monitor($stime,,,  clk,,, led1,,, led2 );

endmodule
