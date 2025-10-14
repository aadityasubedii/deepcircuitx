    assign wb_dbus_rdt = irq_rdt | timer_rdt | ram_rdt | uart_rdt | gpio_rdt | flash_rdt | engine_rdt;
    assign wb_dbus_ack = irq_ack | timer_ack | ram_ack | uart_ack | gpio_ack | flash_ack | engine_ack | led_ack;
