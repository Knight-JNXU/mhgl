--属性调整6（雇佣兵属性还原）

function skill5305Attri(Char, skillLv, Attri) 
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
	    atklevelmodify = 0.6;
		deflevelmodify = 0.3;		
		hitlevelmodify = 1;
		evalevelmodify = 0.2;
		powerlevelmodify = 0.4;
		spdlevelmodify = 0.5/0.35;
		maxHPlevelmodify = 0.28;
		maxSPlevelmodify = 0.28;
	elseif level < 20 then
	    atklevelmodify = 0.7;
		deflevelmodify = 0.3;		
		hitlevelmodify = 1;
		evalevelmodify = 0.6;
		powerlevelmodify = 0.4;
		spdlevelmodify = 0.5/0.37;
		maxHPlevelmodify = 0.35;
		maxSPlevelmodify = 0.35;
	elseif level < 30 then
	    atklevelmodify = 0.8;
		deflevelmodify = 0.3;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.7;
		spdlevelmodify = 0.5/0.38;
		maxHPlevelmodify = 0.4;
		maxSPlevelmodify = 0.4;
	elseif level < 40 then
	    atklevelmodify = 0.95;
		deflevelmodify = 0.35;		
		hitlevelmodify = 1;
		evalevelmodify = 0.75;
		powerlevelmodify = 0.8;
		spdlevelmodify = 0.5/0.4;
		maxHPlevelmodify = 0.45;
		maxSPlevelmodify = 0.45;
	elseif level < 50 then
	    atklevelmodify = 1.05;
		deflevelmodify = 0.4;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.85;
		spdlevelmodify = 0.5/0.43;
		maxHPlevelmodify = 0.5;
		maxSPlevelmodify = 0.5;
	elseif level < 60 then
	    atklevelmodify = 1.07;
		deflevelmodify = 0.4;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.85;
		spdlevelmodify = 0.5/0.43;
		maxHPlevelmodify = 0.525;
		maxSPlevelmodify = 0.525;
	elseif level < 70 then
	    atklevelmodify = 1.1;
		deflevelmodify = 0.45;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.85;
		spdlevelmodify = 0.5/0.46;
		maxHPlevelmodify = 0.55;
		maxSPlevelmodify = 0.55;
	elseif level < 200 then
	    atklevelmodify = 1.1;
		deflevelmodify = 0.5;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.9;
		spdlevelmodify = 0.5/0.5;
		maxHPlevelmodify = 0.7;
		maxSPlevelmodify = 0.7;
	end
	
	atklevelmodify = 1/atklevelmodify;
	deflevelmodify = 1/deflevelmodify;
	powerlevelmodify = 1/powerlevelmodify;
	hitlevelmodify = 1/hitlevelmodify;
	evalevelmodify = 1/evalevelmodify;
	spdlevelmodify = 1/spdlevelmodify;
	maxHPlevelmodify = 1/maxHPlevelmodify;
	maxSPlevelmodify = 1/maxSPlevelmodify;
	
	Attri:SetAtk(Attri:GetAtk() * atklevelmodify);
	Attri:SetDef(Attri:GetDef() * deflevelmodify);
	Attri:SetPow(Attri:GetPow() * powerlevelmodify);
	Attri:SetSpd(Attri:GetSpd() * spdlevelmodify);
	Attri:SetHit(Attri:GetHit() * hitlevelmodify);
	Attri:SetEva(Attri:GetEva() * evalevelmodify);
	Attri:SetMaxHp(Attri:GetMaxHp() * maxHPlevelmodify);
	Attri:SetMaxSp(Attri:GetMaxSp() * maxSPlevelmodify);
end
