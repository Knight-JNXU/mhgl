--无双一击

function skill13060Attri(Char, skillLv, Attri) 
	local increaseValue1 = skillLv * 1.5 + 0.005 * skillLv ^ 2;
	local increaseValue2 = skillLv * 2.4 + 0.008 * skillLv ^ 2 + 20;
	local increaseValue3 = skillLv * 2.1 + 0.007 * skillLv ^ 2;
	local increaseValue4 = skillLv * 2.4 + 0.008 * skillLv ^ 2;
	local increaseValue5 = skillLv * 3 + 0.01 * skillLv ^ 2;
--	Attri:SetEva(Attri:GetEva() + increaseValue1 / 5);
--	Attri:SetAtk(Attri:GetAtk() + increaseValue2 / 5);
--	Attri:SetPow(Attri:GetPow() + increaseValue3 / 5);
--	Attri:SetDef(Attri:GetDef() + increaseValue4 / 5);
	--Attri:SetHit(Attri:GetHit() + increaseValue5 / 5);
	
	if skillLv == 1 then
	Attri:SetHit(Attri:GetHit() + 1);
    Attri:SetAtk(Attri:GetAtk() + 0 );
elseif skillLv == 2 then
    Attri:SetHit(Attri:GetHit() + 2);
    Attri:SetAtk(Attri:GetAtk() + 0 );
elseif skillLv == 3 then
    Attri:SetHit(Attri:GetHit() + 3);
    Attri:SetAtk(Attri:GetAtk() + 1 );
elseif skillLv == 4 then
    Attri:SetHit(Attri:GetHit() + 4);
    Attri:SetAtk(Attri:GetAtk() + 1 );
elseif skillLv == 5 then
    Attri:SetHit(Attri:GetHit() + 5);
    Attri:SetAtk(Attri:GetAtk() + 1 );
elseif skillLv == 6 then
    Attri:SetHit(Attri:GetHit() + 6);
    Attri:SetAtk(Attri:GetAtk() + 2 );
elseif skillLv == 7 then
    Attri:SetHit(Attri:GetHit() + 7);
    Attri:SetAtk(Attri:GetAtk() + 2 );
elseif skillLv == 8 then
    Attri:SetHit(Attri:GetHit() + 8);
    Attri:SetAtk(Attri:GetAtk() + 2 );
elseif skillLv == 9 then
    Attri:SetHit(Attri:GetHit() + 9);
    Attri:SetAtk(Attri:GetAtk() + 3 );
elseif skillLv == 10 then
    Attri:SetHit(Attri:GetHit() + 11);
    Attri:SetAtk(Attri:GetAtk() + 3 );
elseif skillLv == 11 then
    Attri:SetHit(Attri:GetHit() + 12);
    Attri:SetAtk(Attri:GetAtk() + 4 );
elseif skillLv == 12 then
    Attri:SetHit(Attri:GetHit() + 13);
    Attri:SetAtk(Attri:GetAtk() + 4 );
elseif skillLv == 13 then
    Attri:SetHit(Attri:GetHit() + 14);
    Attri:SetAtk(Attri:GetAtk() + 4 );
elseif skillLv == 14 then
    Attri:SetHit(Attri:GetHit() + 15);
    Attri:SetAtk(Attri:GetAtk() + 5 );
elseif skillLv == 15 then
    Attri:SetHit(Attri:GetHit() + 17);
    Attri:SetAtk(Attri:GetAtk() + 5 );
elseif skillLv == 16 then
    Attri:SetHit(Attri:GetHit() + 18);
    Attri:SetAtk(Attri:GetAtk() + 6 );
elseif skillLv == 17 then
    Attri:SetHit(Attri:GetHit() + 19);
    Attri:SetAtk(Attri:GetAtk() + 6 );
elseif skillLv == 18 then
    Attri:SetHit(Attri:GetHit() + 21);
    Attri:SetAtk(Attri:GetAtk() + 7 );
elseif skillLv == 19 then
    Attri:SetHit(Attri:GetHit() + 22);
    Attri:SetAtk(Attri:GetAtk() + 7 );
elseif skillLv == 20 then
    Attri:SetHit(Attri:GetHit() + 24);
    Attri:SetAtk(Attri:GetAtk() + 8 );
