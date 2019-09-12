figure,plot(skinFT(:,1:3))
xlabel('samples')
ylabel('N')
title('insole estimated forces')
legend('f_x','f_y','f_z')

figure,plot(skinFT(:,4:6))
xlabel('samples')
ylabel('Nm')
title('insole estimated torques')
legend('\tau_x','\tau_y','\tau_z')


figure,plot(suit.ftShoes.Right(1:3,:)')
xlabel('samples')
ylabel('N')
title('ft forces')
legend('f_x','f_y','f_z')

figure,plot(suit.ftShoes.Right(4:6,:)')
xlabel('samples')
ylabel('Nm')
title('ft torques')
legend('\tau_x','\tau_y','\tau_z')
%%
figure,plot(skin_timestamp,   skinFT(:,1:3))
hold on
plot(suit.timestamp,suit.ftShoes.Right(1:3,:)')
xlabel('samples')
ylabel('N')
title('insole estimated forces')
legend('f_{x_{insole}}','f_{y_{insole}}','f_{z_{insole}}','f_{x_{ft}}','f_{y_{ft}}','f_{z_{ft}}')

figure,plot(skin_timestamp,skinFT(:,4:6))
hold on
plot(suit.timestamp,suit.ftShoes.Right(4:6,:)')
xlabel('samples')
ylabel('Nm')
title('insole estimated torques')
legend('\tau_{x_{insole}}','\tau_{y_{insole}}','\tau_{z_{insole}}','\tau_{x_{ft}}','\tau_{y_{ft}}','\tau_{z_{ft}}')




tax = load('right_cap_taxel_thicker_insole_wrong_ids.txt');
for ii = 0 : 27
  figure, 
  plot(raw_capacitance(:,ii*10+1:ii*10+10));
  xlabel('#samples');
  ylabel('C');
  title(['Triangle ', num2str((tax(ii*10+1,1))/12)]);
end