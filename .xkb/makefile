# Pahs
XKBPATH=/usr/share/X11/xkb
RULESDIR=rules
KEYMAPSDIR=keymaps
AUTOSTARTDIR=$${HOME}/.config/autostart

# Source files
EVDEVGLB=${XKBPATH}/${RULESDIR}/evdev
EVDEVSRC=./${RULESDIR}/jpext
AUTOXKBCMD=rc-xkbcomp.sh

# Target files
EVDEVLOC=evdev-local
XKBSRC=./${KEYMAPSDIR}/userkbd
TARGET=${XKBSRC}.xkm
AUTOSCRIPT=${AUTOSTARTDIR}/xkbcomp.desktop

# Options passed to xkb
# Edit the line as you like
XKBOPTS=ctrl:nocaps,jpmuhen:lshift,jphenk:rshift

${TARGET}: ${XKBSRC}
	xkbcomp -I./ $< $@ 2> /dev/null

${XKBSRC}: ./${RULESDIR}/${EVDEVLOC}
	setxkbmap -I./ -rules ${EVDEVLOC} -option ${XKBOPTS} -print > $@

./${RULESDIR}/${EVDEVLOC}: ${EVDEVGLB} ${EVDEVSRC}
	cat $^ > $@
	cat $^.lst > $@.lst

.PHONY: install uninstall clean patch
install: ${AUTOXKBCMD} ${TARGET}
	echo "[Desktop Entry]" > ${AUTOSCRIPT}
	echo "Type=Application" >> ${AUTOSCRIPT}
	echo "Encoding=UTF-8" >> ${AUTOSCRIPT}
	echo "Name=xkbcomp" >> ${AUTOSCRIPT}
	echo "Exec=bash" $${HOME}/.xkb/${AUTOXKBCMD} >> ${AUTOSCRIPT}
	echo "Hidden=false" >> ${AUTOSCRIPT}
	echo "NoDisplay=false" >> ${AUTOSCRIPT}
	echo "Comment=Enable some options passed to xkb involving to japanese keyboards" >> ${AUTOSCRIPT}

uninstall:
	${RM} ${AUTOSCRIPT}

clean:
	${RM} ./${KEYMAPSDIR}/* ./${RULESDIR}/${EVDEVLOC}* ./*.patch

patch: ./${RULESDIR}/${EVDEVLOC} ./${RULESDIR}/${EVDEVLOC}.lst
	diff -u ${EVDEVGLB} ./${RULESDIR}/${EVDEVLOC} \
		> evdev.patch; [ $$? -eq 1 ]
	diff -u ${EVDEVGLB}.lst ./${RULESDIR}/${EVDEVLOC}.lst \
		> evdev.lst.patch; [ $$? -eq 1 ]

