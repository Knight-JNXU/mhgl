--属性还原2

function skill8108Attri(Char, skillLv, Attri) 
    local level = Char:GetLevel();
	local atklevelmodify = 1;
	local deflevelmodify = 1;
	local powerlevelmodify = 1;
	local hitlevelmodify = 1;
	local evalevelmodify = 1;
	local spdlevelmodify = 1;
	local maxHPlevelmodify = 1;
	local maxSPlevelmodify = 1;
	if level < 10 then
	    atklevelmodify = 0.75/0.5;
		deflevelmodify = 0.75/0.4;
		powerlevelmodify = 0.75/0.5;
		hitlevelmodify = 0.8;
		evalevelmodify = 0.75/0.3;
		spdlevelmodify = 0.75/0.7;
		maxHPlevelmodify = 0.75/0.6;
		maxSPlevelmodify = 1;
	elseif level < 20 then
	    atklevelmodify = 0.75/0.5;
		deflevelmodify = 0.75/0.4;
		powerlevelmodify = 0.75/0.5;
		hitlevelmodify = 0.8;
		evalevelmodify = 0.75/0.3;
		spdlevelmodify = 0.75/0.7;
		maxHPlevelmodify = 0.75/0.5;
		maxSPlevelmodify = 1;
	elseif level < 30 then
	    atklevelmodify = 0.75/0.55;
		deflevelmodify = 0.75/0.4;
		powerlevelmodify = 0.75/0.5;
		hitlevelmodify = 0.8;
		evalevelmodify = 0.75/0.3;
		spdlevelmodify = 0.75/0.7;
		maxHPlevelmodify = 0.75/0.5;
		maxSPlevelmodify = 1;
	elseif level < 40 then
	    atklevelmodify = 0.75/0.55;
		deflevelmodify = 0.75/0.5;
		powerlevelmodify = 0.75/0.55;
		hitlevelmodify = 0.8;
		evalevelmodify = 0.75/0.4;
		spdlevelmodify = 0.8;
		maxHPlevelmodify = 0.75/0.6;
		maxSPlevelmodify = 1;
	elseif level < 50 then
	    atklevelmodify = 0.75/0.6;
		deflevelmodify = 0.75/0.6;
		powerlevelmodify = 0.75/0.6;
		hitlevelmodify = 0.85;
		evalevelmodify = 0.75/0.5;
		spdlevelmodify = 0.85;
		maxHPlevelmodify = 0.75/0.65;
		maxSPlevelmodify = 1;
	elseif level < 60 then
	    atklevelmodify = 0.75/0.65;
		deflevelmodify = 0.75/0.65;
		powerlevelmodify = 0.75/0.65;
		hitlevelmodify = 0.9;
		evalevelmodify = 0.75/0.6;
		spdlevelmodify = 0.9;
		maxHPlevelmodify = 0.75/0.7;
		maxSPlevelmodify = 1;
	elseif level < 70 then
	    atklevelmodify = 0.75/0.7;
		deflevelmodify = 0.75/0.7;
		powerlevelmodify = 0.75/0.7;
		hitlevelmodify = 0.95;
		evalevelmodify = 0.75/0.7;
		spdlevelmodify = 0.95;
		maxHPlevelmodify = 0.75;
		maxSPlevelmodify = 1;
	end
	Attri:SetAtk(Attri:GetAtk() * atklevelmodify);
	Attri:SetDef(Attri:GetDef() * deflevelmodify);
	Attri:SetPow(Attri:GetPow() * powerlevelmodify);
	Attri:SetSpd(Attri:GetSpd() * spdlevelmodify);
	Attri:SetHit(Attri:GetHit() * hitlevelmodify);
	Attri:SetEva(Attri:GetEva() * evalevelmodify);
	Attri:SetMaxHp(Attri:GetMaxHp() * maxHPlevelmodify);
	Attri:SetMaxSp(Attri:GetMaxSp() * maxSPlevelmodify);
end
