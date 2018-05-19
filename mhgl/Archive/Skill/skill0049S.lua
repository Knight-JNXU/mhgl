--���ʽ

function skill0049CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[ս��ѶϢ]������ʽ�������������\#G%d\#W�����ϲ���ʩչ", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[ս��ѶϢ]������ʽ������ȼ�\#G%d\#W���ϲ���ʩչ", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0049Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.3 * skillLv + 5;

	local Msg = string.format("\#W[ս��ѶϢ]����������\#G%d\#W���޷�ʩչ���ʽ", consumeSp);

	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Atk:SetPostSkill(500, Target:GetIndex(), 1, skillLv);
	Atk:AddBuff(23, 0, 0, 0, 2, 100);
	battle:PushReactionActor(Atk);
end
