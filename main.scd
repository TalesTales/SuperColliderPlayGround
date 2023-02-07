/* Felipe Bonilla Parra
@misterBmisterB 2023
.scd Donde voy aprendiendo SClang
*/
s.boot;

m = {SinOsc.ar(700!2) * 0.125}.play;
m.free;

(
z = {
    arg ruido = 2;
    var frec, amp, sonido;
    frec = LFNoise0.kr(ruido).exprange(100,1000);
    amp = LFNoise1.kr(12).exprange(0.2, 1);
    sonido = SinOsc.ar(frec!2)*0.125;
}.play;
)
y = 1;
z.set(\ruido, y+y);
z.free;
s.quit;