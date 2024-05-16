w = logspace(-1,2,200);
for i = 1:3;
if i == 1; K = 1;[mag,phase,w] = bode([K],[1 6 5 K],w);
mag1dB = 20*log10(mag); phase1 = phase; end;
if i == 2; K = 10;[mag,phase,w] = bode([K],[1 6 5 K],w);
mag2dB = 20*log10(mag); phase2 = phase; end;
if i == 3; K = 20;[mag,phase,w] = bode([K],[1 6 5 K],w);
mag3dB = 20*log10(mag); phase3 = phase; end;
end
semilogx(w,mag1dB,'-',w,mag2dB,'-',w,mag3dB,'-')
grid
title('Bode Diagrams of G(s) = K/[s(s + 1)(s + 5)], where K = 1, K = 10, and K = 20')
xlabel('Frequency (rad/sec)')
ylabel('Gain (dB)')
text(1.2,-31,'K = 1')
text(1.1,-8,'K = 10')
text(11,-31,'K = 20')
semilogx(w,phase1,'-',w,phase2,'-',w,phase3,'-')
grid
xlabel('Frequency (rad/sec)')
ylabel('Phase (deg)')
text(0.2,-90,'K = 1')
text(0.2,-20,'K =10')
text(1.6,-20,'K = 20')