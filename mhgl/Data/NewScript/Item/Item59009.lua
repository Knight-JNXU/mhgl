Item59009 = {
}

function Item59009:MapUse(target)
	-- 只能使用在玩家自己身上
	--[[if target ~= player then
		-- 提示错误讯息
		ShowError("这物品只能使用在玩家自己身上！")
		return
	end]]--
	local Skill19060 = player:HasSkill(19060); 
	local SkillLv = player:GetSkillLv(19060);
	if item:GetBuffID() == 0 then
		if Skill19060 and SkillLv >= 20 then
			local BuffValue1Min = SkillLv * 0.55;
			local BuffValue1Max = SkillLv * 1.05;
			local ItemBuffValue1 = BuffValue1Min;		--math.random(BuffValue1Min,BuffValue1Max);
			local consumeVp = 5 + math.floor(0.25 * SkillLv);
			if player:GetVP() < consumeVp then
				ShowHint(string.format("体力不足%d点，无法进行附魔",consumeVp))
			else
				player:ChangeVP(-1 * consumeVp);
				item:AddBuff(197, ItemBuffValue1, 0, 0, 0,100);
				ShowHint(string.format("成功为附魔符附魔临时速度%d点",ItemBuffValue1))
			end
		else
			ShowHint("需要佛光普照等级达到20才能进行内力附魔")
			return
		end	
	else  
		if player:HasEquipment(5) then
			if not item:ReduceCount() then return end
			player:AddEquipmentBuff(5, 196, item:GetBuffValue1(), item:GetBuffValue2(), item:GetBuffValue3(), item:GetBuffCoolDown(), item:GetBuffPro());
			ShowHint(string.format("成功给戒指增加临时速度%d点", item:GetBuffValue1()))
		else
			ShowHint("需要先装备戒指后才能给戒指增加临时速度")
			return
		end	
	end
end

function Item59009:CanUse(user, target)
end

function Item59009:BattleUse(user, target)
end

AddItemTable(Item59009)