/* Felipe Bonilla Parra
@misterBmisterB 2023
.scd Donde voy aprendiendo SClang
*/
Server.default.options.device_("Scarlett 18i8 USB");
s.boot;
(
SynthDef(\sinte01, {
    arg frec = 400, lf = 1;
    var sonido, varLFO;
    varLFO = SinOsc.kr(lf);
    frec = frec*varLFO;
    sonido = SinOsc.ar(frec!2) * 0.125;
    Out.ar(0,sonido);
}).add;
)

m = Synth.new(\sinte01);
m.set(\frec, 100, \lf, 0.1);
m.free;

s.quit;