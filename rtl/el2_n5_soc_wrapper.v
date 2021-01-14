/*
        A Wrapper for EL2 to simplify its bus interfaces.
        Mohamed Shalan

*/
module el2_n5_soc_wrapper (
    input  wire         HCLK,							// System clock
    input  wire         HRESETn,						// System Reset, active low

    // AHB-LITE MASTER PORT for Instructions
    output wire [31:0]  M0_HADDR,				// AHB transaction address
    output wire [ 2:0]  M0_HSIZE,				// AHB size: byte, half-word or word
    output wire [ 1:0]  M0_HTRANS,				// AHB transfer: non-sequential only
    output wire [63:0]  M0_HWDATA,				// AHB write-data
    output wire         M0_HWRITE,				// AHB write control
    output wire [2:0]   M0_HBURST,
    output wire [3:0]   M0_HPROT,
    output wire         M0_HMASTLOCK,
    output           M0_HBUSREQ,

    input  wire [63:0]  M0_HRDATA,				// AHB read-data
    input  wire         M0_HREADY,				// AHB stall signal
    input  wire         M0_HGRANT,				

    // AHB-LITE MASTER PORT for LSU 
    output wire [31:0]  M1_HADDR,
    output wire [ 2:0]  M1_HSIZE,				// AHB size: byte, half-word or word
    output wire [ 1:0]  M1_HTRANS,				// AHB transfer: non-sequential only
    output wire [63:0]  M1_HWDATA,				// AHB write-data
    output wire         M1_HWRITE,				// AHB write control
    output wire [2:0]   M1_HBURST,
    output wire [3:0]   M1_HPROT,
    output wire         M1_HMASTLOCK,
    output           M1_HBUSREQ,

    input  wire [63:0]  M1_HRDATA,				// AHB read-data
    input  wire         M1_HREADY,				// AHB stall signal
    input  wire         M1_HGRANT,				

    // MISCELLANEOUS 
    input  wire         NMI,				// Non-maskable interrupt input
    input  wire         EXT_IRQ,				// Interrupt request line
    input wire [14:0]   IRQ, 
    input  wire [23:0]	SYSTICKCLKDIV

);

assign M0_HBUSREQ = M0_HTRANS[1];
assign M1_HBUSREQ = M1_HTRANS[1];

el2_swerv_wrapper el2 ( 
        .clk(HCLK), 
        .rst_l(HRESETn), 
        .dbg_rst_l(HRESETn), 
        
        .rst_vec(31'b0), 
        .nmi_int(1'b0), 
        .nmi_vec(31'b0),
/*
        jtag_id, trace_rv_i_insn_ip, trace_rv_i_address_ip, 
        trace_rv_i_valid_ip, trace_rv_i_exception_ip, trace_rv_i_ecause_ip, 
        trace_rv_i_interrupt_ip, trace_rv_i_tval_ip, 
*/        
        .haddr(M0_HADDR), 
        .hburst(M0_HBURST), //
        .hmastlock(M0_HMASTLOCK), //
        .hprot(M0_HPROT), 
        .hsize(M0_HSIZE), 
        .htrans(M0_HTRANS), 
        .hwrite(M0_HWRITE), 
        .hrdata(M0_HRDATA), 
        .hready(M0_HREADY), 
        .hresp(1'b0), 
        
        .lsu_haddr(M1_HADDR), 
        .lsu_hburst(M1_HBURST),
        .lsu_hmastlock(M1_HMASTLOCK),
        .lsu_hprot(M1_HPROT),
        .lsu_hsize(M1_HSIZE),
        .lsu_htrans(M1_HTRANS), 
        .lsu_hwrite(M1_HWRITE),
        .lsu_hwdata(M1_HWDATA),
        .lsu_hrdata(M1_HRDATA),
        .lsu_hready(M1_HREADY),
        .lsu_hresp(1'b0), 
        
        /*
        sb_haddr, 
        sb_hburst, sb_hmastlock, sb_hprot, sb_hsize, sb_htrans, sb_hwrite, 
        sb_hwdata, sb_hrdata, sb_hready, sb_hresp, 
        
        dma_hsel, dma_haddr, 
        dma_hburst, dma_hmastlock, dma_hprot, dma_hsize, dma_htrans, 
        dma_hwrite, dma_hwdata, dma_hreadyin, dma_hrdata, dma_hreadyout, 
        dma_hresp, 
        
        lsu_bus_clk_en, ifu_bus_clk_en, dbg_bus_clk_en, 
        dma_bus_clk_en, 
        
        dccm_ext_in_pkt, iccm_ext_in_pkt, ic_data_ext_in_pkt, 
        ic_tag_ext_in_pkt, timer_int, soft_int, extintsrc_req, 
        dec_tlu_perfcnt0, dec_tlu_perfcnt1, dec_tlu_perfcnt2, dec_tlu_perfcnt3, 
        
        jtag_tck, jtag_tms, jtag_tdi, jtag_trst_n, jtag_tdo, core_id, 
        
        mpc_debug_halt_req, mpc_debug_run_req, mpc_reset_run_req, 
        mpc_debug_halt_ack, mpc_debug_run_ack, 
        
        debug_brkpt_status, 
        i_cpu_halt_req, o_cpu_halt_ack, o_cpu_halt_status, o_debug_mode_status, 
        i_cpu_run_req, o_cpu_run_ack, scan_mode, mbist_mode */
        
        .sb_hresp(1'b0),
        .sb_hready(1'b1),
        
        .core_id('b0),

        .ifu_bus_clk_en(1'b1),
        .lsu_bus_clk_en(1'b1),
        .dbg_bus_clk_en(1'b0), 
        .dma_bus_clk_en(1'b0), 
        
        .dma_hreadyin(1'b1),
//        .dma_hresp(0),
        
        .jtag_trst_n(HRESETn),
        .jtag_tms(1'b0),

        .i_cpu_halt_req(1'b0),
        .i_cpu_run_req(1'b0),

        .scan_mode(1'b0),
        .mbist_mode(1'b0),
        
        .mpc_reset_run_req(1'b1),
        .mpc_debug_run_req(1'b0),
        .mpc_debug_halt_req(1'b0),
        
        .timer_int(1'b0), 
        .soft_int(1'b0), 
        .extintsrc_req('b0)
    );



endmodule
