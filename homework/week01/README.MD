# 製作 || Not || And || Or || Xor || Mux || DMux ||


## 1. Not

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Not.hdl

/**
 * Not gate:
 * out = not in
 */

CHIP Not {
    IN in;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a = in, b = in, out = out);
}
```
<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/Not%E9%96%98.png" alt = error>

## 2. And

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/And.hdl

/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

CHIP And {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Nand(a = a, b = b, out = nab);
    Not(in = nab, out = out);
}
```

<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/And%E9%96%98.png" alt = error>

## 3. Or

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Or.hdl

 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in = a, out = na);
    Not(in = b, out = nb);
    Nand(a = na, b = nb, out = out);
}
```

<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/Or%E9%96%98.png" alt = error>

## 4. Xor

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Xor.hdl

/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in = a, out = na);
	Not(in = b, out = nb);
	And(a = na, b = b, out = nab);
	And(a = a, b = nb, out = anb);
	Or(a = nab, b = anb, out = out);
}
```

<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/Xor%E9%96%98.png" alt = error>

## 5. Mux

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Mux.hdl

/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
    // Put your code here:
    Not(in = sel, out = nsel);
    And(a = a, b = nsel, out = asel);
    And(a = b, b = sel, out = bsel);
    Or(a = asel, b = bsel, out=out);
}
```

* sel = 0
<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/Mux_sel0.png" alt = error>

* sel = 1
<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/Mux_sel1.png" alt = error>

## 6. DMux

```js
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/DMux.hdl

/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    // Put your code here:
    Not(in = sel, out = nsel);
    And(a = in, b = nsel, out = a);
    And(a = in, b = sel, out = b);
}
```

<img src = "https://github.com/stereomp3/co110a/blob/master/homework/week01/picture/DMux%E9%96%98.png" alt = error>