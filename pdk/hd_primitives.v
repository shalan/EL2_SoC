primitive sky130_fd_sc_hd__udp_dlatch$P (
    Q   ,
    D   ,
    GATE
);
    output Q   ;
    input  D   ;
    input  GATE;
    reg Q;
    table
     //  D  GATE :  Qt : Qt+1
         ?   0   :  ?  :  -    ; // hold
         0   1   :  ?  :  0    ; // pass 0
         1   1   :  ?  :  1    ; // pass 1
         0   x   :  0  :  0    ; // reduce pessimism
         1   x   :  1  :  1    ; // reduce pessimism
    endtable
endprimitive


primitive sky130_fd_sc_hd__udp_dff$P (
    Q  ,
    D  ,
    CLK
);
    output Q  ;
    input  D  ;
    input  CLK;
    reg Q;
    table
     //  D  CLK  :  Qt : Qt+1
         1  (01) :  ?  :  1    ; // clocked data
         0  (01) :  ?  :  0    ;
         1  (x1) :  1  :  1    ; // reducing pessimism
         0  (x1) :  0  :  0    ;
         1  (0x) :  1  :  1    ;
         0  (0x) :  0  :  0    ;
         ?  (1x) :  ?  :  -    ; // no change on falling edge
         ?  (?0) :  ?  :  -    ;
         *   ?   :  ?  :  -    ; // ignore edges on data
    endtable
endprimitive

primitive sky130_fd_sc_hd__udp_mux_4to2 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);
    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;
    table
     //  A0  A1  A2  A3  S0  S1 :  X
         0   ?   ?   ?   0   0  :  0   ;
         1   ?   ?   ?   0   0  :  1   ;
         ?   0   ?   ?   1   0  :  0   ;
         ?   1   ?   ?   1   0  :  1   ;
         ?   ?   0   ?   0   1  :  0   ;
         ?   ?   1   ?   0   1  :  1   ;
         ?   ?   ?   0   1   1  :  0   ;
         ?   ?   ?   1   1   1  :  1   ;
         0   0   0   0   ?   ?  :  0   ;
         1   1   1   1   ?   ?  :  1   ;
         0   0   ?   ?   ?   0  :  0   ;
         1   1   ?   ?   ?   0  :  1   ;
         ?   ?   0   0   ?   1  :  0   ;
         ?   ?   1   1   ?   1  :  1   ;
         0   ?   0   ?   0   ?  :  0   ;
         1   ?   1   ?   0   ?  :  1   ;
         ?   0   ?   0   1   ?  :  0   ;
         ?   1   ?   1   1   ?  :  1   ;
    endtable
endprimitive

primitive sky130_fd_sc_hd__udp_dff$PR (
    Q    ,
    D    ,
    CLK  ,
    RESET
);
    output Q    ;
    input  D    ;
    input  CLK  ;
    input  RESET;
    reg Q;
    table
     //  D  CLK  RESET :  Qt : Qt+1
         *   b     0   :  ?  :  -    ; // data event, hold unless CP==x
         ?  (?0)   0   :  ?  :  -    ; // CP => 0, hold
         ?   b    (?0) :  ?  :  -    ; // R => 0, hold unless CP==x
         ?   ?     1   :  ?  :  0    ; // async reset
         0   r     ?   :  ?  :  0    ; // clock data on CP
         1   r     0   :  ?  :  1    ; // clock data on CP
         0  (x1)   ?   :  0  :  0    ; // possible CP, hold when D==Q==0
         1  (x1)   0   :  1  :  1    ; // possible CP, hold when D==Q==1
         0   x     ?   :  0  :  0    ; // unkown CP, hold when D==Q==0
         1   x     0   :  1  :  1    ; // unkown CP, hold when D==Q==1
         ?   b    (?x) :  0  :  0    ; // R=>x, hold when Q==0 unless CP==x
    endtable
endprimitive