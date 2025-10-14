    initial begin

        set_level(16'b10zz_zzzz_zzzz_zzzz);
        tb_assert(level_code == 0);

        set_level(16'b110z_zzzz_zzzz_zzzz);
        tb_assert(level_code == 1);

        set_level(16'b1110_zzzz_zzzz_zzzz);
        tb_assert(level_code == 2);

        set_level(16'b1111_0zzz_zzzz_zzzz);
        tb_assert(level_code == 3);

        set_level(16'b1111_10zz_zzzz_zzzz);
        tb_assert(level_code == 4);

        set_level(16'b1111_110z_zzzz_zzzz);
        tb_assert(level_code == 5);

        set_level(16'b1111_1110_zzzz_zzzz);
        tb_assert(level_code == 6);

        set_level(16'b1111_1111_0zzz_zzzz);
        tb_assert(level_code == 7);

        set_level(16'b1111_1111_10zz_zzzz);
        tb_assert(level_code == 8);

        set_level(16'b1111_1111_110z_zzzz);
        tb_assert(level_code == 9);

        set_level(16'b1111_1111_1110_zzzz);
        tb_assert(level_code == 10);

        set_level(16'b1111_1111_1111_0zzz);
        tb_assert(level_code == 11);

        set_level(16'b1111_1111_1111_10zz);
        tb_assert(level_code == 12);

        set_level(16'b1111_1111_1111_110z);
        tb_assert(level_code == 13);

        set_level(16'b1111_1111_1111_1110);
        tb_assert(level_code == 14);

        set_level(16'b1111_1111_1111_1111);
        tb_assert(level_code == 15);

        set_level(16'b01zz_zzzz_zzzz_zzzz);
        tb_assert(level_code == 0);

        set_level(16'b001z_zzzz_zzzz_zzzz);
        tb_assert(level_code == 1);

        set_level(16'b0001_0zzz_zzzz_zzzz);
        tb_assert(level_code == 2);

        set_level(16'b0000_10zz_zzzz_zzzz);
        tb_assert(level_code == 3);

        set_level(16'b0000_01zz_zzzz_zzzz);
        tb_assert(level_code == 4);

        set_level(16'b0000_001z_zzzz_zzzz);
        tb_assert(level_code == 5);

        set_level(16'b0000_0001_zzzz_zzzz);
        tb_assert(level_code == 6);

        set_level(16'b0000_0000_1zzz_zzzz);
        tb_assert(level_code == 7);

        set_level(16'b0000_0000_01zz_zzzz);
        tb_assert(level_code == 8);

        set_level(16'b0000_0000_001z_zzzz);
        tb_assert(level_code == 9);

        set_level(16'b0000_0000_0001_zzzz);
        tb_assert(level_code == 10);

        set_level(16'b0000_0000_0000_1zzz);
        tb_assert(level_code == 11);

        set_level(16'b0000_0000_0000_01zz);
        tb_assert(level_code == 12);

        set_level(16'b0000_0000_0000_001z);
        tb_assert(level_code == 13);

        set_level(16'b0000_0000_0000_0001);
        tb_assert(level_code == 14);

        set_level(16'b0000_0000_0000_0000);
        tb_assert(level_code == 15);

    end