--属性调整4（木桩属性调整）

function skill5303Attri(Char, skillLv, Attri) 
    local level = Char:GetLevel();
	local atklevelmodify = 1;
	local deflevelmodify = 0;
	local powerlevelmodify = 0;
	local hitlevelmodify = 1;
	local evalevelmodify = 1;
	local spdlevelmodify = 0.1;
	local maxHPlevelmodify = 0.1;
	local maxSPlevelmodify = 1;
	if level < 10 then
	    atklevelmodify = 0.6;
		deflevelmodify = 0.3;		
		hitlevelmodify = 1;
		evalevelmodify = 0.2;
		powerlevelmodify = 0.4;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.28;
		maxSPlevelmodify = 0.28;
	elseif level < 20 then
	    atklevelmodify = 0.7;
		deflevelmodify = 0.3;		
		hitlevelmodify = 1;
		evalevelmodify = 0.6;
		powerlevelmodify = 0.4;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.35;
		maxSPlevelmodify = 0.35;
	elseif level < 30 then
	    atklevelmodify = 0.8;
		deflevelmodify = 0.3;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.7;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.4;
		maxSPlevelmodify = 0.4;
	elseif level < 40 then
	    atklevelmodify = 0.95;
		deflevelmodify = 0.35;		
		hitlevelmodify = 1;
		evalevelmodify = 0.75;
		powerlevelmodify = 0.8;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.45;
		maxSPlevelmodify = 0.45;
	elseif level < 50 then
	    atklevelmodify = 1.05;
		deflevelmodify = 0.4;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.85;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.5;
		maxSPlevelmodify = 0.5;
	elseif level < 60 then
	    atklevelmodify = 1.07;
		deflevelmodify = 0.4;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.85;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.525;
		maxSPlevelmodify = 0.525;
	elseif level < 70 then
	    atklevelmodify = 1.1;
		deflevelmodify = 0.45;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.85;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.55;
		maxSPlevelmodify = 0.55;
	elseif level < 200 then
	    atklevelmodify = 1.1;
		deflevelmodify = 0.5;		
		hitlevelmodify = 1;
		evalevelmodify = 0.8;
		powerlevelmodify = 0.9;
		spdlevelmodify = 0.5;
		maxHPlevelmodify = 0.7;
		maxSPlevelmodify = 0.7;
	end
	
	atklevelmodify = 1/atklevelmodify;
	deflevelmodify = 0/deflevelmodify;
	powerlevelmodify = 0/powerlevelmodify;
	hitlevelmodify = 1.5/hitlevelmodify;
	evalevelmodify = 1/evalevelmodify;
	spdlevelmodify = 0.1/spdlevelmodify;
	maxHPlevelmodify = 0.1/maxHPlevelmodify;
	maxSPlevelmodify = 1/maxSPlevelmodify;
	
	Attri:SetAtk(Attri:GetAtk() * atklevelmodify);
	Attri:SetDef(Attri:GetDef() * deflevelmodify);
	Attri:SetPow(Attri:GetPow() * powerlevelmodify);
	Attri:SetSpd(2);
	Attri:SetHit(Attri:GetHit() * hitlevelmodify);
	Attri:SetEva(1);
	Attri:SetMaxHp(Attri:GetMaxHp() * maxHPlevelmodify);
	Attri:SetMaxSp(Attri:GetMaxSp() * maxSPlevelmodify);
end
