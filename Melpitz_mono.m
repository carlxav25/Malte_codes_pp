clear all
close all

Mel_old = load('/home/local/carltonx/Ph.D/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Me_gas.txt');
Mel_new = load('/home/local/carltonx/Ph.D/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Me_gas_new.txt');


figure(1)
clf
plot(Mel_new(:,1), Mel_new(:,29), 'r-');
hold on
plot(Mel_new(:,1), Mel_new(:,30), 'm-');

[xS yS] = ginput(16);

j = 1;
for i = 1:length(Mel_new)
    if Mel_new(i,1) < xS(1)
       Mono1(j) = Mel_new(i,29);
       Mono1T(j) = Mel_new(i,1);
       j = j+1;
    elseif ((Mel_new(i,1) > xS(2)) && (Mel_new(i,1) < xS(3)))
       Mono1(j) = Mel_new(i,29);
       Mono1T(j) = Mel_new(i,1);
       j = j+1;
    elseif ((Mel_new(i,1) > xS(4)) && (Mel_new(i,1) < xS(5)))
       Mono1(j) = Mel_new(i,29);
       Mono1T(j) = Mel_new(i,1);
       j = j+1;
    elseif ((Mel_new(i,1) > xS(6)) && (Mel_new(i,1) < xS(7)))
       Mono1(j) = Mel_new(i,29);
       Mono1T(j) = Mel_new(i,1);
       j = j+1;
    end
end

j = 1;
for i = 1:length(Mel_new)
    if Mel_new(i,1) < xS(9)
       Mono2(j) = Mel_new(i,30);
       Mono2T(j) = Mel_new(i,1);
       j = j+1;
    elseif ((Mel_new(i,1) > xS(10)) && (Mel_new(i,1) < xS(11)))
       Mono2(j) = Mel_new(i,30);
       Mono2T(j) = Mel_new(i,1);
       j = j+1;
    elseif ((Mel_new(i,1) > xS(12)) && (Mel_new(i,1) < xS(13)))
       Mono2(j) = Mel_new(i,30);
       Mono2T(j) = Mel_new(i,1);
       j = j+1;
    elseif ((Mel_new(i,1) > xS(14)) && (Mel_new(i,1) < xS(15)))
       Mono2(j) = Mel_new(i,30);
       Mono2T(j) = Mel_new(i,1);
       j = j+1;
    end
end


Mono1_int = interp1(Mono1T(:), Mono1(:), Mel_new(:,1), 'linear');
Mono2_int = interp1(Mono2T(:), Mono2(:), Mel_new(:,1), 'linear');

figure(2)
clf
plot(Mel_new(:,1), Mel_new(:,29), 'r-');
hold on
plot(Mel_new(:,1), Mono1_int(:),  'g-');
plot(Mel_new(:,1), Mel_new(:,30), 'm-');
plot(Mel_new(:,1), Mono2_int(:),  'b-');
legend('Mono-alpha-beta-org', 'Mono-alpha-beta-new', 'Mono-limo-org', 'Mono-limo-new');

fid1 = fopen('/home/local/carltonx/Ph.D/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Me_mono_extra.txt','w');
for i = 1:481
    fprintf (fid1, '%22.3f',  Mel_new(i,1));
    fprintf (fid1, '%22.3f',  Mono1_int(i));
    fprintf (fid1, '%22.3f',  Mono2_int(i));
    fprintf (fid1, '\n');  
end


