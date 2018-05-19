Item59006 = {
}

function Item59006:MapUse(target)
	-- 只能使用在玩家自己身上
	--[[if target ~= player then
		-- 提示错误讯息
		ShowError("这物品只能使用在玩家自己身上！")
		return
	end]]--
	local Skill20050 = player:HasSkill(20050); 
	local SkillLv = player:GetSkillLv(20050);
	if item:GetBuffID() == 0 then
		if Skill20050 and SkillLv >= 20 then
			local BuffValue1Min = SkillLv * 1.05;
			local BuffValue1Max = SkillLv * 1.55;
			local ItemBuffValue1 = BuffValue1Min;		--math.random(BuffValue1Min,BuffValue1Max);
			local consumeVp = 5 + math.floor(0.25 * SkillLv);
			if player:GetVP() < consumeVp then
				ShowHint(string.format("体力不足%d点，无法进行附魔",consumeVp))
			else
				player:ChangeVP(-1 * consumeVp);
				item:AddBuff(199, ItemBuffValue1, 0, 0, 0,100);
				ShowHint(string.format("成功为附魔符附魔临时灵力%d点",ItemBuffValue1))
			end
		else
			ShowHint("需要金刚经等级达到20才能进行攻击附魔")
			return
		end	
	else  
		if player:HasEquipment(0) then
			if not item:ReduceCount() then return end
			player:AddEquipmentBuff(0, 198, item:GetBuffValue1(), item:GetBuffValue2(), item:GetBuffValue3(), item:GetBuffCoolDown(), item:GetBuffPro());
			ShowHint(string.format("成功给武器增加临时灵力%d点", item:GetBuffValue1()))
		else
			ShowHint("需要先装备武器后才能给武器增加临时灵力")
			return
		end	
	end
end

function Item59006:CanUse(user, target)
end

function Item59006:BattleUse(user, target)
end

AddItemTable(Item59006)