elseif skillLv == 21 then
    Attri:SetHit(Attri:GetHit() + 25);
    Attri:SetAtk(Attri:GetAtk() + 8 );
elseif skillLv == 22 then
    Attri:SetHit(Attri:GetHit() + 26);
    Attri:SetAtk(Attri:GetAtk() + 8 );
elseif skillLv == 23 then
    Attri:SetHit(Attri:GetHit() + 28);
    Attri:SetAtk(Attri:GetAtk() + 9 );
elseif skillLv == 24 then
    Attri:SetHit(Attri:GetHit() + 29);
    Attri:SetAtk(Attri:GetAtk() + 9 );
elseif skillLv == 25 then
    Attri:SetHit(Attri:GetHit() + 31);
    Attri:SetAtk(Attri:GetAtk() + 10 );
elseif skillLv == 26 then
    Attri:SetHit(Attri:GetHit() + 32);
    Attri:SetAtk(Attri:GetAtk() + 10 );
elseif skillLv == 27 then
    Attri:SetHit(Attri:GetHit() + 34);
    Attri:SetAtk(Attri:GetAtk() + 11 );
elseif skillLv == 28 then
    Attri:SetHit(Attri:GetHit() + 35);
    Attri:SetAtk(Attri:GetAtk() + 11 );
elseif skillLv == 29 then
    Attri:SetHit(Attri:GetHit() + 37);
    Attri:SetAtk(Attri:GetAtk() + 12 );
elseif skillLv == 30 then
    Attri:SetHit(Attri:GetHit() + 39);
    Attri:SetAtk(Attri:GetAtk() + 13 );
elseif skillLv == 31 then
    Attri:SetHit(Attri:GetHit() + 40);
    Attri:SetAtk(Attri:GetAtk() + 13 );
elseif skillLv == 32 then
    Attri:SetHit(Attri:GetHit() + 42);
    Attri:SetAtk(Attri:GetAtk() + 14 );
elseif skillLv == 33 then
    Attri:SetHit(Attri:GetHit() + 43);
    Attri:SetAtk(Attri:GetAtk() + 14 );
elseif skillLv == 34 then
    Attri:SetHit(Attri:GetHit() + 45);
    Attri:SetAtk(Attri:GetAtk() + 15 );
elseif skillLv == 35 then
    Attri:SetHit(Attri:GetHit() + 47);
    Attri:SetAtk(Attri:GetAtk() + 15 );
elseif skillLv == 36 then
    Attri:SetHit(Attri:GetHit() + 48);
    Attri:SetAtk(Attri:GetAtk() + 16 );
elseif skillLv == 37 then
    Attri:SetHit(Attri:GetHit() + 50);
    Attri:SetAtk(Attri:GetAtk() + 16 );
elseif skillLv == 38 then
    Attri:SetHit(Attri:GetHit() + 52);
    Attri:SetAtk(Attri:GetAtk() + 17 );
elseif skillLv == 39 then
    Attri:SetHit(Attri:GetHit() + 54);
    Attri:SetAtk(Attri:GetAtk() + 17 );
elseif skillLv == 40 then
    Attri:SetHit(Attri:GetHit() + 56);
    Attri:SetAtk(Attri:GetAtk() + 18 );
elseif skillLv == 41 then
    Attri:SetHit(Attri:GetHit() + 57);
    Attri:SetAtk(Attri:GetAtk() + 19 );
elseif skillLv == 42 then
    Attri:SetHit(Attri:GetHit() + 59);
    Attri:SetAtk(Attri:GetAtk() + 40 );
elseif skillLv == 43 then
    Attri:SetHit(Attri:GetHit() + 61);
    Attri:SetAtk(Attri:GetAtk() + 20 );
elseif skillLv == 44 then
    Attri:SetHit(Attri:GetHit() + 63);
    Attri:SetAtk(Attri:GetAtk() + 21 );
elseif skillLv == 45 then
    Attri:SetHit(Attri:GetHit() + 65);
    Attri:SetAtk(Attri:GetAtk() + 21 );
elseif skillLv == 46 then
    Attri:SetHit(Attri:GetHit() + 67);
    Attri:SetAtk(Attri:GetAtk() + 22 );
