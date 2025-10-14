/*
notepad++ 
安装插件--fingerText,
步骤：
1->open snippet editor
2->new snippet
3->trigger text
	比如；将计数器模板命名为：jsq(自己喜欢的关键字)
4->scope
	GLOBAL
5->	sinppet content里填写模板代码如下：

//计数器--$[![i]!]
reg[$[0[]0]:0]							$[![i]!]		;	//计数器位宽
wire								add_$[![i]!]	;	//计数开始条件
wire								end_$[![i]!]	;	//计数结束条件
//计数器--$[![i]!]
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		$[![i]!]	<=	0	;
	end
	else if(add_$[![i]!]) begin
		if(end_$[![i]!])
			$[![i]!]	<=	0	;
		else
			$[![i]!]	<=	$[![i]!]	+	1	;
	end
end
//计数器--$[![i]!] 加1条件
assign	add_$[![i]!]	=	$[0[]0]	;
//计数器--$[![i]!] 计数结束条件							
assign	end_$[![i]!]	=	add_$[![i]!]	&&	$[![i]!]	==	$[0[]0]	-	1	;

[>END<]


6->save current sinppet

//////////////////////////////////////

*/