#define CMDLENGTH 45
#define DELIMITER " | "
#define CLICKABLE_BLOCKS
// #define LEADING_DELIMITER

const Block blocks[] = {
//	BLOCK("sb-mail",    1800, 17),
//	BLOCK("sb-music",   0,    18),
//	BLOCK("sb-disk",    1800, 19),
//	BLOCK("sb-memory",  10,   20),
//	BLOCK("sb-loadavg", 5,    21),
//	BLOCK("sb-mic",     0,    26),
//	BLOCK("sb-record",  0,    27),
//	BLOCK("sb-volume",  0,    22),
//	BLOCK("sb-battery", 5,    23),
//	BLOCK("sb-date",    1,    24)

	BLOCK("echo -n '| ' && /home/zzl/github/dwmblocks/scripts/dwm_network.sh", 120, 1),
	BLOCK("/home/zzl/github/dwmblocks/scripts/dwm_mem.sh", 30, 2),
	BLOCK("/home/zzl/github/dwmblocks/scripts/dwm_alsa.sh", 2, 3),
	BLOCK("/home/zzl/github/dwmblocks/scripts/dwm_weather.sh", 1800, 4),
	BLOCK("/home/zzl/github/dwmblocks/scripts/dwm_date.sh", 1, 5),
	BLOCK("/home/zzl/github/dwmblocks/scripts/dwm_battery.sh",  60,  0)
};
