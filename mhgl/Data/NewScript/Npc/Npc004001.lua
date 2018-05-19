Npc004000 = {							-- 杵官王
	npc_id = 4000,						-- NPC ID
	name = GetNpcName(4000),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc004000:Talk(bProcess) 
local A = math.random(1,96)
  NpcAsk("天降宝物是否开启 !")
  SetAnswer(1,"开启（需要钥匙）")  
  SetAnswer(2,"没兴趣")
  WaitAnswer(2)
   if GetAnswer() == 1 and bProcess then
   script:SetSaying(true)
   if player:GetItems():GetItemCount(600032) < 1 then
      ShowHint("钥匙钥匙")
      return 
      end
   player:GetItems():RemoveItem(600032, 1)
   if A < 5 then
   player:GetItems():AddItem(600015, 1)
  	ShowError(string.format("#W獲得%s", GetItemName(600015)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(600015)), false)

   elseif A < 10 then
   player:GetItems():AddItem(600012, 1)
   ShowError(string.format("#W獲得%s", GetItemName(600012)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(600012)), false)

   elseif A < 20 then
   player:GetItems():AddItem(80067, 5)
   ShowError(string.format("#W獲得%s", GetItemName(80067)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(80067)), false)

   elseif A < 21 then
   player:GetItems():AddItem(61041, 3)
   ShowError(string.format("#W獲得%s", GetItemName(61041)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(61041)), false)

   elseif A < 40 then
   player:GetItems():AddItem(63060, 5)
   ShowError(string.format("#W獲得%s", GetItemName(63060)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(63060)), false)

	elseif A < 50 then
   player:GetItems():AddItem(402851, 5)
   ShowError(string.format("#W獲得%s", GetItemName(402851)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(402851)), false)

    elseif A < 80 then
   player:GetItems():AddItem(402850, 25)
   ShowError(string.format("#W獲得%s", GetItemName(402850)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(402850)), false)

    elseif A < 90 then
   player:GetItems():AddItem(91239, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91239)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91239)), false)

    elseif A < 91 then
   player:GetItems():AddItem(91232, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91232)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91232)), false)

   elseif A < 92 then
   player:GetItems():AddItem(91225, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91225)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91225)), false)

   elseif A < 93 then
   player:GetItems():AddItem(91218, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91218)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91218)), false)

    elseif A < 94 then
   player:GetItems():AddItem(91211, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91211)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91211)), false)

   elseif A < 95 then
   player:GetItems():AddItem(91204, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91204)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91204)), false)

   elseif A < 96 then
   player:GetItems():AddItem(91197, 1)
   ShowError(string.format("#W獲得%s", GetItemName(91197)))
    script:Rumor(string.format(" %s #O漫不經心地#打开#O，意外地發現裡面有#B%s#O。", player:GetCharNameLink(), GetItemName(91197)), false)
			end
			npc:Destroy()
		end
		end
		
		AddNpcTable(Npc004000)