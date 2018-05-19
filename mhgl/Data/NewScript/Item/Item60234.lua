--author: 蒋宇
--新手双倍叠加丹：使用后一小时内不会弹出防外挂对话框，自动回合数增加为300回合。

Item60233 = {
}

function Item60233:MapUse(target)
	ItemAsk("等级达到90级方可承受妖兽内丹的冲击，炼成法宝")
	-- 设定选择答案 1
	SetAnswer(1,"用了这就新手毕业了~" )
	-- 设定选择答案 2
	SetAnswer(2, "等我长大了再用")
	-- 等待回答，默认答案为 2
	WaitAnswer(2)
	
	if GetAnswer() == 1 then
		
		if player:GetLevel() < 90 then
		    ShowHint("你还无法承受妖兽内丹的冲击")
			return
		end
		
		if player:HasSkill(394) then
		    ShowHint("你已经有法宝了，这个还是留给有缘人把")
			return
		end
		if not item:ReduceCount() then return end
		player:AddSkill(394)
		ShowHint("拥有了本门法宝了，走向了人生颠峰！")

	end
end

function Item60233:CanUse(user, target)
end

function Item60233:BattleUse(user, target)

end

AddItemTable(Item60233)