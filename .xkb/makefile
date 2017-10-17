# Paths
XKBPATH=/usr/share/X11/xkb
RULES=rules
KEYMAP=keymaps

# Source files
EVDEVGLB=${XKBPATH}/${RULES}/evdev
EVDEVSRC=./${RULES}/jpext
AUTOXKBCMD=xkbcomp.desktop

# Target files
EVDEVLOC=evdev-local
XKBSRC=./${KEYMAP}/userkbd
TARGET=${XKBSRC}.xkm

# Options passed to xkb
# Edit the line as you like
XKBOPTS=ctrl:nocaps,jpmuhen:lshift,jphenk:rshift

${TARGET}: ${XKBSRC}
	xkbcomp -I./ $< $@ 2> /dev/null

${XKBSRC}: ./${RULES}/${EVDEVLOC}
	setxkbmap -I./ -rules ${EVDEVLOC} -option ${XKBOPTS} -print > $@

./${RULES}/${EVDEVLOC}: ${EVDEVGLB} ${EVDEVSRC}
	cat $^ > $@
	cat $^.lst > $@.lst

.PHONY: install uninstall clean patch
install: ${AUTOXKBCMD} ${TARGET}
	cp $< $${HOME}/.config/autostart/

uninstall:
	${RM} $${HOME}/.config/autostart/${AUTOXKBCMD}

clean:
	${RM} ./${KEYMAP}/* ./${RULES}/${EVDEVLOC}* ./*.patch

patch: ./${RULES}/${EVDEVLOC} ./${RULES}/${EVDEVLOC}.lst
	diff -u ${EVDEVGLB} ./${RULES}/${EVDEVLOC} \
		> evdev.patch; [ $$? -eq 1 ]
	diff -u ${EVDEVGLB}.lst ./${RULES}/${EVDEVLOC}.lst \
		> evdev.lst.patch; [ $$? -eq 1 ]

