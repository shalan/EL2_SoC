`timescale 1ns / 1ps
`default_nettype none
//`include "hd_primitives.v"
`define UNIT_DELAY #1

module sky130_fd_sc_hd__dlclkp (
    GCLK,
    GATE,
    CLK
);
    // Module ports
    output GCLK;
    input  GATE;
    input  CLK ;
    // Local signals
    wire m0  ;
    wire clkn;
    //                            Name     Output  Other arguments
    not                           not0    (clkn  , CLK            );
    sky130_fd_sc_hd__udp_dlatch$P dlatch0 (m0    , GATE, clkn     );
    and                           and0    (GCLK  , m0, CLK        );
endmodule

module sky130_fd_sc_hd__dlclkp_1 ( GCLK, GATE, CLK );
    output GCLK;
    input  GATE;
    input  CLK ;

    sky130_fd_sc_hd__dlclkp U ( GCLK, GATE, CLK );

endmodule

module sky130_fd_sc_hd__dlclkp_2 ( GCLK, GATE, CLK );
    output GCLK;
    input  GATE;
    input  CLK ;

    sky130_fd_sc_hd__dlclkp U ( GCLK, GATE, CLK );

endmodule


module sky130_fd_sc_hd__and2 (
    X,
    A,
    B
);
    // Module ports
    output X;
    input  A;
    input  B;
    // Local signals
    wire and0_out_X;
    //  Name  Output      Other arguments
    and and0 (and0_out_X, A, B           );
    buf buf0 (X         , and0_out_X     );
endmodule


module sky130_fd_sc_hd__and2_1 (
    X,
    A,
    B
);
    // Module ports
    output X;
    input  A;
    input  B;

sky130_fd_sc_hd__and2 U(
    X  ,
    A,
    B
);

endmodule

module sky130_fd_sc_hd__and2_2 (
    X,
    A,
    B
);
    // Module ports
    output X;
    input  A;
    input  B;

sky130_fd_sc_hd__and2 U(
    X  ,
    A,
    B
);

endmodule

module sky130_fd_sc_hd__and2_4 (
    X,
    A,
    B
);
    // Module ports
    output X;
    input  A;
    input  B;

sky130_fd_sc_hd__and2 U(
    X  ,
    A,
    B
);

endmodule

module sky130_fd_sc_hd__and2b (
    X  ,
    A_N,
    B
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    // Local signals
    wire not0_out  ;
    wire and0_out_X;
    //  Name  Output      Other arguments
    not not0 (not0_out  , A_N            );
    and and0 (and0_out_X, not0_out, B    );
    buf buf0 (X         , and0_out_X     );
endmodule


module sky130_fd_sc_hd__and2b_1 (
    X  ,
    A_N,
    B
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;

sky130_fd_sc_hd__and2b U(
    X  ,
    A_N,
    B
);

endmodule 

module sky130_fd_sc_hd__and2b_2 (
    X  ,
    A_N,
    B
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;

sky130_fd_sc_hd__and2b U(
    X  ,
    A_N,
    B
);

endmodule 

module sky130_fd_sc_hd__dfxtp (
    Q  ,
    CLK,
    D
);
    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;
    // Local signals
    wire buf_Q;
    //                         Delay       Name  Output  Other arguments
    sky130_fd_sc_hd__udp_dff$P `UNIT_DELAY dff0 (buf_Q , D, CLK         );
    buf                                    buf0 (Q     , buf_Q          );
endmodule

module sky130_fd_sc_hd__dfxtp_1 (
    Q  ,
    CLK,
    D
);
    // Module ports
    output Q  ;
    input  CLK;
    input  D  ;

sky130_fd_sc_hd__dfxtp U (
    Q  ,
    CLK,
    D
);

endmodule

module sky130_fd_sc_hd__ebufn (
    Z   ,
    A   ,
    TE_B
);
    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;
    //     Name     Output  Other arguments
    bufif0 bufif00 (Z     , A, TE_B        );
endmodule

module sky130_fd_sc_hd__ebufn_1 (
    Z   ,
    A   ,
    TE_B
);
    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;
    sky130_fd_sc_hd__ebufn U (
    Z   ,
    A   ,
    TE_B
);
endmodule

