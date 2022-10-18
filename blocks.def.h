// Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
        /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
//        { "", "dwmMusic", 0, 1 },
//        /* { "", "dwmNet", 1, 2 }, */
//        { "", "dwmMailbox", 0, 3 },
//        { "", "dwmMemory", 60, 11 },
//        { "", "dwmDisk", 60, 4 },
//        { "", "dwmWeather", 3600, 6 },
//        { "", "dwmClock", 60, 5 },
//        { "", "dwmBattery", 60, 8 },
//        { "", "dwmVol", 0, 7 },
//        { "", "dwmUpdate", 0, 9 },
//        { "", "dwmInternet", 60, 12 },
//        { "", "dwmMoon", 3600, 10 },
    {"| ",  "/home/zzl/github/dwmblocks/scripts/dwm_network.sh",  600,  1},
    {"",  "/home/zzl/github/dwmblocks/scripts/dwm_mem.sh",     60,  3},
    {"",  "/home/zzl/github/dwmblocks/scripts/dwm_alsa.sh",     2,  2},
    {"",  "/home/zzl/github/dwmblocks/scripts/dwm_weather.sh",  1800,  4},
    {"",  "/home/zzl/github/dwmblocks/scripts/dwm_date.sh",     1,  5},
    {"",  "/home/zzl/github/dwmblocks/scripts/dwm_battery.sh",  60,  6},

};

// sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 3;
