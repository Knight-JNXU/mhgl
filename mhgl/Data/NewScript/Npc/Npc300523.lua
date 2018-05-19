Npc300523 = {							-- 天蚕教
	npc_id = 300523,						-- NPC ID
	name = GetNpcName(300523),				-- NPC 名称
}

function Npc300523:Talk(bProcess)
	NpcAsk({"你就是那个值得让我拔尖的对手吗？",
			"若是武技不够,还是快走吧,别丢人现眼。",
			"我的剑已经很久没有出鞘了~"})
	SetAnswer(1, "我要挑战你")
	SetAnswer(2, "我是路过的")
	WaitAnswer(2)
    if GetAnswer() == 1 then  
    if party then
    local lvmin = player:GetLevel()
    local lvmax = player:GetLevel()
    for i = 0, party:GetCount() - 1 do
      local member = party:GetMember(i)
      if member then
        local lv = member:GetLevel()
        if lv < lvmin then
          lvmin = lv
        elseif lvmax < lv then
          lvmax = lv
        end
        if lvmax - lvmin > 20 then 
          NpcSayParty("队员等级不可超过20级")
          return false
        else
          if member:GetLevel() < 60 then 
            NpcSayParty("此活动过度危险，少侠到了#G60#W级再来吧")
            return false
          end
        end
      end
    end
   end
        if party == nil or party:GetCount() < 0 then 
      NpcSay("请组队挑战...")
      return 
    end  
		if npc and npc:GetEnableBattle() then
			if bProcess then
				player:EncounterBattle(self.npc_id)
				if npc then
					npc:SetEnableBattle(false)
				end
			end
		else
				NpcAskParty("没看我正忙着吗，打架也要排队的！")
				SetAnswer(1,"离开")
				WaitAnswer(1)
			end
		end
  end


AddNpcTable(Npc300523)
