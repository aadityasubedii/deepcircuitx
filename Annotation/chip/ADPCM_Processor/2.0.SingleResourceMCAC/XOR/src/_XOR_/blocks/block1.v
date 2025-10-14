always @ (DQn, DQ) begin
	DQS = DQ [15];       
	DQnS = DQn [10];     
	Un = DQS ^ DQnS;     
end