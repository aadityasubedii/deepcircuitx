`ifndef HEVCD_TOP
`timescale 1ns/1ps

module test_intra_pred_dec
#(
parameter                       BDEPTH = 10
);

`ifndef BATCH
//`define INTRA_CHROMA
`endif

`endif

`ifndef FODIR
`define FODIR "../../hm/HM-13.0/bin/"
`endif

`ifndef INTRA_CHROMA
`define FSUF                    ""
`else
`define FSUF                    "_C"
`endif

`ifndef TREG
`define TREG reg
`endif

`TREG   [(BDEPTH+1)*16-1:0]     ri_res;
`TREG                           ri_res_val;
wire                            ri_res_rdy;

`TREG   [(BDEPTH)*16-1:0]       ri_pred;
`TREG                           ri_pred_val;
wire                            ri_pred_rdy;

wire    [BDEPTH*16-1:0]         ir_recon;


`ifndef HEVCD_TOP
wire                            clk, arst_n, rst_n;
M_gpe_top gp(
  .clk                          (clk),
  .arst_n                       (arst_n),
  .rst_n                        (rst_n),
  .eos                          (fo_cabad_tu.eof)
);

reg                             fifo_qi_tu_c_val;
wire                            fifo_qi_tu_c_rdy;

initial begin: fo_ri_res
  integer                       fc, r, i, j;
  reg   [8*1024-1:0]            l;
  reg   [(BDEPTH+1)-1:0]        resi[3:0][3:0];
  
  fc = $fopen({`FODIR,"FO_INTRA_resSample",`FSUF,".txt"},"r");
  ri_res_val <= 0;
  #({$random}%1000) @ (posedge clk)
  forever begin
    while({$random}%10>=8) @ (posedge clk) ri_res_val <= 0;       //>=8
    for(i = 0; i < 4; i = i + 1)
      for(j = 0; j < 4; j = j + 1) begin
        r = $fscanf(fc, "%h", resi[i][j]);
        ri_res = {ri_res,resi[i][j]};
      end
    r = $fgets(l, fc);
    ri_res_val <= 1;
    @ (posedge clk) while(!ri_res_rdy) @ (posedge clk);
    ri_res_val <= 0;
  end
end

initial begin: fo_ri_pred
  integer                       fc, r, i, j;
  reg   [8*1024-1:0]            l;
  reg   [(BDEPTH)-1:0]          pred[3:0][3:0];
  
  fc = $fopen({`FODIR,"FO_INTRA_pred_inter",`FSUF,".txt"},"r");
  ri_pred_val <= 0;
  #({$random}%1000) @ (posedge clk)
  forever begin
    while({$random}%10>=10) @ (posedge clk) ri_pred_val <= 0;        //>=8
    for(i = 0; i < 4; i = i + 1)
      for(j = 0; j < 4; j = j + 1) begin
        r = $fscanf(fc, "%h", pred[i][j]);
        ri_pred = {ri_pred,pred[i][j]};
      end
    r = $fgets(l, fc);
    ri_pred_val <= 1;
    @ (posedge clk) while(!intra.inter_pred_rdy) @ (posedge clk);
    ri_pred_val <= 0;
  end
    
end

`TREG   [8:0]                   xCtb;
`TREG   [8:0]                   yCtb;
`TREG   [2:0]                   tuSize;
`TREG   [3:0]                   xTb;
`TREG   [3:0]                   yTb;
`TREG   [1:0]                   cuPredMode;
`TREG                           isPcm;
`TREG   [5:0]                   lumaMode;
`TREG   [5:0]                   chromaMode;

`define HI(VV) \
  r = $fscanf(fc, "%h ", VV); r = $fgets(l, fc);

`define HS(NN) \
  repeat(NN) r = $fgets(l, fc);

`define HI_TU begin \
  `HI(xCtb) \
  `HI(yCtb) \
  `HS(3) \
  `HI(tuSize) \
  `HI(xTb) \
  `HI(yTb) \
  `HS(3) \
  `HI(lumaMode) \
  `HI(chromaMode) \
  `HS(4) \
  `HI(cuPredMode) \
  `HI(isPcm) \
end

initial begin: fo_cabad_tu
  integer                       fc, r;
  reg   [8*1024-1:0]            l;
  reg                           eof;

  fc = $fopen({`FODIR,"FO_CABAD_IQIT_TU.txt"},"r");
  fifo_qi_tu_c_val = 0; eof = 0;
  #({$random}%1000) @ (posedge clk)
  forever begin
    while({$random}%10>=2) @ (posedge clk);     //>=2
    `HI_TU
`ifdef INTRA_CHROMA
    if(tuSize == 2) repeat(3) `HI_TU
`endif
    if($feof(fc)) #5000 $stop;
    fifo_qi_tu_c_val = 1;
    @ (posedge clk) 
    while(!fifo_qi_tu_c_rdy) @ (posedge clk);
    
    eof =
      (xCtb<<4)+(xTb<<2)+(1<<tuSize) == gp.gp_pic_width_in_luma_samples &&
      (yCtb<<4)+(yTb<<2)+(1<<tuSize) == gp.gp_pic_height_in_luma_samples;
    {xCtb, yCtb, tuSize, xTb, yTb, cuPredMode, isPcm, lumaMode, chromaMode} = 'hX;
    fifo_qi_tu_c_val = 0;
    if(eof) begin
      wait(!rst_n);
      eof = 0;
      wait( rst_n);
      #({$random}%1000) @ (posedge clk);
    end
  end
end

`undef HI
`undef HS
`undef HI_TU

`endif


`ifndef PGP
`define PGP(NAME) (gp.``NAME``)
`endif

intra_top
`ifndef HEVCD_TOP
#(
`ifndef INTRA_CHROMA
  .isChroma                     (1'b0),
`else
  .isChroma                     (1'b1),
`endif
  .bitDepthY                    (BDEPTH)
)
`endif
intra (
  .clk                          (clk),
  .arst_n                       (arst_n),
  .rst_n                        (rst_n),
  
  .pic_width_in_luma_samples    ({1'b0,`PGP(gp_pic_width_in_luma_samples)}),
  .pic_height_in_luma_samples   `PGP(gp_pic_height_in_luma_samples),
  .first_ctu_in_slice_x         `PGP(gp_first_ctb_in_slice_x),
  .first_ctu_in_slice_y         `PGP(gp_first_ctb_in_slice_y),
  .first_ctu_in_tile_x          `PGP(gp_first_ctb_in_tile_x),
  .first_ctu_in_tile_y          `PGP(gp_first_ctb_in_tile_y),
  .last_ctu_in_tile_x           `PGP(gp_last_ctb_in_tile_x),
  .last_ctu_in_tile_y           `PGP(gp_last_ctb_in_tile_y),
  .nMaxCUlog2                   `PGP(gp_ctbLog2SizeY),
