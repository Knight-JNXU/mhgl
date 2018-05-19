--变身

function skill1803CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
  local AreqSkillLv = Atk:GetSkillLv(1800)
	if skillLv < AreqSkillLv then 
	  local Msg = string.format("\#W[战斗讯息]：此技能需魔兽神功修炼到\#G%d\#W级以上才能施展", reqSkillLv);
	  Atk:SkillFail(Msg);
	  do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1502) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在变身状态");
	end
end

function skill1803Use(Atk, Target, battle, skillLv)
  local lv = Atk:GetLevel() * 250
  local consumeSp = 30;
  local money = Atk:GetMoney()
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展变身", consumeSp);
	if money < 3000 then
	  Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeMoney(-3000)
	Atk:AddBuff(1502, 0, 0, 0, 6, 100);
	
end
