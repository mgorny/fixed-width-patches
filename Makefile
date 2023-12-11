WIDTH = 1000
THRESHOLD = $$(echo '$(WIDTH) 200 - p' | dc)

ALL = fractal.patch tuba.patch
DESTDIR =

.PHONY: all clean install install-fractal install-tuba
.PHONY: uninstall uninstall-fractal uninstall-tuba

all: $(ALL)

clean:
	rm -f $(ALL)

install: install-fractal install-tuba

install-fractal: fractal.patch
	install -m 755 -d $(DESTDIR)/etc/portage/patches/net-im/fractal
	install -m 644 fractal.patch $(DESTDIR)/etc/portage/patches/net-im/fractal/width.patch

install-tuba: tuba.patch
	install -m 755 -d $(DESTDIR)/etc/portage/patches/net-misc/tuba
	install -m 644 tuba.patch $(DESTDIR)/etc/portage/patches/net-misc/tuba/width.patch

uninstall: uninstall-fractal uninstall-tuba

uninstall-fractal:
	rm -f $(DESTDIR)/etc/portage/patches/net-im/fractal/width.patch
	-rmdir -p $(DESTDIR)/etc/portage/patches/net-im/fractal

uninstall-tuba:
	rm -f $(DESTDIR)/etc/portage/patches/net-misc/tuba/width.patch
	-rmdir -p $(DESTDIR)/etc/portage/patches/net-misc/tuba

%.patch: %.patch.in
	sed -e "s:%WIDTH%:$(WIDTH):" -e "s:%THRESHOLD%:$(THRESHOLD):" $< > $@
