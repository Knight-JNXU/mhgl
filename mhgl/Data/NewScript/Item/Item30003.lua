Item30003 = {
}
function Item30003:MapUse(target)                --导标旗
	local mapId = player:GetMap_id();
	  if player:GetLevel() < 10 then
		  ShowHint(string.format("\#P%s\#W等级小于10级无法使用", player:GetName()))
			return
		end
		if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603)or player:GetQuests():HasQuest(30604)or player:GetQuests():HasQuest(30605) then
			ShowHint(string.format("\#P%s\#W有跑镖任务无法使用", player:GetName()))
			return
		end
		if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
			ShowHint(string.format("\#P%s\#W有跑商任务无法使用", player:GetName()))
			return
		end
		if mapId == 252 then
		  ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", player:GetName()))
		  return
		end
	if party then --组队
		for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
			if member:GetLevel() < 10 then
				ShowHint(string.format("\#P%s\#W等级小于10级无法使用", member:GetName()))
				return
			end
			if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) then
				ShowHint(string.format("\#P%s\#W有跑镖任务无法使用", member:GetName()))
				return
			end
			if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
				ShowHint(string.format("\#P%s\#W有跑商任务无法使用", member:GetName()))
				return
			end
			local mapId = member:GetMap_id();
	  	if mapId == 252 then
		    ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", member:GetName()))
		    return
		  end
	  end
	end
	local tx = player:GetCurPosX()
	local ty = player:GetCurPosY()
	local map = player:GetMap_id()
  ItemAsk(string.format("需要前往#P%s#W(#G%d#W，#G%d#W)吗？", GetMapName(item:GetItemValue1()), item:GetItemValue2(), item:GetItemValue3()))
	if item:GetItemValue1() ~= 0 then 
	  SetAnswer(2,"传送")
	  SetAnswer(3,"离开")
	  WaitAnswer(3) 
	else
	  if (map ~= 7 and map ~= 34 and map ~= 108 and map ~= 84 and map ~= 1 and map ~= 252 and map ~= 14) then
	    ShowHint("不是随便一个地方都可以记录位置的~#46")		
	    return
	  end
		item:SetItemValue1(map)
		item:SetItemValue2(tx)
		item:SetItemValue3(ty)
		item:AddBuff(65534, 0, 0, 0, 0, 100)
		ShowHint("当前坐标已记录")
	end
  if GetAnswer() == 2 then
    if not item:ReduceCount() then
      return 
    end
    JumpMap(player, item:GetItemValue1(), item:GetItemValue2(), item:GetItemValue3())
  end
end
	
	
	

AddItemTable(Item30003)