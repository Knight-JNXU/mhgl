
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00692 = {							-- 孙小红
	npc_id = 692,						-- NPC ID
	name = GetNpcName(692),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00692:Talk(bProcess) 
  NpcAsk("恭喜发财,本钱庄为客户提供多种服务,可存钱取款,还有类似保险箱的特殊账户,更可以购买定期兑换的银卷。")
  SetAnswer(1,"存钱")
  SetAnswer(2,"取钱")
  SetAnswer(3,"查看保险箱")
  SetAnswer(4,"转换储备金")
  SetAnswer(5,"特殊账户存取")
  SetAnswer(6,"银卷交易业务")
  SetAnswer(7,"特殊账户介绍")
  SetAnswer(8,"临时路过")
  WaitAnswer(8)
  if GetAnswer() == 1 then
		if bProcess then
			script:OpenInterface("bankdeposit",1);
	  end
	elseif GetAnswer() == 2 then
		if bProcess then
			script:OpenInterface("bankwithdraw",1);
	  end
  end
end

 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00692)