module sky130_fd_sc_hd__ebufn_2 (
    Z   ,
    A   ,
    TE_B
);
    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;
    sky130_fd_sc_hd__ebufn U (
    Z   ,
    A   ,
    TE_B
);
endmodule

module sky130_fd_sc_hd__ebufn_4 (
    Z   ,
    A   ,
    TE_B
);
    // Module ports
    output Z   ;
    input  A   ;
    input  TE_B;
    sky130_fd_sc_hd__ebufn U (
    Z   ,
    A   ,
    TE_B
);
endmodule

module sky130_fd_sc_hd__and4bb (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);
    // Module ports
    output X  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;
    // Local signals
    wire nor0_out  ;
    wire and0_out_X;
    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A_N, B_N       );
    and and0 (and0_out_X, nor0_out, C, D );
    buf buf0 (X         , and0_out_X     );
endmodule


module sky130_fd_sc_hd__and4bb_1 (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);
    // Module ports
    output X  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    sky130_fd_sc_hd__and4bb U (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);

endmodule


module sky130_fd_sc_hd__and4bb_2 (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);
    // Module ports
    output X  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    sky130_fd_sc_hd__and4bb U (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);

endmodule

module sky130_fd_sc_hd__and4bb_4 (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);
    // Module ports
    output X  ;
    input  A_N;
    input  B_N;
    input  C  ;
    input  D  ;

    sky130_fd_sc_hd__and4bb U (
    X  ,
    A_N,
    B_N,
    C  ,
    D
);

endmodule

module sky130_fd_sc_hd__inv (
    Y,
    A
);
    // Module ports
    output Y;
    input  A;
    // Local signals
    wire not0_out_Y;
    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );

    specify
        (A -=> Y ) = (0:0:0,0:0:0);  // delays are tris,tfall
    endspecify
endmodule

module sky130_fd_sc_hd__inv_1 (
    Y,
    A
);
    // Module ports
    output Y;
    input  A;
     sky130_fd_sc_hd__inv U (
    Y,
    A
);
endmodule
module sky130_fd_sc_hd__inv_2 (
    Y,
    A
);
    // Module ports
    output Y;
    input  A;
     sky130_fd_sc_hd__inv U (
    Y,
    A
);
endmodule
module sky130_fd_sc_hd__inv_4 (
    Y,
    A
);
    // Module ports
    output Y;
    input  A;
     sky130_fd_sc_hd__inv U (
    Y,
    A
);
endmodule
module sky130_fd_sc_hd__nor4b (
    Y  ,
    A  ,
    B  ,
    C  ,
    D_N
);
    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;
    // Local signals
    wire not0_out  ;
    wire nor0_out_Y;
    //  Name  Output      Other arguments
    not not0 (not0_out  , D_N              );
    nor nor0 (nor0_out_Y, A, B, C, not0_out);
    buf buf0 (Y         , nor0_out_Y       );
endmodule

module sky130_fd_sc_hd__nor4b_1 (
    Y  ,
    A  ,
    B  ,
    C  ,
    D_N
);
    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;
    
    sky130_fd_sc_hd__nor4b U (
        Y  ,
        A  ,
        B  ,
        C  ,
        D_N );

endmodule

module sky130_fd_sc_hd__nor4b_2 (
    Y  ,
    A  ,
    B  ,
    C  ,
    D_N
);
    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;
    
    sky130_fd_sc_hd__nor4b U (
        Y  ,
        A  ,
        B  ,
        C  ,
        D_N );

endmodule
module sky130_fd_sc_hd__nor4b_4 (
    Y  ,
    A  ,
    B  ,
    C  ,
    D_N
);
    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C  ;
    input  D_N;
    
    sky130_fd_sc_hd__nor4b U (
        Y  ,
        A  ,
        B  ,
        C  ,
        D_N );

endmodule

module sky130_fd_sc_hd__and4 (
    X,
    A,
    B,
    C,
    D
);
    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;
    // Local signals
    wire and0_out_X;
    //  Name  Output      Other arguments
    and and0 (and0_out_X, A, B, C, D     );
    buf buf0 (X         , and0_out_X     );
endmodule

module sky130_fd_sc_hd__and4_1 (
    X,
    A,
    B,
    C,
    D
);
    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    input  D;
    
    sky130_fd_sc_hd__and4 U (
        X,
        A,
        B,
        C,
        D 
    );
