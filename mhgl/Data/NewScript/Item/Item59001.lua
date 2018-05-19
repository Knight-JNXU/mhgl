Item59001 = {
}

function Item59001:MapUse(target)
	-- 只能使用在玩家自己身上
	--[[if target ~= player then
		-- 提示错误讯息
		ShowError("这物品只能使用在玩家自己身上！")
		return
	end]]--
	local Skill11030 = player:HasSkill(11030);
	local SkillLv = player:GetSkillLv(11030);
	if item:GetBuffID() == 0 then
		if Skill11030 and SkillLv >= 20 then
			local BuffValue1Min = SkillLv * 2.25;
			local BuffValue1Max = SkillLv * 2.75;
			local ItemBuffValue1 = BuffValue1Min;		--math.random(BuffValue1Min,BuffValue1Max);
			local consumeVp = 5 + math.floor(0.25 * SkillLv);
			if player:GetVP() < consumeVp then
				ShowHint(string.format("体力不足%d点，无法进行附魔",consumeVp))
			else
				player:ChangeVP(-1 * consumeVp);
				item:AddBuff(235, ItemBuffValue1, 0, 0, 0,100);
				ShowHint(string.format("成功为附魔符附魔临时生命%d点",ItemBuffValue1))
			end
		else
			ShowHint("需要牛逼神功等级达到20才能进行生命附魔")
			return
		end	
	else  
		if player:HasEquipment(0) then
			if not item:ReduceCount() then return end
			player:AddEquipmentBuff(0, 230, item:GetBuffValue1(), item:GetBuffValue2(), item:GetBuffValue3(), item:GetBuffCoolDown(), item:GetBuffPro());
			ShowHint(string.format("成功给武器增加临时生命%d点", item:GetBuffValue1()))
		else
			ShowHint("需要先装备武器后才能给武器增加临时生命")
			return
		end	
	end
end

function Item59001:CanUse(user, target)
end

function Item59001:BattleUse(user, target)
end

AddItemTable(Item59001)