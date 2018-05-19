Item80088 = {
}

function Item80088:MapUse(target)
    if  player:HasBuff(264) or player:HasBuff(265) or player:HasBuff(266) then 		
		ItemAsk("你已经雇用了护卫，若要雇用新的护卫会取代原来的护卫，你确定继续吗？")
		SetAnswer(1,"雇用新的护卫或增加四小时")
		SetAnswer(2,"离开")
		WaitAnswer(2)
			
		if GetAnswer() == 1 then
			if not item:ReduceCount() then return end
			player:RemoveBuff(265)
			player:RemoveBuff(266)
			if player:HasBuff(264) then
			   local Buff264 = player:FindBuff(264)
			   local Buff264CoolDown = Buff264:GetBuffCoolDown() 					
			   NewBuff264CoolDown = (Buff264CoolDown + 14400)/60 + 1;
			   player:AddBuff(264, 0, 0, 0, NewBuff264CoolDown, 100)
			else
			   player:AddBuff(264, 0, 0, 0, 240, 0)
			end
			ShowHint("雇用成功！接下来的四个小时普通暗雷战斗中鬼将护卫会协助你战斗。")
		end
	else
		if not item:ReduceCount() then return end
		ShowHint("雇用成功！接下来的四个小时普通暗雷战斗中鬼将护卫会协助你战斗。")
		player:AddBuff(264, 0, 0, 0, 240, 0)
	end
end

function Item80088:CanUse(user, target)
end

function Item80088:BattleUse(user, target)

end

AddItemTable(Item80088)