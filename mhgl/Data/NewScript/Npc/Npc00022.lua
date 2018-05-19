-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00022 = {							-- 孙小红
	npc_id = 22,						-- NPC ID
	name = GetNpcName(22),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00022:Talk(bProcess)
  NpcAsk("我在收购这附近的海产,什么大海龟、巨蛙、海毛虫之类的都收。")
  SetAnswer(1,"我卖只大海龟(250两/只)给你")
  SetAnswer(2,"我卖只巨蛙(350两/只)给你")
  SetAnswer(3,"我卖只海毛虫(500两/只)给你")
  SetAnswer(4,"储备金使用说明")
  SetAnswer(5,"没什么，我只是看看。")
  WaitAnswer(5)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(1) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(250)
      player:GetPartners():RemovePartner(1)
      ShowError("\#W你获得了250两学习储备金#18")
    elseif player:GetPartners():GetPartnerCount(10) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(250)
      player:GetPartners():RemovePartner(10)
      ShowError("\#W你获得了250两学习储备金#18")
    elseif player:GetPartners():GetPartnerCount(8) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(250)
      player:GetPartners():RemovePartner(8)
      ShowError("\#W你获得了250两学习储备金#18")
    else
      NpcSay("你身上并没有我要的召唤兽!")
    end
  elseif GetAnswer() == 2 and bProcess then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(2) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(350)
      player:GetPartners():RemovePartner(2)
      ShowError("\#W你获得了350两学习储备金#18")
    elseif player:GetPartners():GetPartnerCount(11) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(350)
      player:GetPartners():RemovePartner(11)
      ShowError("\#W你获得了350两学习储备金#18")
    elseif player:GetPartners():GetPartnerCount(9) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(350)
      player:GetPartners():RemovePartner(9)
      ShowError("\#W你获得了350两学习储备金#18")
    else
      NpcSay("你身上并没有我要的召唤兽!")
    end 
  elseif GetAnswer() == 3 and bProcess then
    script:SetSaying(true)
    if player:GetPartners():GetPartnerCount(5) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(500)
      player:GetPartners():RemovePartner(5)
      ShowError("\#W你获得了500两学习储备金#18")
    elseif player:GetPartners():GetPartnerCount(16) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(500)
      player:GetPartners():RemovePartner(16)
      ShowError("\#W你获得了500两学习储备金#18")
    elseif player:GetPartners():GetPartnerCount(17) >= 1 then
      NpcSay("很好,很好,谢谢你帮我抓到了这个小动物,这是给你的报酬")
      player:ChangeSMoney(500)
      player:GetPartners():RemovePartner(17)
      ShowError("\#W你获得了500两学习储备金#18")
    else
      NpcSay("你身上并没有我要的召唤兽!")
    end 
  elseif GetAnswer() == 4 then 
    NpcSay("\r帮我找到合适的海产可以获得学习储备金\r当你10级的时候可以加入门派,学习门派技能可以使用储备金。\r储备金不能像现金一样购买商品。\r#Y若玩家身上同时拥有普通、头领、宝宝召唤兽,会最先收购普通,然后收购头领,在收购宝宝。")
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00022)