endmodule

module sky130_fd_sc_hd__and4_2 ( output X, input  A, input  B, input  C, input  D );
        
    sky130_fd_sc_hd__and4 U ( X, A, B, C, D );

endmodule

module sky130_fd_sc_hd__and4_4 ( output X, input  A, input  B, input  C, input  D );
        
    sky130_fd_sc_hd__and4 U ( X, A, B, C, D );

endmodule


module sky130_fd_sc_hd__and4b (
    X  ,
    A_N,
    B  ,
    C  ,
    D
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;
    input  D  ;
    // Local signals
    wire not0_out  ;
    wire and0_out_X;
    //  Name  Output      Other arguments
    not not0 (not0_out  , A_N              );
    and and0 (and0_out_X, not0_out, B, C, D);
    buf buf0 (X         , and0_out_X       );
endmodule

module sky130_fd_sc_hd__and4b_1 (output X, input  A_N, input  B, input  C, input  D  );
    
    sky130_fd_sc_hd__and4b U ( X , A_N, B, C, D );

endmodule

module sky130_fd_sc_hd__and4b_2 (output X, input  A_N, input  B, input  C, input  D  );
    
    sky130_fd_sc_hd__and4b U ( X , A_N, B, C, D );
    
endmodule

module sky130_fd_sc_hd__and4b_4 (output X, input  A_N, input  B, input  C, input  D  );
    
    sky130_fd_sc_hd__and4b U ( X , A_N, B, C, D );
    
endmodule

module sky130_fd_sc_hd__clkbuf (
    X,
    A
);
    // Module ports
    output X;
    input  A;
    // Local signals
    wire buf0_out_X;
    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );

    specify
        (A +=> X ) = (0:0:0,0:0:0);  // delays are tris,tfall
    endspecify

endmodule

module sky130_fd_sc_hd__clkbuf_1 (output X, input A);
    sky130_fd_sc_hd__clkbuf U (X, A);

endmodule

module sky130_fd_sc_hd__clkbuf_2 (output X, input A);
    sky130_fd_sc_hd__clkbuf U (X, A);
endmodule

module sky130_fd_sc_hd__clkbuf_4 (output X, input A);
    sky130_fd_sc_hd__clkbuf U (X, A);
endmodule

module sky130_fd_sc_hd__clkbuf_8 (output X, input A);
    sky130_fd_sc_hd__clkbuf U (X, A);
endmodule

module sky130_fd_sc_hd__clkbuf_16 (output X, input A);
    sky130_fd_sc_hd__clkbuf U (X, A);
endmodule

module sky130_fd_sc_hd__nor3b (
    Y  ,
    A  ,
    B  ,
    C_N
);
    // Module ports
    output Y  ;
    input  A  ;
    input  B  ;
    input  C_N;
    // Local signals
    wire nor0_out  ;
    wire and0_out_Y;
    //  Name  Output      Other arguments
    nor nor0 (nor0_out  , A, B           );
    and and0 (and0_out_Y, C_N, nor0_out  );
    buf buf0 (Y         , and0_out_Y     );
endmodule

module sky130_fd_sc_hd__nor3b_1 (output Y, input  A, input  B, input  C_N);
    sky130_fd_sc_hd__nor3b U (.Y(Y) , .A(A) , .B(B), .C_N(C_N) );    
endmodule

module sky130_fd_sc_hd__nor3b_2 (output Y, input  A, input  B, input  C_N);
    sky130_fd_sc_hd__nor3b U (.Y(Y) , .A(A) , .B(B), .C_N(C_N) );    
endmodule

module sky130_fd_sc_hd__nor3b_4 (output Y, input  A, input  B, input  C_N);
    sky130_fd_sc_hd__nor3b U (.Y(Y) , .A(A) , .B(B), .C_N(C_N) );    
endmodule

module sky130_fd_sc_hd__and3 (
    X,
    A,
    B,
    C
);
    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    // Local signals
    wire and0_out_X;
    //  Name  Output      Other arguments
    and and0 (and0_out_X, C, A, B        );
    buf buf0 (X         , and0_out_X     );
endmodule

module sky130_fd_sc_hd__and3_1 (X, A, B, C);
    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    
    sky130_fd_sc_hd__and3 U (X, A, B,C);
