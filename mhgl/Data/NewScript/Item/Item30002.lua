-- 定义物品表 : 物品表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
-- 飞行符
Item30002 = {
}

function Item30002:MapUse(target)
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
			if member:GetQuests():HasQuest(30601) or member:GetQuests():HasQuest(30602) or member:GetQuests():HasQuest(30603) or player:GetQuests():HasQuest(30604)or player:GetQuests():HasQuest(30605) then
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
  IAsk("请选择要传送的地点")
  SetAnswer(1,"长安城")
  SetAnswer(2,"傲来国")
  SetAnswer(3,"建邺城")
  SetAnswer(4,"朱紫国")
  SetAnswer(5,"长寿村")
  SetAnswer(6,"西凉女儿国")
  SetAnswer(7,"解阳山")
  SetAnswer(8,"取消")
  WaitAnswer(8)
  if GetAnswer() == 1 then
    player:JumpMap(34,222,87)
    player:GetItems():RemoveItem(30002, 1)
  elseif GetAnswer() == 2 then
    player:JumpMap(7,75,141)
    player:GetItems():RemoveItem(30002, 1)
  elseif GetAnswer() == 3 then
    player:JumpMap(1,36,293)
    player:GetItems():RemoveItem(30002, 1)
  elseif GetAnswer() == 4 then
    player:JumpMap(84,89,62)
    player:GetItems():RemoveItem(30002, 1)
  elseif GetAnswer() == 5 then
    player:JumpMap(108,64,376)
    player:GetItems():RemoveItem(30002, 1)
  elseif GetAnswer() == 6 then
    player:JumpMap(263,68,233)
    player:GetItems():RemoveItem(30002, 1)
  elseif GetAnswer() == 7 then
    player:JumpMap(271,4,216)
    player:GetItems():RemoveItem(30002, 1)
  end
end



















function Item30002:CanUse(user, target) 
end

function Item30002:BattleUse(user, target)
end

AddItemTable(Item30002)