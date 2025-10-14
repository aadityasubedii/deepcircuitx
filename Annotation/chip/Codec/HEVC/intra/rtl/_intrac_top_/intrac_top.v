`timescale 1ns/1ps


module intrac_top(
	  clk,
	  arst_n,
	  rst_n,
	  mode,
	  pic_width_in_luma_samples,
	  pic_height_in_luma_samples,
	  first_ctu_in_slice_x,
	  first_ctu_in_slice_y,
	  first_ctu_in_tile_x,
	  first_ctu_in_tile_y,
	  last_ctu_in_tile_x,
	  last_ctu_in_tile_y,
	  xCtb,					//Coordinate x, y of CTB upper-left pixel >> 4
	  yCtb,
	  xTb_rela,				//Coordinate x, y of TB in CTB upper-left pixel >> 2
	  yTb_rela,
	residuals     //i
	,predSamples_inter
	,r_reconSamples    //o
	,tuSizeLog2
	,nMaxCUlog2
	,intra_cuPredMode
	,isPcm
	,resi_val
	,resi_rdy
	,cabad_intra_val			//i
	,cabad_intra_rdy			//o
	,inter_pred_rdy
	,inter_pred_val
	,gp_bitDepth
);

	parameter bitDepthY		=10;
    parameter isChroma      =1;

	input 	[8:0]					xCtb,yCtb;  
	input 	[3:0]					xTb_rela,yTb_rela;
	input 							clk,rst_n,arst_n; 
	input	[13:0]					pic_width_in_luma_samples;
	input	[12:0]					pic_height_in_luma_samples;
	input   [8:0]           		first_ctu_in_slice_x;
	input   [8:0]           		first_ctu_in_slice_y;
	input   [8:0]          			first_ctu_in_tile_x;
	input   [8:0]           		first_ctu_in_tile_y;
	input   [8:0]           		last_ctu_in_tile_x;
	input   [8:0]           		last_ctu_in_tile_y;
	
	input 	[2:0] 					nMaxCUlog2;
	input 	[5:0]					mode;
	input 	[2:0] 					tuSizeLog2;
	input 	[(bitDepthY+1)*16-1:0] 	residuals;
	input							cabad_intra_val;
	input							isPcm;
	input	[1:0]					intra_cuPredMode;
	input						 	resi_val;
	input 	[bitDepthY*16-1:0]		predSamples_inter;
	input							inter_pred_val;
	
	input	[3:0]					gp_bitDepth;
	
	output 							resi_rdy; 
	output 	 [bitDepthY*16-1:0] 	r_reconSamples;	
	output 							cabad_intra_rdy;
	output							inter_pred_rdy;


intra_top #(
  .isChroma                     (isChroma),
  .bitDepthY                    (bitDepthY)
) intra (
  .clk                          (clk),
  .arst_n                       (arst_n),
  .rst_n                        (rst_n),
  
  .pic_width_in_luma_samples    (pic_width_in_luma_samples),
  .pic_height_in_luma_samples   (pic_height_in_luma_samples),
  .first_ctu_in_slice_x         (first_ctu_in_slice_x),
  .first_ctu_in_slice_y         (first_ctu_in_slice_y),
  .first_ctu_in_tile_x          (first_ctu_in_tile_x),
  .first_ctu_in_tile_y          (first_ctu_in_tile_y),
  .last_ctu_in_tile_x           (last_ctu_in_tile_x),
  .last_ctu_in_tile_y           (last_ctu_in_tile_y),
  .nMaxCUlog2                   (nMaxCUlog2),
  .gp_bitDepth					(gp_bitDepth),
  .mode                         (mode),
  .xCtb                         (xCtb),
  .yCtb                         (yCtb),
  .xTb_rela                     (xTb_rela),
  .yTb_rela                     (yTb_rela),
  .intra_cuPredMode             (intra_cuPredMode),
  .isPcm                        (isPcm),
  .tuSizeLog2                   (tuSizeLog2),
  .cabad_intra_val              (cabad_intra_val),
  .cabad_intra_rdy              (cabad_intra_rdy),
  .residuals                    (residuals),
  .resi_val                     (resi_val),
  .resi_rdy                     (resi_rdy),
  .r_reconSamples               (r_reconSamples),
  .predSamples_inter            (predSamples_inter),
  .inter_pred_rdy               (),
  .inter_pred_val               ()        //it doesn't connect to any part of INTRA. it's a pseudo port. 
);

endmodule