elseif skillLv == 47 then
    Attri:SetHit(Attri:GetHit() + 69);
    Attri:SetAtk(Attri:GetAtk() + 23 );
elseif skillLv == 48 then
    Attri:SetHit(Attri:GetHit() + 71);
    Attri:SetAtk(Attri:GetAtk() + 23 );
elseif skillLv == 49 then
    Attri:SetHit(Attri:GetHit() + 73);
    Attri:SetAtk(Attri:GetAtk() + 24 );
elseif skillLv == 50 then
    Attri:SetHit(Attri:GetHit() + 75);
    Attri:SetAtk(Attri:GetAtk() + 25 );
elseif skillLv == 51 then
    Attri:SetHit(Attri:GetHit() + 77);
    Attri:SetAtk(Attri:GetAtk() + 25 );
elseif skillLv == 52 then
    Attri:SetHit(Attri:GetHit() + 79);
    Attri:SetAtk(Attri:GetAtk() + 26 );
elseif skillLv == 53 then
    Attri:SetHit(Attri:GetHit() + 81);
    Attri:SetAtk(Attri:GetAtk() + 27 );
elseif skillLv == 54 then
    Attri:SetHit(Attri:GetHit() + 83);
    Attri:SetAtk(Attri:GetAtk() + 27 );
elseif skillLv == 55 then
    Attri:SetHit(Attri:GetHit() + 85);
    Attri:SetAtk(Attri:GetAtk() + 28 );
elseif skillLv == 56 then
    Attri:SetHit(Attri:GetHit() + 87);
    Attri:SetAtk(Attri:GetAtk() + 29 );
elseif skillLv == 57 then
    Attri:SetHit(Attri:GetHit() + 89);
    Attri:SetAtk(Attri:GetAtk() + 29 );
elseif skillLv == 58 then
    Attri:SetHit(Attri:GetHit() + 91);
    Attri:SetAtk(Attri:GetAtk() + 30 );
elseif skillLv == 59 then
    Attri:SetHit(Attri:GetHit() + 93);
    Attri:SetAtk(Attri:GetAtk() + 31 );
elseif skillLv == 60 then
    Attri:SetHit(Attri:GetHit() + 96);
    Attri:SetAtk(Attri:GetAtk() + 32 );
elseif skillLv == 61 then
    Attri:SetHit(Attri:GetHit() + 98);
    Attri:SetAtk(Attri:GetAtk() + 32 );
elseif skillLv == 62 then
    Attri:SetHit(Attri:GetHit() + 100);
    Attri:SetAtk(Attri:GetAtk() + 33 );
elseif skillLv == 63 then
    Attri:SetHit(Attri:GetHit() + 102);
    Attri:SetAtk(Attri:GetAtk() + 34 );
elseif skillLv == 64 then
    Attri:SetHit(Attri:GetHit() + 104);
    Attri:SetAtk(Attri:GetAtk() + 34 );
elseif skillLv == 65 then
    Attri:SetHit(Attri:GetHit() + 107);
    Attri:SetAtk(Attri:GetAtk() + 35 );
elseif skillLv == 66 then
    Attri:SetHit(Attri:GetHit() + 109);
    Attri:SetAtk(Attri:GetAtk() + 36 );
elseif skillLv == 67 then
    Attri:SetHit(Attri:GetHit() + 111);
    Attri:SetAtk(Attri:GetAtk() + 37 );
elseif skillLv == 68 then
    Attri:SetHit(Attri:GetHit() + 114);
    Attri:SetAtk(Attri:GetAtk() + 38 );
elseif skillLv == 69 then
    Attri:SetHit(Attri:GetHit() + 116);
    Attri:SetAtk(Attri:GetAtk() + 38 );
elseif skillLv == 70 then
    Attri:SetHit(Attri:GetHit() + 119);
    Attri:SetAtk(Attri:GetAtk() + 39 );
elseif skillLv == 71 then
    Attri:SetHit(Attri:GetHit() + 121);
    Attri:SetAtk(Attri:GetAtk() + 40 );
elseif skillLv == 72 then
    Attri:SetHit(Attri:GetHit() + 123);
    Attri:SetAtk(Attri:GetAtk() + 41 );
