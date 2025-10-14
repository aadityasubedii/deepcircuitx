assign und_request  =   type == CODTRANS ||
                        type == COREGOP  ||
                      ( type == CORTRANS && instruction[11:8] != 4'd15 );