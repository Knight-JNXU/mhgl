Npc000730 = {							-- 天蚕教
	npc_id = 730,						-- NPC ID
	name = GetNpcName(730),				-- NPC 名称
}

function Npc000730:Talk(bProcess)
	NpcAsk({"小子，看你是个人才，快加入我们天蚕教吧。",
			"天蚕神教，文成武德，千秋万载，一统江湖。",
			"八大门派，雕虫小技，灯蛾之火也敢与日月争辉。"})
	SetAnswer(1, "歪门邪教也敢入侵邪教，找死！")
	SetAnswer(2, "我是路过的")
	WaitAnswer(2)
    if GetAnswer() == 1 then
	    if party == nil or party:GetRealMemNum() < 2  then
			NpcSayParty("（这个任务比较危险，至少需要\#G3\#W人组队挑战。）")
		else
		    if party:GetInPartyMember(0):GetLevel() < 20 then
				NpcSayParty({"小朋友，想和我过招好歹也练到20级再来吧。"
						})
				return false
			end
   			for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
				if member then
				    if member:GetLevel() < 20 then
					NpcSayParty({"小朋友，想和我过招好歹也练到20级再来吧。"
						})
						return false
					end
				end
			end
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
          if lvmax - lvmin > 10 then --（队员之间等级不能超相差10级）
            NpcSayParty("队员之间等级不能相差10级")
            return false
          end
        end
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
end

AddNpcTable(Npc000730)
