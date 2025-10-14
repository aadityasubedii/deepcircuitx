module control(in,func,regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop1,aluop2,nis0,nis1,nis2);
input [5:0] in,func;
output regdest,alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop1,aluop2,nis0,nis1,nis2;
wire rformat,lw,sw,beq;
wire bmv,balrn,jmadd,bz,srlv,jsp;

assign rformat=~|in;
assign lw=in[5]& (~in[4])&(~in[3])&(~in[2])&in[1]&in[0];
assign sw=in[5]& (~in[4])&in[3]&(~in[2])&in[1]&in[0];
assign beq=~in[5]& (~in[4])&(~in[3])&in[2]&(~in[1])&(~in[0]);

assign bmv=~in[5]& in[4]&(~in[3])&in[2]&in[1]&(~in[0]); // 010110 opcode = 22
assign balrn=~in[5]& (~in[4])&(~in[3])&(~in[2])&(~in[1])&(~in[0])&(~func[5])&(func[4])&(~func[3])&(func[2])&(func[1])&(func[0]); // 010111  func code = 23
assign jmadd=~in[5]& (~in[4])&(~in[3])&(~in[2])&(~in[1])&(~in[0])&(func[5])&(~func[4])&(~func[3])&(~func[2])&(~func[1])&(~func[0]); // 100000  func code = 32
assign bz=~in[5]& in[4]&in[3]&(~in[2])&(~in[1])&(~in[0]); // 011000 opcode = 24
assign jmadd=~in[5]& (~in[4])&(~in[3])&(~in[2])&(~in[1])&(~in[0])&(~func[5])&(~func[4])&(~func[3])&(func[2])&(func[1])&(~func[0]); // 000110  func code = 6
assign jsp=~in[5]& in[4]&(~in[3])&(~in[2])&in[1]&(~in[0]); // 010010 opcode = 18

assign regdest=rformat;
assign alusrc=lw|sw|bmv|jsp;
assign memtoreg=lw|bmv|jmadd|jsp;
assign regwrite=rformat|lw|balrn|jmadd|srlv;
assign memread=lw|bmv|jmadd|jsp;
assign memwrite=sw;
assign branch=beq;
assign aluop1=rformat;
assign aluop2=beq;


assign nis0 = beq|bmv|srlv|balrn;
assign nis1 = beq|bz|srlv|jsp|jmadd;
assign nis2 = beq|jsp|balrn|jmadd;

endmodule
