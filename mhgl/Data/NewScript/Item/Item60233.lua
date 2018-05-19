--author: 蒋宇
--新手双倍叠加丹：使用后一小时内不会弹出防外挂对话框，自动回合数增加为300回合。

Item60232 = {
}

function Item60232:MapUse(target)
	local TotalRound655 = 0;
	local type655 = player:GetQuests():GetType(655);
	if type655 ~= nil then
		TotalRound655 = type655:GetTotalRound();
	end
	ItemAsk("你每星期最多可以使用140次“新手双倍叠加丹”哟~")
	-- 设定选择答案 1
	SetAnswer(1, string.format("使用“新手双倍叠加丹”（本周剩余次数%d次）", 140-TotalRound655))
	-- 设定选择答案 2
	SetAnswer(2, "离开")
	-- 等待回答，默认答案为 2
	WaitAnswer(2)
	
	if GetAnswer() == 1 then
		if TotalRound655 >= 140 then
			ShowHint("本周使用次数已达到上限。")
			return
		end
		if player:GetLevel() > 200 then
		    ShowHint("高于119级不可使用")
			return
		end
		
		if player:HasBuff(219) then
			local Buff219 = player:FindBuff(219)
			local Buff219CoolDown = Buff219:GetBuffCoolDown() 					
			if not item:ReduceCount() then return end
			NewBuff219CoolDown = (Buff219CoolDown + 3600)/60 + 1;
			if Buff219CoolDown > 5400 then
			ShowHint("成功使用物品，增加一小时的新手双倍叠加丹状态")
			return
			end
			player:AddBuff(219, 0, 0, 0, NewBuff219CoolDown, 100)
			if type655 == nil then
				player:GetQuests():SetRoundInfo(655, 1, 14, 2);
				type655 = player:GetQuests():GetType(655);
				type655:ChangeTotalRound(1)	
				ShowHint("成功使用物品，增加一小时的新手双倍叠加丹状态")
			else
				type655:ChangeTotalRound(1)
				ShowHint("成功使用物品，增加一小时的新手双倍叠加丹状态")
			end		
		else
			if not item:ReduceCount() then return end			
			player:AddBuff(219, 0, 0, 0, 60, 100)
			if type655 == nil then
				player:GetQuests():SetRoundInfo(655, 1, 14, 2);
				type655 = player:GetQuests():GetType(655);
				type655:ChangeTotalRound(1)	
				ShowHint("成功使用物品，获得一小时的新手双倍叠加丹状态")
			else
				type655:ChangeTotalRound(1)
				ShowHint("成功使用物品，增加一小时的新手双倍叠加丹状态")
			end
		end	
	end
end

function Item60232:CanUse(user, target)
end

function Item60232:BattleUse(user, target)

end

AddItemTable(Item60232)