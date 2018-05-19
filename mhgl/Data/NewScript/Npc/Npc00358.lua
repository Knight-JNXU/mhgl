Preload("Quest69207.lua")
Preload("Quest26002.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00358 = {							-- 杵官王
	npc_id = 358,						-- NPC ID
	name = GetNpcName(358),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00358:Talk(bProcess) 
  NpcAsk("为官之道须得德义有闻、清慎明若、公平可称、恪勤匪懈。只有一心为社稷出力才能成为一名合格的官吏。你能成为一名合格的官吏么?(完成每周指派任务可以在下周一00:00以后再李副将出领取俸禄。）")
  SetAnswer(2,"查询官职及贡献")
  SetAnswer(4,"武官进阶方法")
  SetAnswer(5,"查看武官官职积分")
  SetAnswer(6,"查询官职及福利")
  SetAnswer(8,"武官升阶")
  SetAnswer(10,"了解官职所需积分")
   SetAnswer(13,"等级称谓")
 SetAnswer(12,"我只是路过")
  WaitAnswer(12)
if GetAnswer() == 4 then
     NpcSay(string.format("武官需要击杀与本朝对抗的反贼,有付出就会有回报！"))
	 end
if GetAnswer() == 5 then
      NpcSay(string.format("你的武官官职积分为#P%d#W点。望请多加努力，积极进取，剿灭反贼。", player:GetPvPScoreSingle()))
  end
if GetAnswer() == 6 then
    NpcSay(string.format("#W本服武官职奖励如下:#O\\r九品官职·国子太学正:#P银钥匙1把#O\\r八品官职·太常博士:#P3号盒子1个#O\\r七品官职·太子侍读:#P银钥匙3把#O\\r六品官职·奉直大夫:#P银钥匙3把#O\\r五品官职·诸中大夫:#P3号盒子3个#O\\r四品官职·中书舍人:#P金钥匙3把#O\\r三品官职·翰林学士:#P4号宠物盒子1个#O\\r二品官职· 知枢密院事:#P金钥匙10把#O\\r一品官职· 太师:4号宠物盒子1个#O\\r【九五至尊】:#钥匙包1个#O", 300, 1000, 5000, 10000, 20000, 35000, 50000, 80000, 110000, 150000))
end
if GetAnswer() == 8 then
      local P = player:GetPvPScoreSingle()
           if P > 150000 then
             local Q = player:GetQuests():GetFlag(69207)
            if Q == 1 then
            NpcSay("#B小的拜见#P【万民敬仰·九五至尊】#B，万岁万岁万万岁。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P万民敬仰·九五至尊#Y称谓")
               player:AddTitle(879)
               player:RemoveTitle(878)
               player:RemoveTitle(876)
               player:RemoveTitle(877)
               player:RemoveTitle(875)
               player:RemoveTitle(874)
               player:RemoveTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
               player:RemoveTitle(870)	
               player:GetItems():AddItem(402902, 1)			   
               player:GetQuests():SetFlag(69207, Q + 1)
               script:Rumor(string.format("#G%s#O忠心耿耿，不忘国家，皇帝与其结拜为兄弟，赐#B【九五至尊】#O头衔，享一世荣华，并奖励官阶俸禄。", player:GetName()), false)
               else
               
            if P >=110000 then 
            local Q = player:GetQuests():GetFlag(100008)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P骠骑大将军#Y称谓")
               player:AddTitle(878)
               player:RemoveTitle(877)
               player:RemoveTitle(876)
               player:RemoveTitle(875)
               player:RemoveTitle(874)
               player:RemoveTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               player:GetItems():AddItem(600017, 1)
               player:GetQuests():SetFlag(100008, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【骠骑大将军】#O头衔。", player:GetName()), false)
               else
               
            if P >=80000 then 
            local Q = player:GetQuests():GetFlag(100007)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P辅国大将军#Y称谓.")
               player:AddTitle(877)
               player:RemoveTitle(876)
               player:RemoveTitle(875)
               player:RemoveTitle(874)
               player:RemoveTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               player:GetItems():AddItem(600033, 10)
               player:GetQuests():SetFlag(100007, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【辅国大将军】#O头衔。", player:GetName()), false)
               else
               
            if P >=50000 then 
            local Q = player:GetQuests():GetFlag(100006)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P千牛卫大将军#Y称谓,并获得官阶俸禄")
               player:AddTitle(876)
               player:RemoveTitle(875)
               player:RemoveTitle(874)
               player:RemoveTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               local item = RandTable({600017})
               player:GetItems():AddItem(item, 1)
               player:GetQuests():SetFlag(100006, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【千牛卫大将军】#O头衔。", player:GetName()), false)
               else
               
            if P >=35000 then 
            local Q = player:GetQuests():GetFlag(100005)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P忠武将军#Y称谓,并获得官阶俸禄")
               player:AddTitle(875)
               player:RemoveTitle(874)
               player:RemoveTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               local item = RandTable({600033})
               player:GetItems():AddItem(item, 3)
               player:GetQuests():SetFlag(100005, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【忠武将军】#O头衔", player:GetName()), false)
               else
               
            if P >=20000 then
            local Q = player:GetQuests():GetFlag(100004)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P定远将军#Y称谓,并获得官阶俸禄")
               player:AddTitle(874)
               player:RemoveTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               player:GetItems():AddItem(600016, 3)
               player:GetQuests():SetFlag(100004, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【定远将军】#O头衔", player:GetName()), false)
               else
               
            if P >=10000 then
            local Q = player:GetQuests():GetFlag(100003)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P振威校尉#Y称谓,并获得官阶俸禄")
               player:AddTitle(873)
               player:RemoveTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               player:GetItems():AddItem(600032, 3)
               player:GetQuests():SetFlag(100003, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【振威校尉】#O头衔", player:GetName()), false)
               else
               
            if P >=5000 then
            local Q = player:GetQuests():GetFlag(100002)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P致果校尉#Y称谓,并获得官阶俸禄")
               player:AddTitle(872)
               player:RemoveTitle(871)
			   player:RemoveTitle(870)
               player:GetItems():AddItem(600032, 3)
               player:GetQuests():SetFlag(100002, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【致果校尉】#O头衔，并奖励官阶俸禄#R【成长丹1颗】", player:GetName()), false)
               else
               
            if P >=1000 then
            local Q = player:GetQuests():GetFlag(100001)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P致果校尉#Y称谓,并获得官阶俸禄")
               player:AddTitle(871)
			   player:RemoveTitle(870)
               player:GetItems():AddItem(600016, 1)
               player:GetQuests():SetFlag(100001, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【致果校尉】#O头衔", player:GetName()), false)
            else
            
            if P >=300 then
            local Q = player:GetQuests():GetFlag(100000)
            if Q == 1 then
            NpcSay("你的积分不足以升到下一官阶，或已领过此官阶称谓。")
            return
              end
               NpcSay("#Y恭喜你，获得了#P致果校尉#Y称谓,并获得官阶俸禄")
               player:AddTitle(870)
               player:GetItems():AddItem(600032, 1)
               player:GetQuests():SetFlag(100000, Q + 1)
               script:Rumor(string.format("#G%s#O积极响应朝廷号召，在剿灭反贼过程中表现出色。皇帝龙颜大悦，赐#B【致果校尉】#O头衔", player:GetName()), false)
               else
             NpcSay("你的积分不足")
           end
          end
         end
        end
       end
      end
     end
    end
   end
  end
 end
if GetAnswer() == 10 then
    NpcSay(string.format("#W武官职所需积分如下:#O\\r九品官职:#P%d#O\\r八品官职:#P%d#O\\r七品官职:#P%d#O\\r六品官职:#P%d#O\\r五品官职:#P%d\\r#O四品官职:#P%d\\r#O三品官职:#P%d#O\\r二品官职:#P%d#O\\r一品官职:#P%d#O\\r【九五至尊】:#P%d", 300, 1000, 5000, 10000, 20000, 35000, 50000, 80000, 110000, 150000))
	end
if GetAnswer() == 13 then
  SetAnswer(1,"飞升称谓")
  SetAnswer(2,"渡劫称谓")
  SetAnswer(3,"化圣称谓")
  SetAnswer(4,"下仙称谓")
  SetAnswer(5,"上仙称谓") 
  SetAnswer(6,"我只是路过")
  WaitAnswer(6)  
if GetAnswer() == 1 then
  if player:GetLevel() <= 144 then
  NpcSay("#Y等级不足")
  return
  end
   player:AddTitle(727)
	NpcSay("#Y恭喜你，获得了等级称谓.")
	end
if GetAnswer() == 2 then
  if player:GetLevel() <= 155 then
  NpcSay("#Y等级不足")
  return
  end
			   player:AddTitle(728)
			    NpcSay("#Y恭喜你，获得了等级称谓.")
				end
if GetAnswer() == 3 then
  if player:GetLevel() <= 175 then
  NpcSay("#Y等级不足")
  return
  end
			   player:AddTitle(729)
			    NpcSay("#Y恭喜你，获得了等级称谓.")
				end
if GetAnswer() == 4 then
  if player:GetLevel() <= 181 then
  NpcSay("#Y等级不足")
  return
  end
			   player:AddTitle(730)
			    NpcSay("#Y恭喜你，获得了等级称谓.")
				end
if GetAnswer() == 5 then
if player:GetLevel() <= 190 then
  NpcSay("#Y等级不足")
  return
  end
			   player:AddTitle(731)
			    NpcSay("#Y恭喜你，获得了等级称谓.")
				end
end
end  












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00358)
