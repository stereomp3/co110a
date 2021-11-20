到官網下載: https://bleyer.org/icarus/



使用vsCode在 終端執行 :  iverilog -o xor3 xor3.v  // xor3是檔名，把他轉成verilog

vvp xor3 可以執行結果



* nand2tetris 用的是Chip(And 、 Mux ....)， verilog用的是module......endmodule

* verilog 可以存放變數    

      1. wire 放變數(不會暫存，直接輸入輸出) -->  nand2tetris   IN    OUT
         2. reg 放可存放變數(預設一位元)  -->   nand2tetris  用 DFF

  

* 要對變數進行操作使用 begin 開始， end 結束，如果要搭配時間操作，使用always #ms begin

* verilog 一定要包起來才能寫變數指令(用always， assign)



```
module DFF (input in, clock, output out);
  reg q;
  assign out = q; // q in q out
  always @(posedge clock) begin   // 在正邊緣時寫入
    q = in;
  end
endmodule
```









$ 指令:

 ($monitor (只要有值改變就會執行), $finish(測試完成), $stime (計算執行時間), $display (到了程式的地方才會執行))

```
// 宣告 自己的 xor， 使用內建的xor 組合成自己的 xor
module xor3(input a, b, c, output abc); // 如果要輸入多條線，就用[15:0] // 16條線
wire ab; // 有新的變數就要宣告
xor g1(ab, a, b);   // 名字是區域的，同一個module不要一樣就好
xor g2(abc, c, ab);
endmodule


// verilog 的程式要自己寫測試代碼
// 測試代碼開始
module xor3test;
reg a, b, c;  // 設置暫存器變數
wire abc;     // 直接輸入輸出 跟 IN OUT 一樣

xor3 g(a,b,c, abc); // g是變數，可以隨便取

initial  // 一開始就執行
begin								Hexadecimal								Binary		
  a = 0; // 預設一位元，如果要16位元，用 16`h0 // 16進位表示0  // 二進位也可以表示成 1`b0
  b = 0;
  c = 0;
  // 監控函式，只要有改變就會打印
  $monitor("%4dns monitor: a=%d b=%d c=%d a^b^c=%d", $stime, a, b, c, abc);
end

// 50ms作一次
always #50 begin
  a = a+1; // 只有一個位元，所以會1、0、1、0 跳
end

// 100ms作一次
always #100 begin
  b = b+1;
end

// 200ms作一次
always #200 begin
  c = c+1;
end

// 從一開始算2000ms完成
initial #2000 $finish;

endmodule
```



> 測試可以分模組來寫 要使用 `include "xor3"