elseif skillLv == 73 then
    Attri:SetHit(Attri:GetHit() + 126);
    Attri:SetAtk(Attri:GetAtk() + 42 );
elseif skillLv == 74 then
    Attri:SetHit(Attri:GetHit() + 128);
    Attri:SetAtk(Attri:GetAtk() + 42 );
elseif skillLv == 75 then
    Attri:SetHit(Attri:GetHit() + 131);
    Attri:SetAtk(Attri:GetAtk() + 43 );
elseif skillLv == 76 then
    Attri:SetHit(Attri:GetHit() + 133);
    Attri:SetAtk(Attri:GetAtk() + 44 );
elseif skillLv == 77 then
    Attri:SetHit(Attri:GetHit() + 136);
    Attri:SetAtk(Attri:GetAtk() + 45 );
elseif skillLv == 78 then
    Attri:SetHit(Attri:GetHit() + 138);
    Attri:SetAtk(Attri:GetAtk() + 46 );
elseif skillLv == 79 then
    Attri:SetHit(Attri:GetHit() + 141);
    Attri:SetAtk(Attri:GetAtk() + 47 );
elseif skillLv == 80 then
    Attri:SetHit(Attri:GetHit() + 144);
    Attri:SetAtk(Attri:GetAtk() + 48 );
elseif skillLv == 81 then
    Attri:SetHit(Attri:GetHit() + 146);
    Attri:SetAtk(Attri:GetAtk() + 48 );
elseif skillLv == 82 then
    Attri:SetHit(Attri:GetHit() + 149);
    Attri:SetAtk(Attri:GetAtk() + 49 );
elseif skillLv == 83 then
    Attri:SetHit(Attri:GetHit() + 151);
    Attri:SetAtk(Attri:GetAtk() + 50 );
elseif skillLv == 84 then
    Attri:SetHit(Attri:GetHit() + 154);
    Attri:SetAtk(Attri:GetAtk() + 51 );
elseif skillLv == 85 then
    Attri:SetHit(Attri:GetHit() + 157);
    Attri:SetAtk(Attri:GetAtk() + 52 );
elseif skillLv == 86 then
    Attri:SetHit(Attri:GetHit() + 159);
    Attri:SetAtk(Attri:GetAtk() + 53 );
elseif skillLv == 87 then
    Attri:SetHit(Attri:GetHit() + 162);
    Attri:SetAtk(Attri:GetAtk() + 54 );
elseif skillLv == 88 then
    Attri:SetHit(Attri:GetHit() + 165);
    Attri:SetAtk(Attri:GetAtk() + 55 );
elseif skillLv == 89 then
    Attri:SetHit(Attri:GetHit() + 168);
    Attri:SetAtk(Attri:GetAtk() + 56 );
elseif skillLv == 90 then
    Attri:SetHit(Attri:GetHit() + 171);
    Attri:SetAtk(Attri:GetAtk() + 57 );
elseif skillLv == 91 then
    Attri:SetHit(Attri:GetHit() + 173);
    Attri:SetAtk(Attri:GetAtk() + 57 );
elseif skillLv == 92 then
    Attri:SetHit(Attri:GetHit() + 176);
    Attri:SetAtk(Attri:GetAtk() + 58 );
elseif skillLv == 93 then
    Attri:SetHit(Attri:GetHit() + 179);
    Attri:SetAtk(Attri:GetAtk() + 59 );
elseif skillLv == 94 then
    Attri:SetHit(Attri:GetHit() + 182);
    Attri:SetAtk(Attri:GetAtk() + 60 );
elseif skillLv == 95 then
    Attri:SetHit(Attri:GetHit() + 185);
    Attri:SetAtk(Attri:GetAtk() + 61 );
elseif skillLv == 96 then
    Attri:SetHit(Attri:GetHit() + 188);
    Attri:SetAtk(Attri:GetAtk() + 62 );
elseif skillLv == 97 then
    Attri:SetHit(Attri:GetHit() + 191);
    Attri:SetAtk(Attri:GetAtk() + 63 );
elseif skillLv == 98 then
    Attri:SetHit(Attri:GetHit() + 194);
    Attri:SetAtk(Attri:GetAtk() + 64 );
