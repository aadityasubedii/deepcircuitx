initial
    begin
    pkt_to_amber_ack_file = $fopen(pkt_to_amber_ack, "w");
    $fwrite(pkt_to_amber_ack_file, "0\n");
    $fclose(pkt_to_amber_ack_file);
    end