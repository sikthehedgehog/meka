#!/bin/sh

asm() { wine tools/asm68k.exe /p $1,$2 ; }
gfx() { tools/mdtiler $1 ; }
slz() { tools/slz $1 $2 ; }
uftc() { tools/uftc $1 $2 ; }
eif() { tools/tfi2eif $1 $2 ; }
ewf() { tools/pcm2ewf $1 $2 ; }
esf() { tools/mml2esf $1 $2 ; }

gfx src-data/ingame/gfxbuild
gfx src-data/title/gfxbuild
gfx src-data/hiscore/gfxbuild

cat src-data/title/logo.map src-data/title/logo.4bpp > src-data/title/logo.blob
cat src-data/hiscore/background.map src-data/hiscore/background.4bpp > src-data/hiscore/background.blob

slz src-data/ingame/ingame.4bpp data/ingame/ingame.slz
slz src-data/title/title.4bpp data/title/title.slz
slz src-data/title/logo.blob data/title/logo.slz
slz src-data/hiscore/hiscore.4bpp data/hiscore/hiscore.slz
slz src-data/hiscore/background.blob data/hiscore/background.slz

uftc src-data/ingame/tile_floor.4bpp data/ingame/tile_floor.uftc
uftc src-data/ingame/tile_empty.4bpp data/ingame/tile_empty.uftc

eif src-data/voices/slapbass.tfi data/voices/slapbass.eif
eif src-data/voices/squaref.tfi data/voices/square.eif
eif src-data/voices/synbass.tfi data/voices/synbass.eif
eif src-data/voices/bass.tfi data/voices/bass.eif
eif src-data/voices/ding.tfi data/voices/ding.eif
eif src-data/voices/oguitar.tfi data/voices/oguitar.eif
eif src-data/voices/bigboom.tfi data/voices/bigboom.eif
ewf src-data/voices/explosion.pcm data/voices/explosion.ewf
esf src-data/bgm/ingame.mml data/bgm/ingame.esf
esf src-data/bgm/map_select.mml data/bgm/map_select.esf
esf src-data/bgm/hiscore.mml data/bgm/hiscore.esf
esf src-data/bgm/game_over.mml data/bgm/game_over.esf

asm buildme.68k game1.bin
