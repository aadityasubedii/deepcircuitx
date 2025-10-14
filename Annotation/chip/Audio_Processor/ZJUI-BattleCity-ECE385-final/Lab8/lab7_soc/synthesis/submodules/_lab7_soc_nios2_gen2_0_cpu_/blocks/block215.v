  assign dummy_sink = tr_data |
    trigout |
    debugack;

  assign debugreq = 0;