/* Felipe Bonilla Parra
@talestales 2025
.scd Donde voy aprendiendo SClang
*/
Server.default.options.outDevice_("Audífonos externo");
Server.default.options.inDevice_("MacBook Air (micrófono");

s.boot;
(
SynthDef(\s1, {
    arg frec = 1000, lf = 1, dur = 1, amp = 0.25;
    var sonido, varLFO, env, iteracion;
    env = Line.kr(1,0,dur,amp, doneAction:0);
    varLFO = SinOsc.kr(lf);
    sonido = 0;
    64.do{
        arg indice;
        iteracion = SinOsc.ar((frec*indice)) * env;
        sonido = sonido + iteracion;
    };
        Out.ar(0,sonido);
}).add;
)
m = Synth(\s1, [\frec, 100, \dur, 5, \amp, -24.dbamp]);
m.set(\frec, 500, \lf, 0.1);
m.free;

s.freeAll;
s.quit;