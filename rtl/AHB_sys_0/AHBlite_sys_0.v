
`timescale 1ns/1ns

`ifndef AW
`define AW 32
`endif

`ifndef DW
`define DW 64
`endif

//`define DBG
module AHBlite_sys_0(
		input HCLK,
		input HRESETn,
     
		input [`AW-1: 0] M0_HADDR,
		input [`DW-1: 0] M0_HWDATA,
		input M0_HWRITE,
		input [1: 0] M0_HTRANS,
		input [2:0] M0_HSIZE,
		input [2:0]   M0_HBURST,
        input [3:0]   M0_HPROT,
        input M0_HMASTLOCK,
        input M0_HBUSREQ,
	    output M0_HGRANT,
		output M0_HREADY,

		input [`AW-1: 0] M1_HADDR,
		input [`DW-1: 0] M1_HWDATA,
		input M1_HWRITE,
		input [1: 0] M1_HTRANS,
		input [2:0] M1_HSIZE,
		input [2:0] M1_HBURST,
        input [3:0] M1_HPROT,
        input M1_HMASTLOCK,
        input M1_HBUSREQ,
        
		output M1_HGRANT,
		output M1_HREADY,

		output [`DW-1: 0] HRDATA,

		input wire [3: 0] fdi_S0,
		output wire [3: 0] fdo_S0,
		output wire [0: 0] fdoe_S0,
		output wire [0: 0] fsclk_S0,
		output wire [0: 0] fcen_S0,
		input wire [`DW-1: 0] SRAMRDATA_S1,
		output wire [7: 0] SRAMWEN_S1,
		output wire [`DW-1: 0] SRAMWDATA_S1,
		output wire [0: 0] SRAMCS0_S1,
		//output wire [0: 0] SRAMCS1_S1,
		//output wire [0: 0] SRAMCS2_S1,
		//output wire [0: 0] SRAMCS3_S1,
		output wire [9: 0] SRAMADDR_S1,
		input wire [15: 0] GPIOIN_S2,
		output wire [15: 0] GPIOOUT_S2,
		output wire [15: 0] GPIOPU_S2,
		output wire [15: 0] GPIOPD_S2,
		output wire [15: 0] GPIOOEN_S2,
		output wire [3:0] db_reg,
		input wire [0: 0] RsRx_SS0_S0,
		output wire [0: 0] RsTx_SS0_S0,
		output wire [0: 0] uart_irq_SS0_S0,
		input wire [0: 0] RsRx_SS0_S1,
		output wire [0: 0] RsTx_SS0_S1,
		output wire [0: 0] uart_irq_SS0_S1,
		input wire [0: 0] MSI_SS0_S2,
		output wire [0: 0] MSO_SS0_S2,
		output wire [0: 0] SSn_SS0_S2,
		output wire [0: 0] SCLK_SS0_S2,
		input wire [0: 0] MSI_SS0_S3,
		output wire [0: 0] MSO_SS0_S3,
		output wire [0: 0] SSn_SS0_S3,
		output wire [0: 0] SCLK_SS0_S3,
		input wire [0: 0] scl_i_SS0_S4,
		output wire [0: 0] scl_o_SS0_S4,
		output wire [0: 0] scl_oen_o_SS0_S4,
		input wire [0: 0] sda_i_SS0_S4,
		output wire [0: 0] sda_o_SS0_S4,
		output wire [0: 0] sda_oen_o_SS0_S4,
		input wire [0: 0] scl_i_SS0_S5,
		output wire [0: 0] scl_o_SS0_S5,
		output wire [0: 0] scl_oen_o_SS0_S5,
		input wire [0: 0] sda_i_SS0_S5,
		output wire [0: 0] sda_o_SS0_S5,
		output wire [0: 0] sda_oen_o_SS0_S5,
		output wire [0: 0] pwm_SS0_S6,
		output wire [0: 0] pwm_SS0_S7,

		output wire [31:0] IRQ
	);
        
	assign M0_HREADY = M_HREADY & M0_HGRANT_OLD;
	assign M1_HREADY = M_HREADY & M1_HGRANT_OLD;

	reg M0_HGRANT_OLD, M1_HGRANT_OLD;
	always @(posedge HCLK) begin
		M0_HGRANT_OLD <= M0_HGRANT;
		M1_HGRANT_OLD <= M1_HGRANT;
	end

	assign HRDATA = M_HRDATA;

	//Inputs
	wire HSEL_S0, HSEL_S1, HSEL_S2;

	//Outputs
    wire [`DW-1:0]   HRDATA_S0, HRDATA_S1, HRDATA_S2, HRDATA_S3, HRDATA;
	wire  HREADY_S0, HREADY_S1, HREADY_S2, HREADY_S3, HREADY;
	wire [1:0]   HRESP_S3;
	
	wire [`DW-1:0] M_HRDATA;
	wire M_HREADY, M_HRESP;

	wire [`AW-1:0] S_HADDR;
	wire [`DW-1:0] S_HWDATA;
	wire S_HWRITE;
	wire [1:0] S_HTRANS;
	wire [2:0] S_HSIZE, S_HBURST;
	wire S_HREADY;

	wire [15: 0] WGPIODIN_S2;
	wire [15: 0] WGPIODOUT_S2;
	wire [15: 0] WGPIOPU_S2;
	wire [15: 0] WGPIOPD_S2;
	wire [15: 0] WGPIODIR_S2;

	amba_ahb_m2s4 arbiter (
		.HRESETn(HRESETn),
      	.HCLK(HCLK),
		
		// Master 0
      	.M0_HBUSREQ(M0_HBUSREQ),
        .M0_HGRANT(M0_HGRANT),
		.M0_HBURST(M0_HBURST),
    	.M0_HPROT(M0_HPROT),
	    .M0_HLOCK(M0_HMASTLOCK),

      	.M0_HADDR(M0_HADDR),
      	.M0_HTRANS(M0_HTRANS),
    	.M0_HSIZE(M0_HSIZE),
    	.M0_HWRITE(M0_HWRITE),
    	.M0_HWDATA(M0_HWDATA),

		// Master 1
      	.M1_HBUSREQ(M1_HBUSREQ),
    	.M1_HGRANT(M1_HGRANT),
  		.M1_HBURST(M1_HBURST),
      	.M1_HPROT(M1_HPROT),
    	.M1_HLOCK(M1_HMASTLOCK),

      	.M1_HADDR(M1_HADDR),
    	.M1_HTRANS(M1_HTRANS),
      	.M1_HSIZE(M1_HSIZE),
      	.M1_HWRITE(M1_HWRITE),
		.M1_HWDATA(M1_HWDATA),

		// Master Outputs
    	.M_HRDATA(M_HRDATA),
      	.M_HREADY(M_HREADY),
		.M_HRESP(),
		
		// Slave Outputs
    	.S_HADDR(S_HADDR),
      	.S_HWRITE(S_HWRITE),
      	.S_HTRANS(S_HTRANS),
      	.S_HSIZE(S_HSIZE),
      	.S_HBURST(S_HBURST),
    	.S_HWDATA(S_HWDATA),
      	.S_HREADY(S_HREADY),
		.S_HPROT(),
      	.S_HMASTER(),
      	.S_HMASTLOCK(),

		// Slave 0 - Flash
      	.S0_HSEL(HSEL_S0),
        .S0_HREADY(HREADY_S0),
        .S0_HRDATA(HRDATA_S0),
	    .S0_HRESP(),
       	.S0_HSPLIT(),

		// Slave 1 - AHBSRAM
		.S1_HSEL(HSEL_S1),
        .S1_HREADY(HREADY_S1),
       	.S1_HRDATA(HRDATA_S1),
		.S1_HRESP(),
        .S1_HSPLIT(),

		// Slave 2 - APB Bridge
		.S2_HSEL(HSEL_S2),
        .S2_HREADY(HREADY_S2),
       	.S2_HRDATA(HRDATA_S2),
		.S2_HRESP(),
        .S2_HSPLIT(),

		// Slave 3 - GPIO
		.S3_HSEL(HSEL_S3),
        .S3_HREADY(HREADY_S3),
       	.S3_HRDATA(HRDATA_S3),
		.S3_HRESP(HRESP_S3),
        .S3_HSPLIT(),
        .REMAP(1'b0)
	);

	//Digital module # 0
	QSPI_XIP_CTRL S0 ( 
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S0),
		.HADDR(S_HADDR),
		.HREADY(S_HREADY),
		.HWRITE(S_HWRITE),
		.HTRANS(S_HTRANS),
		.HRDATA(HRDATA_S0),
		.HREADYOUT(HREADY_S0),
		.din(fdi_S0),
		.dout(fdo_S0),
		.douten(fdoe_S0),
		.sck(fsclk_S0),
		.ce_n(fcen_S0)
	);

	//Digital module # 1
	AHBSRAM S1 ( 
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S1),
		.HADDR(S_HADDR),
		.HREADY(S_HREADY),
		.HWRITE(S_HWRITE),
		.HTRANS(S_HTRANS),
		.HSIZE(S_HSIZE),
		.HWDATA(S_HWDATA),
		.HRDATA(HRDATA_S1),
		.HREADYOUT(HREADY_S1),
		.SRAMRDATA(SRAMRDATA_S1),
		.SRAMWEN(SRAMWEN_S1),
		.SRAMWDATA(SRAMWDATA_S1),
		.SRAMCS0(SRAMCS0_S1),
		.SRAMADDR(SRAMADDR_S1)
	);

	// SubSystem Instantiation #0 
	// Slave #2
	wire [31:0] HRDATA_S2_32;
	wire [31:0] S2_HWDATA_32;

	AHBlite_64bit_bridge apb_bridge (
		.HCLK(HCLK),
		.HTRANS(S_HTRANS),
		.HWDATA_64(S_HWDATA),
		.HADDR(S_HADDR),
		.HRDATA_32(HRDATA_S2_32),
		.HRDATA_64(HRDATA_S2),
		.HWDATA_32(S2_HWDATA_32)
	);

    apb_sys_0 apb_sys_inst_0(
        // Global signals 
        .HCLK(HCLK),
        .HRESETn(HRESETn),
    
        // AHB Slave inputs 
        .HADDR(S_HADDR),
        .HTRANS(S_HTRANS),
        .HWRITE(S_HWRITE),
        .HWDATA(S2_HWDATA_32),
        .HSEL(HSEL_S2),
        .HREADY(S_HREADY),
    
        // AHB Slave outputs 
        .HRDATA(HRDATA_S2_32),
        .HREADYOUT(HREADY_S2),
		.RsRx_S0(RsRx_SS0_S0),
		.RsTx_S0(RsTx_SS0_S0),

		.RsRx_S1(RsRx_SS0_S1),
		.RsTx_S1(RsTx_SS0_S1),

		.MSI_S2(MSI_SS0_S2),
		.MSO_S2(MSO_SS0_S2),
		.SSn_S2(SSn_SS0_S2),
		.SCLK_S2(SCLK_SS0_S2),

		.MSI_S3(MSI_SS0_S3),
		.MSO_S3(MSO_SS0_S3),
		.SSn_S3(SSn_SS0_S3),
		.SCLK_S3(SCLK_SS0_S3),

		.scl_i_S4(scl_i_SS0_S4),
		.scl_o_S4(scl_o_SS0_S4),
		.scl_oen_o_S4(scl_oen_o_SS0_S4),
		.sda_i_S4(sda_i_SS0_S4),
		.sda_o_S4(sda_o_SS0_S4),
		.sda_oen_o_S4(sda_oen_o_SS0_S4),

		.scl_i_S5(scl_i_SS0_S5),
		.scl_o_S5(scl_o_SS0_S5),
		.scl_oen_o_S5(scl_oen_o_SS0_S5),
		.sda_i_S5(sda_i_SS0_S5),
		.sda_o_S5(sda_o_SS0_S5),
		.sda_oen_o_S5(sda_oen_o_SS0_S5),

		.pwm_S6(pwm_SS0_S6),
		.pwm_S7(pwm_SS0_S7),

		.IRQ(IRQ[31:16])
    );

	//Digital module # 2
	GPIO S2 ( 
		.WGPIODIN(WGPIODIN_S2),
		.WGPIODOUT(WGPIODOUT_S2),
		.WGPIOPU(WGPIOPU_S2),
		.WGPIOPD(WGPIOPD_S2),
		.WGPIODIR(WGPIODIR_S2),
		.GPIOIN(GPIOIN_S2),
		.GPIOOUT(GPIOOUT_S2),
		.GPIOPU(GPIOPU_S2),
		.GPIOPD(GPIOPD_S2),
		.GPIOOEN(GPIOOEN_S2)
	);
	
	//AHB Slave # 3
	wire [31:0] HRDATA_S3_32;
	wire [31:0] S_HWDATA_32;

	AHBlite_64bit_bridge gpio_bridge (
		.HCLK(HCLK),
		.HTRANS(S_HTRANS),
		.HWDATA_64(S_HWDATA),
		.HADDR(S_HADDR),
		.HRDATA_32(HRDATA_S3_32),
		.HRDATA_64(HRDATA_S3),
		.HWDATA_32(S_HWDATA_32)
	);

	AHBlite_GPIO S_2 (
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		.HSEL(HSEL_S3),
		.HADDR(S_HADDR[23:2]),
		.HWRITE(S_HWRITE),
		.HTRANS(S_HTRANS),
		.HSIZE(S_HSIZE),
		.HWDATA(S_HWDATA_32),
		.HREADY(S_HREADY),
		.HREADYOUT(HREADY_S3),
		.HRDATA(HRDATA_S3_32),
		.HRESP(HRESP_S3), 

		.WGPIODIN(WGPIODIN_S2),
		.WGPIODOUT(WGPIODOUT_S2),
		.WGPIOPU(WGPIOPU_S2),
		.WGPIOPD(WGPIOPD_S2),
		.WGPIODIR(WGPIODIR_S2),

		.IRQ(IRQ[15:0])
	);

`ifdef DBG
    always @(posedge HCLK)
	if(HTRANS[1] & HREADY)
        $display("Mem request (%d) A:%X" HWRITE HADDR);
`endif
endmodule
        