
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00064 = {							-- 孙小红
	npc_id = 64,						-- NPC ID
	name = GetNpcName(64),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00064:Talk(bProcess)
  NpcAsk("你是要特赦令牌?我还不容易才得到,除非你拿#P定魂珠、夜光珠、金刚石、避水珠和龙鳞#W这5个宝贝，或者#P四象石各15个#W和我换。你是否已经带齐了？")
  SetAnswer(1,"东西都在这,和你换（五宝）")
  SetAnswer(2,"东西都在这,和你换（四相）")
  SetAnswer(3,"兑换练兽珍经")
  SetAnswer(4,"我才不和你换呢")
  WaitAnswer(4)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(20002) < 1 or player:GetItems():GetItemCount(20003) < 1 or player:GetItems():GetItemCount(20004) < 1 or player:GetItems():GetItemCount(20005) < 1 or player:GetItems():GetItemCount(20006) < 1 then
      NpcSay("凑齐定魂珠,金刚石,夜光珠,避水珠,龙鳞可以换取一个高级藏宝图")
      return
    end
    player:GetItems():RemoveItem(20002, 1)
    player:GetItems():RemoveItem(20003, 1)
    player:GetItems():RemoveItem(20004, 1)
    player:GetItems():RemoveItem(20005, 1)
    player:GetItems():RemoveItem(20006, 1)
    player:GetItems():AddItem(20001, 1)
    ShowHint("高级藏宝图给你了#46")
  elseif GetAnswer() == 2 and bProcess then
    script:SetSaying(true)
    if player:GetItems():GetItemCount(15006) < 15 or player:GetItems():GetItemCount(15007) < 15 or player:GetItems():GetItemCount(15008) < 15 or player:GetItems():GetItemCount(15009) < 15 then
      NpcSay("凑齐青龙石，白虎石，朱雀石，玄武石各10个可以换取一个高级藏宝图")
      return
    end
    player:GetItems():RemoveItem(15006, 15)
    player:GetItems():RemoveItem(15007, 15)
    player:GetItems():RemoveItem(15008, 15)
    player:GetItems():RemoveItem(15009, 15)
    player:GetItems():AddItem(20001, 1)
    ShowHint("高级藏宝图给你了#46")
  end
end		
    
    




-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00064)
