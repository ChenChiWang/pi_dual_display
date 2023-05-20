## 1.54-inch e-Paper Display的GPIO腳位對應表

| e-Paper | Raspberry Pi BCM | Raspberry Pi Physical Pin |
|---------|------------------|---------------------------|
| VCC     | 3.3V             | 1 or 17                   |
| GND     | GND              | 6, 9, 14, 20, 25, 30, 34 or 39 |
| DIN     | MOSI             | 19                        |
| CLK     | SCLK             | 23                        |
| CS      | 7                | 26                        |
| DC      | 25               | 22                        |
| RST     | 17               | 11                        |
| BUSY    | 22               | 15                        |


## 1.3-inch SPI Display的GPIO腳位對應表

| PIN           | Raspberry Pi BCM | Raspberry Pi Physical Pin | Description                        |
|---------------|------------------|---------------------------|------------------------------------|
| KEY1          | 21               | 40                        | KEY1GPIO                           |
| KEY2          | 20               | 38                        | KEY2GPIO                           |
| KEY3          | 16               | 36                        | KEY3GPIO                           |
| Joystick UP   | 6                | 31                        | Upward direction of the Joystick   |
| Joystick Down | 19               | 35                        | Downward direction of the Joystick |
| Joystick Left | 5                | 29                        | Left direction of the Joystick     |
| Joystick Right| 26               | 37                        | Right direction of the Joystick    |
| Joystick Press| 13               | 33                        | Press the Joystick                 |
| SCLK          | 11               | 23                        | SPI clock line                     |
| MOSI          | 10               | 19                        | SPI data line                      |
| CS            | 8                | 24                        | Chip selection                     |
| DC            | 25               | 22                        | Data/Command control               |
| RST           | 27               | 13                        | Reset                              |
| BL            | 24               | 18                        | Backlight                          |
