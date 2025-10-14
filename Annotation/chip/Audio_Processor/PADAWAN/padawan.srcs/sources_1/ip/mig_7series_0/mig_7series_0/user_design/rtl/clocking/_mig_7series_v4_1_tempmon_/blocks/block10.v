      always @(tempmon_state or sample_en or xadc_drdy_r) begin

        tempmon_next_state = tempmon_state;

        case(tempmon_state)

          INIT_IDLE:
            if(sample_en)
              tempmon_next_state = REQUEST_READ_TEMP;

          REQUEST_READ_TEMP:
            tempmon_next_state = WAIT_FOR_READ;

          WAIT_FOR_READ:
            if(xadc_drdy_r)
              tempmon_next_state = READ;

          READ:
            tempmon_next_state = INIT_IDLE;

          default:
            tempmon_next_state = INIT_IDLE;

        endcase

      end