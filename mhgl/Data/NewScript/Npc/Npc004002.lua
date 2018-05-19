Npc004000 = {							-- 杵官王
	npc_id = 4000,						-- NPC ID
	name = GetNpcName(4000),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc004000:Talk(bProcess) 
local A = math.random(1,182)
  NpcAsk("天降宝物是否开启 !")
  SetAnswer(1,"开启（需要钥匙）")  
  SetAnswer(2,"没兴趣")
  WaitAnswer(2)
   if GetAnswer() == 1 and bProcess then
   script:SetSaying(true)
   if player:GetItems():GetItemCount(600033) < 1 then
      ShowHint("钥匙钥匙")
      return 
      end
   player:GetItems():RemoveItem(600033, 1)
    if A < 10 then
   player:GetItems():AddItem(404018, 1)
  	ShowError(string.format("#W獲得%s", GetItemName(404018)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404018)), false)
  elseif A < 20 then
   player:GetItems():AddItem(404019, 1)
  	ShowError(string.format("#W獲得%s", GetItemName(404019)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404019)), false)

   elseif A < 30 then
   player:GetItems():AddItem(600017, 1)
  	ShowError(string.format("#W獲得%s", GetItemName(600017)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(600017)), false)

   elseif A < 50 then
   player:GetItems():AddItem(600013, 1)
   ShowError(string.format("#W獲得%s", GetItemName(600011)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(600013)), false)

   elseif A < 65 then
   player:GetItems():AddItem(80066, 1)
   ShowError(string.format("#W獲得%s", GetItemName(80066)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(80066)), false)

   elseif A < 75 then
   player:GetItems():AddItem(600001, 1)
   ShowError(string.format("#W獲得%s", GetItemName(600000)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(600000)), false)

   elseif A < 85 then
   player:GetItems():AddItem(600001, 1)
   ShowError(string.format("#W獲得%s", GetItemName(600001)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(600001)), false)
    elseif A < 126 then
   player:GetItems():AddItem(404011, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404011)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404011)), false)

    elseif A < 137 then
   player:GetItems():AddItem(404012, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404012)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404012)), false)

   elseif A < 148 then
   player:GetItems():AddItem(404013, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404013)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404013)), false)

   elseif A < 159 then
   player:GetItems():AddItem(404014, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404014)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404014)), false)

    elseif A < 160 then
   player:GetItems():AddItem(404015, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404015)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404015)), false)

   elseif A < 176 then
   player:GetItems():AddItem(404016, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404016)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404016)), false)

   elseif A <= 182 then
   player:GetItems():AddItem(404017, 1)
   ShowError(string.format("#W獲得%s", GetItemName(404017)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(404017)), false)
			end
			npc:Destroy()
		end
		end
		
		AddNpcTable(Npc004000)