module xor3(input a, b, c, output abc);
wire ab;
xor g1(ab, a, b);
xor g2(abc, c, ab);
endmodule
 
// 作出真值表測試
module xor3test;
reg a, b, c;
wire abc;

xor3 g(a,b,c, abc);

initial
begin
  a = 0;
  b = 0;
  c = 0;
end

// 50ms作一次
always #50 begin
  a = a+1;
  $monitor("%4dns monitor: a=%d b=%d c=%d a^b^c=%d", $stime, a, b, c, abc);
end

// 100ms作一次
always #100 begin
  b = b+1;
end

// 200ms作一次
always #200 begin
  c = c+1;
end

// 2000ms完成
initial #2000 $finish;

endmodule
