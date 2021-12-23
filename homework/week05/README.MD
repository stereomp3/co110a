# 製作 || Bit || Register || RAM8 ||


## 1. Bit 

<img src=https://github.com/stereomp3/co110a/blob/master/homework/week05/picture/Bit.jpg alt=error>


```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/03/a/Bit.hdl

/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *                 else out does not change (out[t+1] = out[t])
 */

CHIP Bit {
    IN in, load;
    OUT out;

    PARTS:
    // Put your code here:
    Mux(a = self, b = in, sel = load, out = temp);
    DFF(in = temp, out = self, out = out );
}
```

## 2. Register

<img src=https://github.com/stereomp3/co110a/blob/master/homework/week05/picture/Register.png alt=error>

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/03/a/Register.hdl

/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

CHIP Register {
    IN in[16], load;
    OUT out[16];

    PARTS:
    // Put your code here:
    Bit(in = in[0], load = load, out = out[0]);
    Bit(in = in[1], load = load, out = out[1]);
    Bit(in = in[2], load = load, out = out[2]);
    Bit(in = in[3], load = load, out = out[3]);
    Bit(in = in[4], load = load, out = out[4]);
    Bit(in = in[5], load = load, out = out[5]);
    Bit(in = in[6], load = load, out = out[6]);
    Bit(in = in[7], load = load, out = out[7]);
    Bit(in = in[8], load = load, out = out[8]);
    Bit(in = in[9], load = load, out = out[9]);
    Bit(in = in[10], load = load, out = out[10]);
    Bit(in = in[11], load = load, out = out[11]);
    Bit(in = in[12], load = load, out = out[12]);
    Bit(in = in[13], load = load, out = out[13]);
    Bit(in = in[14], load = load, out = out[14]);
    Bit(in = in[15], load = load, out = out[15]);
}
```

## 3. RAM8 

<img src=https://github.com/stereomp3/co110a/blob/master/homework/week05/picture/RAM.png alt=error>

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/03/a/RAM8.hdl

/**
 * Memory of 8 registers, each 16 bit-wide. Out holds the value
 * stored at the memory location specified by address. If load==1, then 
 * the in value is loaded into the memory location specified by address 
 * (the loaded value will be emitted to out from the next time step onward).
 */

CHIP RAM8 {
    IN in[16], load, address[3];
    OUT out[16];

    PARTS:
    // Put your code here:
    DMux8Way(in = load, sel = address, a = r1, b = r2, c = r3, d = r4, e = r5, f = r6, g = r7, h = r8);
    Register(in = in, load = r1, out = ro1); 
    Register(in = in, load = r2, out = ro2);
    Register(in = in, load = r3, out = ro3);
    Register(in = in, load = r4, out = ro4); 
    Register(in = in, load = r5, out = ro5);
    Register(in = in, load = r6, out = ro6);
    Register(in = in, load = r7, out = ro7);
    Register(in = in, load = r8, out = ro8);
    Mux8Way16(a = ro1, b = ro2, c = ro3, d = ro4, e = ro5, f = ro6, g = ro7, h = ro8, sel = address, out = out);
    
}
```