elseif skillLv == 99 then
    Attri:SetHit(Attri:GetHit() + 197);
    Attri:SetAtk(Attri:GetAtk() + 65 );
elseif skillLv == 100 then
    Attri:SetHit(Attri:GetHit() + 200);
    Attri:SetAtk(Attri:GetAtk() + 66 );
elseif skillLv == 101 then
    Attri:SetHit(Attri:GetHit() + 203);
    Attri:SetAtk(Attri:GetAtk() + 67 );
elseif skillLv == 102 then
    Attri:SetHit(Attri:GetHit() + 206);
    Attri:SetAtk(Attri:GetAtk() + 68 );
elseif skillLv == 103 then
    Attri:SetHit(Attri:GetHit() + 209);
    Attri:SetAtk(Attri:GetAtk() + 69 );
elseif skillLv == 104 then
    Attri:SetHit(Attri:GetHit() + 212);
    Attri:SetAtk(Attri:GetAtk() + 70 );
elseif skillLv == 105 then
    Attri:SetHit(Attri:GetHit() + 215);
    Attri:SetAtk(Attri:GetAtk() + 71 );
elseif skillLv == 106 then
    Attri:SetHit(Attri:GetHit() + 218);
    Attri:SetAtk(Attri:GetAtk() + 72 );
elseif skillLv == 107 then
    Attri:SetHit(Attri:GetHit() + 221);
    Attri:SetAtk(Attri:GetAtk() + 73 );
elseif skillLv == 108 then
    Attri:SetHit(Attri:GetHit() + 224);
    Attri:SetAtk(Attri:GetAtk() + 74 );
elseif skillLv == 109 then
    Attri:SetHit(Attri:GetHit() + 227);
    Attri:SetAtk(Attri:GetAtk() + 75 );
elseif skillLv == 110 then
    Attri:SetHit(Attri:GetHit() + 231);
    Attri:SetAtk(Attri:GetAtk() + 77 );
elseif skillLv == 111 then
    Attri:SetHit(Attri:GetHit() + 234);
    Attri:SetAtk(Attri:GetAtk() + 78 );
elseif skillLv == 112 then
    Attri:SetHit(Attri:GetHit() + 237);
    Attri:SetAtk(Attri:GetAtk() + 79 );
elseif skillLv == 113 then
    Attri:SetHit(Attri:GetHit() + 240);
    Attri:SetAtk(Attri:GetAtk() + 80 );
elseif skillLv == 114 then
    Attri:SetHit(Attri:GetHit() + 243);
    Attri:SetAtk(Attri:GetAtk() + 81 );
elseif skillLv == 115 then
    Attri:SetHit(Attri:GetHit() + 247);
    Attri:SetAtk(Attri:GetAtk() + 82 );
elseif skillLv == 116 then
    Attri:SetHit(Attri:GetHit() + 250);
    Attri:SetAtk(Attri:GetAtk() + 83 );
elseif skillLv == 117 then
    Attri:SetHit(Attri:GetHit() + 253);
    Attri:SetAtk(Attri:GetAtk() + 84 );
elseif skillLv == 118 then
    Attri:SetHit(Attri:GetHit() + 257);
    Attri:SetAtk(Attri:GetAtk() + 85 );
elseif skillLv == 119 then
    Attri:SetHit(Attri:GetHit() + 260);
    Attri:SetAtk(Attri:GetAtk() + 86 );
elseif skillLv == 120 then
    Attri:SetHit(Attri:GetHit() + 264);
    Attri:SetAtk(Attri:GetAtk() + 88 );
elseif skillLv == 121 then
    Attri:SetHit(Attri:GetHit() + 267);
    Attri:SetAtk(Attri:GetAtk() + 89 );
elseif skillLv == 122 then
    Attri:SetHit(Attri:GetHit() + 270);
    Attri:SetAtk(Attri:GetAtk() + 90 );
elseif skillLv == 123 then
    Attri:SetHit(Attri:GetHit() + 274);
    Attri:SetAtk(Attri:GetAtk() + 91 );
elseif skillLv == 124 then
    Attri:SetHit(Attri:GetHit() + 277);
    Attri:SetAtk(Attri:GetAtk() + 92 );