endmodule

module sky130_fd_sc_hd__and3_2 (X, A, B, C);
    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    
    sky130_fd_sc_hd__and3 U (X, A, B,C);
endmodule

module sky130_fd_sc_hd__and3_4 (X, A, B, C);
    // Module ports
    output X;
    input  A;
    input  B;
    input  C;
    
    sky130_fd_sc_hd__and3 U (X, A, B,C);
endmodule

module sky130_fd_sc_hd__and3b (
    X  ,
    A_N,
    B  ,
    C
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;
    // Local signals
    wire not0_out  ;
    wire and0_out_X;
    //  Name  Output      Other arguments
    not not0 (not0_out  , A_N            );
    and and0 (and0_out_X, C, not0_out, B );
    buf buf0 (X         , and0_out_X     );
endmodule

module sky130_fd_sc_hd__and3b_1 (
    X  ,
    A_N,
    B  ,
    C
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;
    
    sky130_fd_sc_hd__and3b U (
    X  ,
    A_N,
    B  ,
    C );
endmodule

module sky130_fd_sc_hd__and3b_2 (
    X  ,
    A_N,
    B  ,
    C
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;
    
    sky130_fd_sc_hd__and3b U (X, A_N, B, C );
endmodule

module sky130_fd_sc_hd__and3b_4 (
    X  ,
    A_N,
    B  ,
    C
);
    // Module ports
    output X  ;
    input  A_N;
    input  B  ;
    input  C  ;
    
    sky130_fd_sc_hd__and3b U (X, A_N, B, C );
endmodule

module sky130_fd_sc_hd__mux4 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);
    // Module ports
    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;
    // Local signals
    wire mux_4to20_out_X;
    //                            Name       Output           Other arguments
    sky130_fd_sc_hd__udp_mux_4to2 mux_4to20 (mux_4to20_out_X, A0, A1, A2, A3, S0, S1);
    buf                           buf0      (X              , mux_4to20_out_X       );

    specify
if ((!A1&!A2&!A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&!A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&!A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&!A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((A1&A2&A3&!S0&!S1)) (A0 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A2&!A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A2&A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((!A0&A2&!A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((!A0&A2&A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A0&!A2&!A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A0&!A2&A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A0&A2&!A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A0&A2&A3&S0&!S1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&!A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&!A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A0&A1&!A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A0&A1&A3&!S0&S1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&!A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&!A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((A0&A1&!A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((A0&A1&A2&S0&S1)) (A3 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&!A2&A3&S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&A2&!A3&S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((!A0&A1&!A2&!A3&!S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&!A2&A3&!S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&!A2&A3&S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&!A3&!S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&!A3&S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&A3&!S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&!A3&!S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&A3&!S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&A3&S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&A2&!A3&!S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((A0&!A1&A2&!A3&S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((A0&!A1&A2&A3&!S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((A0&A1&!A2&A3&S1)) (S0 +=> X) = (0:0:0,0:0:0);
if ((A0&A1&A2&!A3&S1)) (S0 -=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&!A2&A3&S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&A2&!A3&!S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&A2&A3&!S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((!A0&!A1&A2&A3&S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&!A2&!A3&S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&!A3&!S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&!A3&S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((!A0&A1&A2&A3&!S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&!A3&!S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&A3&!S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((A0&!A1&!A2&A3&S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((A0&!A1&A2&A3&S0)) (S1 +=> X) = (0:0:0,0:0:0);
if ((A0&A1&!A2&!A3&!S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((A0&A1&!A2&!A3&S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((A0&A1&!A2&A3&!S0)) (S1 -=> X) = (0:0:0,0:0:0);
if ((A0&A1&A2&!A3&S0)) (S1 -=> X) = (0:0:0,0:0:0);
endspecify
endmodule

module sky130_fd_sc_hd__mux4_1 (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

 // Module ports
    output X ;
    input  A0;
    input  A1;
    input  A2;
    input  A3;
    input  S0;
    input  S1;

sky130_fd_sc_hd__mux4 U (
    X ,
    A0,
    A1,
    A2,
    A3,
    S0,
    S1
);

endmodule

module sky130_fd_sc_hd__conb_1 (
    HI,
    LO
);
    // Module ports
    output HI;
    output LO;
    //       Name       Output
    pullup   pullup0   (HI    );
    pulldown pulldown0 (LO    );
endmodule

module sky130_fd_sc_hd__mux2 (
    X ,
    A0,
    A1,
    S
);
    // Module ports
    output X ;
    input  A0;
    input  A1;
    input  S ;
    // Local signals
    wire mux_2to10_out_X;
    //                            Name       Output           Other arguments
    sky130_fd_sc_hd__udp_mux_2to1 mux_2to10 (mux_2to10_out_X, A0, A1, S      );
    buf                           buf0      (X              , mux_2to10_out_X);
endmodule

module sky130_fd_sc_hd__mux2_1 (
    output X ,
    input A0,
    input A1,
    input S
);

sky130_fd_sc_hd__mux2 U (
    X ,
    A0,
    A1,
    S
);

endmodule

primitive sky130_fd_sc_hd__udp_mux_2to1 (
    X ,
    A0,
    A1,
    S
);
    output X ;
    input  A0;
    input  A1;
    input  S ;
    table
     //  A0  A1  S  :  X
         0   0   ?  :  0   ;
         1   1   ?  :  1   ;
         0   ?   0  :  0   ;
         1   ?   0  :  1   ;
         ?   0   1  :  0   ;
         ?   1   1  :  1   ;
    endtable
endprimitive

module sky130_fd_sc_hd__dfrtp_1 (
    Q      ,
    CLK    ,
    D      ,
    RESET_B
);
    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    // Local signals
    wire buf_Q;
    wire RESET;
    //                          Delay       Name  Output  Other arguments
    not                                     not0 (RESET , RESET_B        );
    sky130_fd_sc_hd__udp_dff$PR `UNIT_DELAY dff0 (buf_Q , D, CLK, RESET  );
    buf                                     buf0 (Q     , buf_Q          );
endmodule
module sky130_fd_sc_hd__nor2_2 (
    Y,
    A,
    B
);
    // Module ports
    output Y;
    input  A;
    input  B;
    // Local signals
    wire nor0_out_Y;
    //  Name  Output      Other arguments
    nor nor0 (nor0_out_Y, A, B           );
    buf buf0 (Y         , nor0_out_Y     );
endmodule

module sky130_fd_sc_hd__dlymetal6s6s_1 (
    X,
    A
);
    // Module ports
    output X;
    input  A;
    // Local signals
    wire buf0_out_X;
    //  Name  Output      Other arguments
    buf buf0 (buf0_out_X, A              );
    buf buf1 (X         , buf0_out_X     );
    specify
        (A +=> X ) = (0:0:0,0:0:0);  // delays are tris,tfall
    endspecify
endmodule

module sky130_fd_sc_hd__fa (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN
);

    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;

    // Local signals
    wire or0_out     ;
    wire and0_out    ;
    wire and1_out    ;
    wire and2_out    ;
    wire nor0_out    ;
    wire nor1_out    ;
    wire or1_out_COUT;
    wire or2_out_SUM ;

    //  Name  Output        Other arguments
    or  or0  (or0_out     , CIN, B            );
    and and0 (and0_out    , or0_out, A        );
    and and1 (and1_out    , B, CIN            );
    or  or1  (or1_out_COUT, and1_out, and0_out);
    buf buf0 (COUT        , or1_out_COUT      );
    and and2 (and2_out    , CIN, A, B         );
    nor nor0 (nor0_out    , A, or0_out        );
    nor nor1 (nor1_out    , nor0_out, COUT    );
    or  or2  (or2_out_SUM , nor1_out, and2_out);
    buf buf1 (SUM         , or2_out_SUM       );

endmodule

module sky130_fd_sc_hd__fa_1 (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN
);

    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;

    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    sky130_fd_sc_hd__fa base (
        .COUT(COUT),
        .SUM(SUM),
        .A(A),
        .B(B),
        .CIN(CIN)
    );

endmodule

module sky130_fd_sc_hd__xor2_1 (
    X,
    A,
    B
);

    // Module ports
    output X;
    input  A;
    input  B;

    // Local signals
    wire xor0_out_X;

    //  Name  Output      Other arguments
    xor xor0 (xor0_out_X, B, A           );
    buf buf0 (X         , xor0_out_X     );

endmodule