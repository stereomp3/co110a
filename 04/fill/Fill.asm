// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@16384
D=A
A=D
D=D+1
M=-1
@2
0;JMP

// here

// 偵測鍵盤位置有沒有輸入
0.  @24576  // keyboard
1.  D=M     // 把memory 24576的值取出
2.  @0
3.  D;JEQ   // 如果值為0就返回第一個

// 使用變數判斷迴圈到甚麼時候停
4.  @8192  // 24576-16384 = 8192(把所有螢幕做調整，值會慢慢減，減到0跳出迴圈)
5.  D=A    // 把值(8192)給 D
6.  @10    // 把值放到 M 10裡面(@10是跳回的地方(A=D)，順便做判斷)
7.  M=D

// 螢幕變白，開始迴圈
8.  @16384
9.  D=A    // 把值(16384)給 D
10. A=D    // 把值回傳給A (@D)
11. D=D+1  // 值會一直增加，所以迴圈時，位置也會一直上升
12. M=-1   // 把 M A 位置的值變 -1(黑色)

13. @10    
14. M=M-1  // M 10 遞減
15. M;JNE  // 如果 M == 0 就跳出迴圈，else 跳回10的地方做迴圈

// 螢幕變黑後，偵測keyboard是否放開(0)
16. @24576 
17. D=M    // 24576-16384 = 8192(把所有螢幕做調整，值會慢慢減，減到0跳出迴圈)
18. @16    // 把值(8192)給 D
19. D;JNE  // 如果 D == 0 就跳出迴圈，else 跳回16的地方做迴圈

// 使用變數判斷迴圈到甚麼時候停，這之後都跟上面(4. ~ 15.)的差不多
20. @8192  // 把數字存到M裡面
21. D=A    // 把值(16384)給 D
22. @25    // 把值放到 M 25裡面(@25是跳回的地方(A=D)，順便做判斷)
23. M=D

// 螢幕變白，
24. @16384 // 把值(16384)給 D
25. D=A    // 把值回傳給A (@D)
26. A=D    // 把值回傳給A (@D)
27. D=D+1  // 值會一直增加，所以迴圈時，位置也會一直上升
28. M=-1   // 把 M A 位置的值變 0(白色)

29. @25
30. M=M-1  // M 10 遞減
31. M;JNE  // 如果 M == 0 就跳出迴圈，else 跳回25的地方做迴圈

// 結束一套，跳回原點
32. @0
33. 0;JMP