elseif skillLv == 125 then
    Attri:SetHit(Attri:GetHit() + 281);
    Attri:SetAtk(Attri:GetAtk() + 93 );
elseif skillLv == 126 then
    Attri:SetHit(Attri:GetHit() + 284);
    Attri:SetAtk(Attri:GetAtk() + 94 );
elseif skillLv == 127 then
    Attri:SetHit(Attri:GetHit() + 288);
    Attri:SetAtk(Attri:GetAtk() + 96 );
elseif skillLv == 128 then
    Attri:SetHit(Attri:GetHit() + 291);
    Attri:SetAtk(Attri:GetAtk() + 97 );
elseif skillLv == 129 then
    Attri:SetHit(Attri:GetHit() + 295);
    Attri:SetAtk(Attri:GetAtk() + 98 );
elseif skillLv == 130 then
    Attri:SetHit(Attri:GetHit() + 299);
    Attri:SetAtk(Attri:GetAtk() + 99 );
elseif skillLv == 131 then
    Attri:SetHit(Attri:GetHit() + 302);
    Attri:SetAtk(Attri:GetAtk() + 100 );
elseif skillLv == 132 then
    Attri:SetHit(Attri:GetHit() + 306);
    Attri:SetAtk(Attri:GetAtk() + 102 );
elseif skillLv == 133 then
    Attri:SetHit(Attri:GetHit() + 309);
    Attri:SetAtk(Attri:GetAtk() + 103 );
elseif skillLv == 134 then
    Attri:SetHit(Attri:GetHit() + 313);
    Attri:SetAtk(Attri:GetAtk() + 104 );
elseif skillLv == 135 then
    Attri:SetHit(Attri:GetHit() + 317);
    Attri:SetAtk(Attri:GetAtk() + 105 );
elseif skillLv == 136 then
    Attri:SetHit(Attri:GetHit() + 320);
    Attri:SetAtk(Attri:GetAtk() + 106 );
elseif skillLv == 137 then
    Attri:SetHit(Attri:GetHit() + 324);
    Attri:SetAtk(Attri:GetAtk() + 108 );
elseif skillLv == 138 then
    Attri:SetHit(Attri:GetHit() + 328);
    Attri:SetAtk(Attri:GetAtk() + 109 );
elseif skillLv == 139 then
    Attri:SetHit(Attri:GetHit() + 332);
    Attri:SetAtk(Attri:GetAtk() + 110 );
elseif skillLv == 140 then
    Attri:SetHit(Attri:GetHit() + 336);
    Attri:SetAtk(Attri:GetAtk() + 112 );
elseif skillLv == 141 then
    Attri:SetHit(Attri:GetHit() + 339);
    Attri:SetAtk(Attri:GetAtk() + 113 );
elseif skillLv == 142 then
    Attri:SetHit(Attri:GetHit() + 343);
    Attri:SetAtk(Attri:GetAtk() + 114 );
elseif skillLv == 143 then
    Attri:SetHit(Attri:GetHit() + 347);
    Attri:SetAtk(Attri:GetAtk() + 115 );
elseif skillLv == 144 then
    Attri:SetHit(Attri:GetHit() + 351);
    Attri:SetAtk(Attri:GetAtk() + 117 );
elseif skillLv == 145 then
    Attri:SetHit(Attri:GetHit() + 355);
    Attri:SetAtk(Attri:GetAtk() + 118 );
elseif skillLv == 146 then
    Attri:SetHit(Attri:GetHit() + 359);
    Attri:SetAtk(Attri:GetAtk() + 119 );
elseif skillLv == 147 then
    Attri:SetHit(Attri:GetHit() + 363);
    Attri:SetAtk(Attri:GetAtk() + 121 );
elseif skillLv == 148 then
    Attri:SetHit(Attri:GetHit() + 367);
    Attri:SetAtk(Attri:GetAtk() + 122 );
elseif skillLv == 149 then
    Attri:SetHit(Attri:GetHit() + 371);
    Attri:SetAtk(Attri:GetAtk() + 123 );
elseif skillLv == 150 then
    Attri:SetHit(Attri:GetHit() + 375);
    Attri:SetAtk(Attri:GetAtk() + 125 );
