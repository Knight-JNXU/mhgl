--体力剂
--author: beifang

Item30009 = {
}

function Item30009:MapUse(target)		
	if target then 
	   	local TotalRound660 = 0;
		local type660 = player:GetQuests():GetType(660);
		if type660 ~= nil then
			TotalRound660 = type660:GetTotalRound();
		end
		if TotalRound660 >= 20 then
			ShowHint("今天使用此类物品次数已达上限。")
			return
		end		
        local MapId = target:GetMap_id()
		if MapId >= 56400 and MapId <= 56407 then
		    ShowHint("帮战地图中无法使用体力剂")
			return
		end
		if target:GetVP() == target:GetMaxVP() then
			ShowHint("你的体力值已达上限，无须再服用体力剂")			
		else
			if not item:ReduceCount() then return end
			if target:GetVP() + 300 <= target:GetMaxVP() then
				target:ChangeVP(300)
				ShowHint("成功使用体力剂")	
			else
				local VpChange = target:GetMaxVP() - target:GetVP()
				target:ChangeVP(VpChange)
				ShowHint("成功使用体力剂")	
			end	
			if type660 == nil then
				target:GetQuests():SetRoundInfo(660, 1, 100, 1);
				type660 = target:GetQuests():GetType(660);
				type660:ChangeTotalRound(1)
			else
				type660:ChangeTotalRound(1)
		    end		
		end	
	end
end

function Item30009:CanUse(user, target)
end

function Item30009:BattleUse(user, target)

end

AddItemTable(Item30009)