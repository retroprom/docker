## Docker images for retrocomputing

This is set of recipes for building retrocomputing emulators as Docker images.

The goal is to make retro systems easy to run and composable.

### Emulators

A full build will provide you with the following emulators.

| Image name | Emulator | Description |
| ---------- | -------- | ----------- |
| retroprom/craysim | [cray-sim](https://github.com/andrastantos/cray-sim/) | Cray simulator |
| retroprom/dynamips | [Dynamips](https://github.com/GNS3/dynamips/) | Cisco router emulator for running Cisco IOS |
| retroprom/es40 | [ES40](https://github.com/retroprom/es40/) | DEC Alpha emulator named after the DS40 |
| retroprom/gxemul | [GXemul](http://gavare.se/gxemul/) | Gavare's eXperimental Emulator |
| retroprom/hercules | [Hercules](https://github.com/SDL-Hercules-390/hyperion/) | IBM mainframe emulator for S/360 through z/Arch |
| retroprom/klh10 | [KLH-10](https://github.com/PDP-10/klh10/) | DEC PDP-10 emulator, originally by Ken L. Harenstien |
| retroprom/simh | [Open-SIMH](https://github.com/open-simh/simh/) | Simulator for DEC and other historic systems |

### Systems

We also provide scripts for building some system images.

| Image name | Emulator | Machine | System | Distribution |
| ---------- | -------- | ------- | ------ | ------------ |
| retroprom/hercules-dosvs-5pk | Hercules | IBM S/370 | DOS/VS | 5-pack |
| retroprom/hercules-mvs-ce | Hercules | IBM S/370 | MVS 3.8J | MVS/CE |
| retroprom/hercules-mvs-tk3 | Hercules | IBM S/370 | MVS 3.8J | TK3 |
| retroprom/hercules-mvs-tk4 | Hercules | IBM S/370 | MVS 3.8J | TK4- |
| retroprom/hercules-vm370-ce | Hercules | IBM 3390 | VM/370 | VM/370 CE |
| retroprom/klh10-panda | KLH-10 | DEC PDP-10 | TOPS-20 | PANDA |
| retroprom/simh-id32-os32 | SIMH | Interdata 8/32 | OS/32 | simh-os32 |
| retroprom/simh-id32-unix-v6 | SIMH | Interdata 7/32 | UNIX V6 | SIMH |
| retroprom/simh-id32-unix-v7 | SIMH | Interdata 7/32 | UNIX V7 | SIMH |
| retroprom/simh-pdp8-dms | SIMH | DEC PDP-8 | DMS | SIMH |
| retroprom/simh-pdp8-focal | SIMH | DEC PDP-8 | FOCAL | SIMH |
| retroprom/simh-pdp8-os8 | SIMH | DEC PDP-8 | OS/8 | SIMH |
| retroprom/simh-pdp8-tss8 | SIMH | DEC PDP-8 | TSS/8 | SIMH |
| retroprom/simh-pdp11-rsts-v7 | SIMH | DEC PDP-11/73 | RSTS/E V7 | SIMH |
| retroprom/simh-pdp11-rt11-v4 | SIMH | DEC PDP-11/23 | RT-11 V4 | SIMH |
| retroprom/simh-pdp11-rt11-v5 | SIMH | DEC PDP-11/23 | RT-11 V5 | SIMH |
| retroprom/simh-pdp11-unix-v5 | SIMH | DEC PDP-11/45 | UNIX V5 | SIMH |
| retroprom/simh-pdp11-unix-v6 | SIMH | DEC PDP-11/45 | UNIX V6 | SIMH |
| retroprom/simh-pdp11-unix-v7 | SIMH | DEC PDP-11/45 | UNIX V7 | SIMH |

### Some Quick Notes

Feel free to send patches or ask questions.

This is obviously a hobby project.

Images are currently based on Debian (release 12/bookworm).

The images use a build container to minimize image size.

A simulator user called 'sim' is usually provided.

Emulators are installed in /usr/local when possible.

Other simulator files are located in /sim.

Images should be set up to start the emulator using dumb-init.

System images usually start in the foreground and require a terminal.

