---2016-2-15---药罐子
Npc07002= {	
	npc_id = 7002,				
	name = GetNpcName(7002),
}

function Npc07002:Talk(self,bProcess)
	local Day = LuaI.GetRealDay(LuaI.GetServiceTime())--当月天数
	local ljjq = player:GetQuests():GetNpcFlag(7002, Day, 0)
	local money = math.floor((ljjq * 50000) + 1000000)
	NpcAsk(string.format("#O%s#W,请问你是否尝试打开宝箱？目前宝箱内含银两:#A%s#W银两\\r#Y说明#V：尝试打开宝箱将收取5万银两,如成功打开宝箱则不扣取本身银两并成功获得宝箱内所有银两,如果尝试打开失败,将扣除角色5万银两,并累计到宝箱中.每个角色开启次数不限", player:GetName(),money), false)
	SetAnswer(1, "尝试打开")
	SetAnswer(2, "离开")
	WaitAnswer(2)
	if GetAnswer() == 1 then--选择第一个选项
		if player:GetLevel() < 40 then
			ShowHint("#O等级小于#A40#O级~不能参与此活动。#26")
			return 
		end
		local Day = LuaI.GetRealDay(LuaI.GetServiceTime())--当月天数
		local ljjq = player:GetQuests():GetNpcFlag(7002, Day, 0)
		if player:GetMoney() >= 50000 then ---判断银两
			local jl = math.random(1,30)
			if jl < 29 then
				if IsProcess() then
					script:SetSaying(true)
					ShowHint(string.format("您没有成功打开宝箱,望再接再厉...目前宝箱内银两为:#A%s#W银两",money + 50000), false)
					ShowError("失去5万银两")
					player:GetQuests():SetNpcFlag(7002, Day, 0, ljjq + 1)
					player:ChangeMoneyForScript(-50000, 13014)
					--ShowHint(string.format("您没有成功打开宝箱,望再接再厉...目前宝箱内银两为:#A%s#W银两",money + 1000000), false)
				end
				if ljjq == 2 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)
				elseif ljjq == 3 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)
				elseif ljjq == 5 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)
				elseif ljjq == 10 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)
				elseif ljjq == 15 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)
				elseif ljjq == 20 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)
				elseif ljjq == 25 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)					
				elseif ljjq == 30 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)					
				elseif ljjq == 35 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)					
				elseif ljjq == 40 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)					
				elseif ljjq == 45 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)					
				elseif ljjq == 50 then
					script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:目前：真遗憾,暂时没有幸运者成功开启宝箱~目前宝箱内累计金额为:#O%s#O银两...#54",money + 50000), false)					
				end
			else
				if IsProcess() then
					script:SetSaying(true)
					player:GetQuests():SetNpcFlag(7002, Day, 0, ljjq - ljjq)
					player:ChangeMoneyForScript(money, 2)
					ShowError(string.format("获得:#A%s#W银两",money), false)
					if npc then
						npc:Destroy()
						if npc then
							npc:SetEnableBattle(false)
							ShowHint(string.format("恭喜你~成功打开宝箱,获得所有银两~.共为:#A%s#W银两",money), false)
							script:Rumor(string.format("#Y[#H财神娱乐#Y]#O:我们本次成功开启宝箱的幸运星是：#A%s#O。获得宝箱内所有金额,共计:#R%s#O银两...", player:GetName(),money), false)
													end
					end
				end
			end	
		else	
			NpcSay(string.format("没有钱别来瞎捣蛋#O%s#W,快去赚钱吧", player:GetName()), false)	
		end
	end
end

AddNpcTable(Npc07002)