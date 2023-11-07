TARGET=none
CONFIG=./nes.cfg
OBJECTFILE=./project.o
OUTFILE=./project.nes
DBGFILE=./project.dbg
MAPFILE=./project.map
LABELFILE=./project.lbl
LINKERFILE=./project.lnk
SOURCE=src/main.asm

.PHONY: build clean run env-emulator-path

build:
	ca65 -g -l ${LINKERFILE} -t ${TARGET} ${SOURCE} -o ${OBJECTFILE}
	ld65 -Ln ${LABELFILE} -m ${MAPFILE} -vm --dbgfile ${DBGFILE} -o ${OUTFILE} -C ${CONFIG} ${OBJECTFILE} ${TARGET}.lib

run: env-emulator-path
	${EMULATOR_PATH} ${OUTFILE}

env-emulator-path:
ifndef EMULATOR_PATH
	$(error EMULATOR_PATH is not set)
endif
