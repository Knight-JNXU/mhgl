--author: hula
--金柳露指定同伴后右击使用：只能对携带要求不大于35级的紫人形同伴使用，等级归0，各项能力重新生成
--北方修改  2009-0-23
Item30000 = {
}

function Item30000:MapUse(target)
	local mobid = target:GetMob_id()	
	  
	local PartnerTable = { 
						[334] = 7041,
						[359] = 7060,
						[361] = 7061,
						[325] = 7062,
						[330] = 7063,
						[336] = 7064,
						[363] = 7065,
						[565] = 7066,
						[320] = 7067,
						[396] = 7068,
						[371] = 7069,
						[365] = 7070,
						[99] = 7071,
						[545] = 7072,
						[370] = 7074,
						[399] = 7075,
						[347] = 7077,
						[360] = 7078,
						[372] = 7079,
						[346] = 7080,
						[368] = 7084,
						[367] = 7087,
						[353] = 7089,
						[366] = 7090,
						[364] = 7093,
						[369] = 7095,
						[414] = 7097,
						[343] = 7100,
						[362] = 7106,
						[409] = 7108,
						}
						
						
	if target and target:GetUserType() == 2 then --同伴	
		if target:GetLock() then 
			ShowHint("已上锁的同伴无法使用")
			return
		end	
		if target:GetRace() ~= 4 then
			ShowHint("超级金柳露只能对变异宝宝或神兽使用")
			return
		end
		if target:GetReqLv() >= 155 then
			 ShowHint("超级金柳露只能对携带要求不大于155级的宝宝使用")
			 return
		end
		--ItemAsk(string.format("你确定要让\#P%s\#W使用超级金柳露吗？", target:GetName()))
		--SetAnswer(1, "确定")
		--SetAnswer(2, "取消")			
		--WaitAnswer(2)
		--if GetAnswer() == 1 then		
			if not item:ReduceCount() then return end
			local r = math.random(0, 100)
			if r <= 1 and mobid and target:GetRace()== 4 and PartnerTable[mobid] ~= nil then --百分之1的几率生成变异宝宝				
				player:GetPartners():RemovePartner(target)
				player:GetPartners():AddPartner(PartnerTable[mobid]) --变异宝宝ID
		    ShowHint("修炼过超级金柳露后你的宠物竟然进阶了！")	
		    script:Rumor(string.format(" %s #W对#O%s#W使用了超级金柳露,竟然进阶了#24", player:GetCharNameLink(),target:GetName()), true)
			elseif mobid and target:GetRace()== 4 and PartnerTable[mobid] ~= nil then
			target:ResetPartner()			--!!!!!! 等级变为0级，各项能力重新生成
			ShowHint("#Y宝宝属性已重置。当前召唤兽类型：#G[可进阶型]")		
			else
			target:ResetPartner()			--!!!!!! 等级变为0级，各项能力重新生成
			ShowHint("#Y宝宝属性已重置。当前召唤兽类型：#R[不可进阶]")	
	    end
	  --end
	else
	  ShowHint("超级金柳露只能对宠物使用")
	end
end--]]

function Item30000:CanUse(user, target)
end

function Item30000:BattleUse(user, target)

end

AddItemTable(Item30000)