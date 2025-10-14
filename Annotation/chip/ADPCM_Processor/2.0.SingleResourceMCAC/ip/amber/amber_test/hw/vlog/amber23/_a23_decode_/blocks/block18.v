assign und_request  =   itype == CODTRANS ||
                        itype == COREGOP  ||
                      ( itype == CORTRANS && instruction[11:8] != 4'd15 );