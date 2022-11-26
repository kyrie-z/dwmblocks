.POSIX:

PREFIX = /usr/local
CFLAGS = -Ofast
LDLIBS = -lX11

BIN = dwmblocks
SCRIPTS = dwm_network.sh dwm_mem.sh dwm_alsa.sh dwm_weather.sh dwm_date.sh dwm_battery.sh bash-loop dwm_func.sh get-ip st-mini battery spark 

$(BIN): main.o
	$(CC) $^ -o $@ $(LDLIBS)

clean:
	$(RM) *.o $(BIN)

install: $(BIN)
	install -D -m 755 $(BIN) $(DESTDIR)$(PREFIX)/bin/$(BIN)
	cd scripts && install -D -m 755 $(SCRIPTS) $(DESTDIR)$(PREFIX)/bin/

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/$(BIN)
	cd $(DESTDIR)$(PREFIX)/bin/ && $(RM) $(SCRIPTS)

.PHONY: clean install uninstall