elseif skillLv == 151 then
    Attri:SetHit(Attri:GetHit() + 379);
    Attri:SetAtk(Attri:GetAtk() + 126 );
elseif skillLv == 152 then
    Attri:SetHit(Attri:GetHit() + 383);
    Attri:SetAtk(Attri:GetAtk() + 127 );
elseif skillLv == 153 then
    Attri:SetHit(Attri:GetHit() + 387);
    Attri:SetAtk(Attri:GetAtk() + 129 );
elseif skillLv == 154 then
    Attri:SetHit(Attri:GetHit() + 391);
    Attri:SetAtk(Attri:GetAtk() + 130 );
elseif skillLv == 155 then
    Attri:SetHit(Attri:GetHit() + 395);
    Attri:SetAtk(Attri:GetAtk() + 131 );
elseif skillLv == 156 then
    Attri:SetHit(Attri:GetHit() + 399);
    Attri:SetAtk(Attri:GetAtk() + 133 );
elseif skillLv == 157 then
    Attri:SetHit(Attri:GetHit() + 403);
    Attri:SetAtk(Attri:GetAtk() + 134 );
elseif skillLv == 158 then
    Attri:SetHit(Attri:GetHit() + 407);
    Attri:SetAtk(Attri:GetAtk() + 135 );
elseif skillLv == 159 then
    Attri:SetHit(Attri:GetHit() + 411);
    Attri:SetAtk(Attri:GetAtk() + 137 );
elseif skillLv == 160 then
    Attri:SetHit(Attri:GetHit() + 416);
    Attri:SetAtk(Attri:GetAtk() + 138 );
elseif skillLv == 161 then
    Attri:SetHit(Attri:GetHit() + 420);
    Attri:SetAtk(Attri:GetAtk() + 140 );
elseif skillLv == 162 then
    Attri:SetHit(Attri:GetHit() + 424);
    Attri:SetAtk(Attri:GetAtk() + 141 );
elseif skillLv == 163 then
    Attri:SetHit(Attri:GetHit() + 428);
    Attri:SetAtk(Attri:GetAtk() + 142 );
elseif skillLv == 164 then
    Attri:SetHit(Attri:GetHit() + 432);
    Attri:SetAtk(Attri:GetAtk() + 144 );
elseif skillLv == 165 then
    Attri:SetHit(Attri:GetHit() + 437);
    Attri:SetAtk(Attri:GetAtk() + 145 );
elseif skillLv == 166 then
    Attri:SetHit(Attri:GetHit() + 441);
    Attri:SetAtk(Attri:GetAtk() + 147 );
elseif skillLv == 167 then
    Attri:SetHit(Attri:GetHit() + 445);
    Attri:SetAtk(Attri:GetAtk() + 148 );
elseif skillLv == 168 then
    Attri:SetHit(Attri:GetHit() + 450);
    Attri:SetAtk(Attri:GetAtk() + 150 );
elseif skillLv == 169 then
    Attri:SetHit(Attri:GetHit() + 454);
    Attri:SetAtk(Attri:GetAtk() + 151 );
elseif skillLv == 170 then
    Attri:SetHit(Attri:GetHit() + 459);
    Attri:SetAtk(Attri:GetAtk() + 153 );
elseif skillLv == 171 then
    Attri:SetHit(Attri:GetHit() + 463);
    Attri:SetAtk(Attri:GetAtk() + 154 );
elseif skillLv == 172 then
    Attri:SetHit(Attri:GetHit() + 467);
    Attri:SetAtk(Attri:GetAtk() + 155 );
elseif skillLv == 173 then
    Attri:SetHit(Attri:GetHit() + 472);
    Attri:SetAtk(Attri:GetAtk() + 157 );
elseif skillLv == 174 then
    Attri:SetHit(Attri:GetHit() + 476);
    Attri:SetAtk(Attri:GetAtk() + 158 );
elseif skillLv >= 175 then
    Attri:SetHit(Attri:GetHit() + 481);
    Attri:SetAtk(Attri:GetAtk() + 160 );

else
	Attri:SetAtk(Attri:GetHit()+0);
end
end
