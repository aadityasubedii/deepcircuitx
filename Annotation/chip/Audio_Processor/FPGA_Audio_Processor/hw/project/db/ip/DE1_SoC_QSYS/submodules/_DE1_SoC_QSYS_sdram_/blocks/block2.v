
  assign txt_code = (cmd_code == 3'h0)? 24'h4c4d52 :
    (cmd_code == 3'h1)? 24'h415246 :
    (cmd_code == 3'h2)? 24'h505245 :
    (cmd_code == 3'h3)? 24'h414354 :
    (cmd_code == 3'h4)? 24'h205752 :
    (cmd_code == 3'h5)? 24'h205244 :
    (cmd_code == 3'h6)? 24'h425354 :
    (cmd_code == 3'h7)? 24'h4e4f50 :
    24'h424144;