	
function item61019CanUse(Atk, Target) 
end

function item61019Use(Atk, Target, item)
--Get target name
	local DisplayFaction = Target:GetFaction();
	local DisplayLevel = Target:GetLevel();
	if DisplayFaction == 0 then
		DisplayFaction = "�ް���";
	elseif DisplayFaction == 1 then
		DisplayFaction = "������";
	elseif DisplayFaction == 2 then
		DisplayFaction = "ʮ��������";
	elseif DisplayFaction == 3 then
		DisplayFaction = "ʥ̳";
	elseif DisplayFaction == 4 then
		DisplayFaction = "�����ķ�";
	elseif DisplayFaction == 5 then
		DisplayFaction = "����";
	elseif DisplayFaction == 6 then
		DisplayFaction = "������԰";
	elseif DisplayFaction == 7 then
		DisplayFaction = "����¥";
	elseif DisplayFaction == 8 then
		DisplayFaction = "����";
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
	
	local Display = string.format("\#W�ȼ�\#Y%d\#W��\#G[%s]\#W����ǰ����\#Y%d\#W/��ǰ��������\#Y%d\#W����ǰ����\#Y%d\#W/��ǰ��������\#Y%d\#W����ǰ����\#Y%d\#W������\#Y%d\#W������\#Y%d\#W���ٶ�\#Y%d\#W���ڹ�\#Y%d\#W������\#Y%d\#W������\#Y%d\#W������\#Y%d\#W����Ϣ\#Y%d\#W������\#Y%d\#W������\#Y%d\#W����\#Y%d"
	, DisplayLevel, DisplayFaction, DisplayHp, DisplayMHp, DisplaySp, DisplayMSp, DisplayDp, DisplayAtk, DisplayDef, DisplaySpd, DisplayPow, DisplayHit, DisplayEva, DisplaySTA, DisplaySPR, DisplaySTR, DisplayCON, DisplayAGI);
	
    
	if battle == 0 then
		--Atk:UseSkillMsg(Display);
	else	
		--Atk:UseSkillMsg(Display);
		battle:PushReactionActor(Target);
	end

end
