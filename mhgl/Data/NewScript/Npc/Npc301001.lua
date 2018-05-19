Npc301001 = {							-- 魔神蚩尤 仙境传说活动
	npc_id = 301001,						-- NPC ID
	name = GetNpcName(301001),				-- NPC 名称
}

function Npc301001:Talk(bProcess)
	NpcAsk({"\#R想我蚩尤统治魔界数万载。没想到玉帝老儿今日要与我兵刃相向，我便与他不死不休！",
			"\#R玉帝那个狗篮子，还想灭我魔界，简直痴心妄想，赶紧让他退位滚犊子，让我当这三界之主！哈哈哈哈，哈哈哈哈....",
			"\#R娘西皮，玉帝那个港斗还敢与老子争高低，浓个小砸碎还想替玉帝出头，西开，西开。"})
	SetAnswer(1, "邪魔外道，人人得而诛之！")
	SetAnswer(2, "我是路过的我去打酱油了")
	WaitAnswer(2)
    if GetAnswer() == 1 then
	    if party == nil or party:GetRealMemNum() < 3  then
			NpcSayParty("（这个任务比较危险，至少需要\#G3\#W人组队挑战。）")
		else
		    if party:GetInPartyMember(0):GetLevel() < 100 then
				NpcSayParty({"小朋友，想和我过招好歹也练到100级再来吧。"
						})
				return false
			end
   			for i = 0, party:GetRealMemNum() - 1 do
			local member = party:GetInPartyMember(i)
				if member then
				    if member:GetLevel() < 100 then
					NpcSayParty({"小朋友，想和我过招好歹也练到100级再来吧。"
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
          if lvmax - lvmin > 55 then --（队员之间等级不能超相差30级）
            NpcSayParty("队员之间等级不能相差55级")
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

AddNpcTable(Npc301001)
