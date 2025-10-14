always @ (*)
begin
	if(ib==9456 && jb==5)
	begin
		Reset_n = 1'b0;
		#13020; Reset_n = 1'b1;
	end
	if(ib==13056 && jb==9)
	begin
		Reset_n = 1'b0;
		#13020; Reset_n = 1'b1;
	end
end