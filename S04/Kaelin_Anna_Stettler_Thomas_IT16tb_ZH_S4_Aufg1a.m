t = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120];
h = [2, 286, 1268, 3009, 5375, 8220, 11505, 15407, 20127, 25593, 31672, 38257, 44931];
m = [2051113, 1935155, 1799290, 1681120, 1567611, 1475282, 1376301, 1277921, 1177704, 1075683, 991872, 913254, 880377];

v = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t,h);
a = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t,v);
dmdt = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(t,m);
dmdh = Kaelin_Anna_Stettler_Thomas_IT16tb_ZH_S1_Aufg3a(h,m);

subplot(3,3,1);
plot(t,h);

subplot(3,3,2);
plot(t,v);

subplot(3,3,3);
plot(t,a);

subplot(3,3,4);
plot(t,m);

subplot(3,3,5);
plot(t,dmdt);

subplot(3,3,6);
plot(h, dmdh);

subplot(3,3,7);
plot(t,dmdt, t, dmdh.*v);