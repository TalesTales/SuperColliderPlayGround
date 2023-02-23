/* Felipe Bonilla Parra
@misterBmisterB 2023
.scd Donde voy aprendiendo SClang
*/
Server.default.options.device_("Scarlett 18i8 USB");
s.boot;
(
SynthDef(\s1, {
    arg frec = 400, lf = 1, dur = 1, amp = 0.5;
    var sonido, varLFO, env, temp;
    env = Line.kr(1,0,dur,amp, doneAction:0);
    varLFO = SinOsc.kr(lf);
    sonido = 0;
    8.do{
        arg cuenta;
        temp = SinOsc.ar(([frec, frec-(frec/10)])*cuenta+10) * env;
        sonido = sonido + temp;
    };
    sonido = sonido * 0.2;

    Out.ar(0,sonido);
}).add;
)
m = Synth.new(\s1, [\dur, 3, \frec, 1000]);
m.set(\frec, 500, \lf, 0.1);
m.free;

s.freeAll;