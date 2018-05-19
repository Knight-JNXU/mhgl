	
function item61019CanUse(Atk, Target) 
end

function item61019Use(Atk, Target, item)
--Get target name
	local DisplayFaction = Target:GetFaction();
	local DisplayLevel = Target:GetLevel();
	if DisplayFaction == 0 then
		DisplayFaction = "无帮派";
	elseif DisplayFaction == 1 then
		DisplayFaction = "六扇门";
	elseif DisplayFaction == 2 then
		DisplayFaction = "十二连环坞";
	elseif DisplayFaction == 3 then
		DisplayFaction = "圣坛";
	elseif DisplayFaction == 4 then
		DisplayFaction = "银钩赌坊";
	elseif DisplayFaction == 5 then
		DisplayFaction = "唐门";
	elseif DisplayFaction == 6 then
		DisplayFaction = "万福万寿园";
	elseif DisplayFaction == 7 then
		DisplayFaction = "青衣楼";
	elseif DisplayFaction == 8 then
		DisplayFaction = "鬼域";
	end
	
	local DisplayHp = Target:GetHP();
	local DisplayMHp = Target:GetMHP();
	local DisplaySp = Target:GetSP();
	local DisplayMSp = Target:GetMSP();
	local DisplayDp = Target:GetDP();
	--Get target  atk element
	--Get target  def element
	
	local DisplayAtk = Target:GetATK();
	local DisplayDef = Target:GetDEF();
	local DisplaySpd = Target:GetSPD();
	local DisplayPow = Target:GetPOW();
	local DisplayHit = Target:GetHIT();
	local DisplayEva = Target:GetEVA();
	
	local DisplaySTA = Target:GetSTA();
	local DisplaySPR = Target:GetSPR();
	local DisplaySTR = Target:GetSTR();
	local DisplayCON = Target:GetCON();
	local DisplayAGI = Target:GetAGI();
	
	local Display = string.format("\#W等级\#Y%d\#W，\#G[%s]\#W，当前生命\#Y%d\#W/当前生命上限\#Y%d\#W，当前内力\#Y%d\#W/当前内力上限\#Y%d\#W，当前酒意\#Y%d\#W，攻击\#Y%d\#W，防御\#Y%d\#W，速度\#Y%d\#W，内功\#Y%d\#W，命中\#Y%d\#W，闪避\#Y%d\#W，根骨\#Y%d\#W，内息\#Y%d\#W，臂力\#Y%d\#W，体质\#Y%d\#W，身法\#Y%d"
	, DisplayLevel, DisplayFaction, DisplayHp, DisplayMHp, DisplaySp, DisplayMSp, DisplayDp, DisplayAtk, DisplayDef, DisplaySpd, DisplayPow, DisplayHit, DisplayEva, DisplaySTA, DisplaySPR, DisplaySTR, DisplayCON, DisplayAGI);
	
    
	if battle == 0 then
		--Atk:UseSkillMsg(Display);
	else	
		--Atk:UseSkillMsg(Display);
		battle:PushReactionActor(Target);
	end

end
