# 補充教材學習報告

參考資料: [如何設計電腦 -- 還有讓電腦變快的那些方法](https://www.slideshare.net/ccckmit/ss-85466673)

nand2tertris電腦是由很多nand閘做出來的，要改進速度可以用以下方法



https://www.slideshare.net/ccckmit/ss-85466673



nand2tertris電腦的記憶體是用暫存器做的，電腦會很貴

加入除法和乘法的電路

加入浮點數的電路https://hackmd.io/@sysprog/c-floating-point

把原本的鏈波進為加法器改成前瞻進位加法器



其他加速技巧

* 多層次快取

* 平行
  * 管線機制 (pipeline)
    * 用暫存器達到，讓每個部分可以同時做事
  * 多核心 + Hyper-Threading
    * 每個核心都有自己的ALU(1core 1ALU)、快取、控制電路和暫存器，最後連接到MemorySystem
  * 螢幕繪製交給顯卡(GPU)
    * GPU裡面有很多ALU(1core nALU)，在繪圖運算上比CPU快很多

以上平行機制都會被跳躍影響