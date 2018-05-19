--洞悉

function skill0051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需宁神静气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0051Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.7 * skillLv + 15;
	
	if battle == 0 then
		consumeSp = 2 * skillLv;
	end
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展洞悉", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	if battle == 0 and (Target:GetLevel() > skillLv - 10) or (Target:GetLevel() > skillLv - 5) then
		Atk:UseSkillMsg("\#W对方等级太高，无法洞悉");
		do return end
	end
	
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
	
	local Display = string.format("\#W等级\#Y%d\#W，\#G[%s]\#W，当前生命\#Y%d\#W/当前生命上限\#Y%d\#W，当前内力\#Y%d\#W/当前内力上限\#Y%d\#W，当前酒意\#Y%d"
	, DisplayLevel, DisplayFaction, DisplayHp, DisplayMHp, DisplaySp, DisplayMSp, DisplayDp);
	
	if battle == 0 then
		Atk:UseSkillMsg(Display);
	else	
		Atk:UseSkillMsg(Display);
		battle:PushReactionActor(Target);
	end
	
end

