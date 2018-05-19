Item59007 = {
}

function Item59007:MapUse(target)
	-- 只能使用在玩家自己身上
	--[[if target ~= player then
		-- 提示错误讯息
		ShowError("这物品只能使用在玩家自己身上！")
		return
	end]]--
	local Skill13030 = player:HasSkill(13030); 
	local SkillLv = player:GetSkillLv(13030);
	if item:GetBuffID() == 0 then
		if Skill13030 and SkillLv >= 20 then
			local BuffValue1Min = SkillLv * 0.1;
			local BuffValue1Max = SkillLv * 0.35;
			local ItemBuffValue1 = BuffValue1Min;		--math.random(BuffValue1Min,BuffValue1Max);
			local consumeVp = 5 + math.floor(0.25 * SkillLv);
			if player:GetVP() < consumeVp then
				ShowHint(string.format("体力不足%d点，无法进行附魔",consumeVp))
			else
				player:ChangeVP(-1 * consumeVp);
				item:AddBuff(195, ItemBuffValue1, 0, 0, 0,100);
				ShowHint(string.format("成功为附魔符附魔临时体质%d点",ItemBuffValue1))
			end
		else
			ShowHint("需要文韬武略等级达到20才能进行体质附魔")
			return
		end	
	else  
		if player:HasEquipment(5) then
			if not item:ReduceCount() then return end
			player:AddEquipmentBuff(5, 194, item:GetBuffValue1(), item:GetBuffValue2(), item:GetBuffValue3(), item:GetBuffCoolDown(), item:GetBuffPro());
			ShowHint(string.format("成功给项链增加临时体质%d点", item:GetBuffValue1()))
		else
			ShowHint("需要先装备武器后才能给项链增加临时体质")
			return
		end	
	end
end

function Item59007:CanUse(user, target)
end

function Item59007:BattleUse(user, target)
end

AddItemTable(Item59007)