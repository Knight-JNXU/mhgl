Item40030 = {
}
function Item40030:MapUse(target)                --导标旗
    local mapId = player:GetMap_id();
	  if player:GetLevel() < 10 then
		  ShowHint(string.format("\#P%s\#W等级小于10级无法使用", player:GetName()))
			return
		end
		if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604)or player:GetQuests():HasQuest(30605)then
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
  local mapId = player:GetMap_id();
  if mapId == 252 then
	 ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", player:GetName()))
	 return
	end
	if party then --组队
	  for i = 0, party:GetRealMemNum() - 1 do
	    local member = party:GetInPartyMember(i)
			local mapId = member:GetMap_id();
	  	if mapId == 252 then
		    ShowHint(string.format("\#P%s\#W在苦行虚空受刑,不能传送", member:GetName()))
		    return
		  end
		end
  end
  IAsk("请问需要传送去哪里儿?")
  SetAnswer(1,"领双")
  SetAnswer(2,"驿站")
  SetAnswer(3,"商会")
  SetAnswer(4,"酒店")
  SetAnswer(5,"杂货店")
  SetAnswer(8,"擂台")
  SetAnswer(9,"元宝购买")
  SetAnswer(6,"江南野外")
  SetAnswer(7,"大唐国境")
   SetAnswer(10,"戏班") 
  SetAnswer(15,"算了")
  WaitAnswer(15)
  if party then
      for i = 0, party:GetRealMemNum() - 1 do
        local member = party:GetInPartyMember(i)
        if member:GetLevel() < 10 then
          ShowHint(string.format("#P%s#W等级小于10级无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or member:GetQuests():HasQuest(30615) or member:GetQuests():HasQuest(30616) then
          ShowHint(string.format("#P%s#W有跑镖任务无法使用", member:GetName()))
          return 
        end
        if member:GetQuests():HasQuest(80001) or member:GetQuests():HasQuest(80002) or member:GetQuests():HasQuest(80003) or member:GetQuests():HasQuest(80004) then
          ShowHint(string.format("#P%s#W有跑商任务无法使用", member:GetName()))
          return 
        end
        if member:HasBuff(290) then
          ShowHint("当前状态禁止使用该物品")
          return 
        end
      end
    else
      if player:GetLevel() < 10 then
        ShowHint("等级小于10级无法使用")
        return 
      end
      if player:GetQuests():HasQuest(30601) or player:GetQuests():HasQuest(30602) or player:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30615) or player:GetQuests():HasQuest(30616) then
        ShowHint("跑镖状态下不能使用导标旗")
        return 
      end
      if player:GetQuests():HasQuest(80001) or player:GetQuests():HasQuest(80002) or player:GetQuests():HasQuest(80003) or player:GetQuests():HasQuest(80004) then
        ShowHint("跑商状态下不可以使用导标旗。")
        return 
      end
      if player:HasBuff(290) then
        ShowHint("当前状态禁止使用该物品")
        return 
      end
    end
    if not item:ReduceCount() then
      return 
    end
  if GetAnswer() == 1 then
    player:JumpMap(34,119,264)
  elseif GetAnswer() == 2 then
    player:JumpMap(34,173,592)
  elseif GetAnswer() == 3 then
    player:JumpMap(34,203,657)
  elseif GetAnswer() == 4 then
    player:JumpMap(34,283,286)
  elseif GetAnswer() == 5 then
    player:JumpMap(34,329,374)
  elseif GetAnswer() == 6 then
    player:JumpMap(34,331,674)
  elseif GetAnswer() == 7 then
    player:JumpMap(34,4,682)
  elseif GetAnswer() == 8 then
	player:JumpMap(34,270,450)
  elseif GetAnswer() == 9 then
	player:JumpMap(34,29,458)
  elseif GetAnswer() == 10 then
	player:JumpMap(1,51,81)	
  end
end


	

AddItemTable(Item40030)