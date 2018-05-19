Item59004 = {
}

function Item59004:MapUse(target)
	-- 只能使用在玩家自己身上
	--[[if target ~= player then
		-- 提示错误讯息
		ShowError("这物品只能使用在玩家自己身上！")
		return
	end]]--
	local Skill15030 = player:HasSkill(15030); 
	local SkillLv = player:GetSkillLv(15030);
	if item:GetBuffID() == 0 then
		if Skill15030 and SkillLv >= 20 then
			local BuffValue1Min = SkillLv * 1.05;
			local BuffValue1Max = SkillLv * 1.55;
			local ItemBuffValue1 = BuffValue1Min;		--math.random(BuffValue1Min,BuffValue1Max);
			local consumeVp = 10 + math.floor(0.25 * SkillLv);
			if player:GetVP() < consumeVp then
				ShowHint(string.format("体力不足%d点，无法进行附魔",consumeVp))
			else
				player:ChangeVP(-1 * consumeVp);
				item:AddBuff(233, ItemBuffValue1, 0, 0, 0,100);
				ShowHint(string.format("成功为附魔符附魔临时防御%d点",ItemBuffValue1))
			end
		else
			ShowHint("需要盘丝大法等级达到20进行防御附魔")
			return
		end	
	else  
		if player:HasEquipment(2) then
			if not item:ReduceCount() then return end
			player:AddEquipmentBuff(2, 228, item:GetBuffValue1(), item:GetBuffValue2(), item:GetBuffValue3(), item:GetBuffCoolDown(), item:GetBuffPro());
			ShowHint(string.format("成功给衣服增加临时防御%d点", item:GetBuffValue1()))
		else
			ShowHint("需要先装备衣服后才能给衣服增加临时防御")
			return
		end	
	end
end

function Item59004:CanUse(user, target)
end

function Item59004:BattleUse(user, target)
end

AddItemTable(Item59004)