`ifdef INTRA_CHROMA
  .gp_bitDepth					`PGP(gp_bitDepthC),
`else
  .gp_bitDepth					`PGP(gp_bitDepthY),
`endif
  
`ifndef HEVCD_TOP
`ifndef INTRA_CHROMA
  .mode                         (lumaMode),
`else
  .mode                         (chromaMode),
`endif
  .xCtb                         (xCtb),
  .yCtb                         (yCtb),
  .xTb_rela                     (xTb),
  .yTb_rela                     (yTb),
  .intra_cuPredMode             (cuPredMode),
  .isPcm                        (isPcm),
  .tuSizeLog2                   (tuSize),
`else
`ifndef INTRA_CHROMA
  .mode                         (fifo_qi_tu_c[21:16]),
`else
  .mode                         (fifo_qi_tu_c[15:10]),
`endif
  .xCtb                         (fifo_qi_tu_c[64:56]),
  .yCtb                         (fifo_qi_tu_c[55:47]),
  .xTb_rela                     (fifo_qi_tu_c[32:29]),
  .yTb_rela                     (fifo_qi_tu_c[28:25]),
  .intra_cuPredMode             (fifo_qi_tu_c[ 2: 1]),
  .isPcm                        (fifo_qi_tu_c[    0]),
  .tuSizeLog2                   (fifo_qi_tu_c[35:33]),
`endif

  .cabad_intra_val              (fifo_qi_tu_c_val),
  .cabad_intra_rdy              (fifo_qi_tu_c_rdy),
  
  .residuals                    (ri_res),
  .resi_val                     (ri_res_val),
  .resi_rdy                     (ri_res_rdy),
  .r_reconSamples               (ir_recon),
  .predSamples_inter            (ri_pred),
  .inter_pred_rdy               (),
  .inter_pred_val               ()                      //it doesn't connect to any part of INTRA. it's a pseudo port. 
);


initial begin: ho_ir_recon
  integer                       fp, fc, r, i, j;
  reg   [8*1024-1:0]            l;
  reg   [BDEPTH-1:0]            recon [3:0][3:0];
  reg   [BDEPTH-1:0]            t;
  reg                           recon_en;
  
  fp = $fopen({"HO_INTRA",`FSUF,".txt"},"w");
  fc = $fopen({`FODIR,"FO_INTRA",`FSUF,".txt"},"r");
  recon_en <= 0;
  forever @ (posedge clk) begin
    recon_en <= ri_res_rdy && ri_res_val;
    if(recon_en) begin
      for(i = 0; i < 4; i = i + 1)
        for(j = 0; j < 4; j = j + 1) begin
          recon[i][j] = ir_recon >> ((15-4*i-j)*BDEPTH);
          $fwrite(fp, "%d ", recon[i][j]);
          r = $fscanf(fc, "%d", t);
          if(recon[i][j] != t) begin
            $write("\n\nAt time %d DBGR: FO/HO mismatch detected: ", $time); $write("recon[%0d][%0d]\n\n",i,j); $stop;
          end
        end
        r = $fgets(l, fc);
        if(!intra.l3_isInter) begin
`ifndef INTRA_CHROMA
            $fwrite(fp, "//X=%d, Y=%d, mode=%d, xTb=%d, yTb=%d, nTB=%d\n",
              intra.l3_X, intra.l3_Y, intra.l3_mode, intra.l3_xTb, intra.l3_yTb, 1<<intra.l3_tuSize);
`else
            $fwrite(fp, "//X=%d, Y=%d, mode=%d, xTb=%d, yTb=%d, isCr=%d, nTB=%d\n",
              intra.l3_X, intra.l3_Y, intra.l3_mode, intra.l3_xTb, intra.l3_yTb, (intra.l3_cIdx == 2 ? 1'b1: 1'b0), 1<<intra.l3_tuSize);
`endif
        end
        else begin
`ifndef INTRA_CHROMA
                $fwrite(fp, "//X=%d, Y=%d, xTb=%d, yTb=%d, nTB=%d\n",
                  intra.l3_X, intra.l3_Y, intra.l3_xTb, intra.l3_yTb, 1<<intra.l3_tuSize);
`else
                $fwrite(fp, "//X=%d, Y=%d, xTb=%d, yTb=%d, isCr=%d, nTB=%d\n",
                  intra.l3_X, intra.l3_Y, intra.l3_xTb, intra.l3_yTb, (intra.l3_cIdx == 2 ? 1'b1: 1'b0), 1<<intra.l3_tuSize);
`endif
        end
    end
  end
end


`undef FSUF


`ifndef HEVCD_TOP
endmodule
`endif



