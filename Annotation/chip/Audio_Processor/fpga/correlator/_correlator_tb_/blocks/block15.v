module tb ();

    reg ck = 0;

    always #42 ck <= !ck;