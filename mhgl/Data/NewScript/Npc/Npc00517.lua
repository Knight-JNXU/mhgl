
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00517 = {							-- 孙小红
	npc_id = 517,						-- NPC ID
	name = GetNpcName(517),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00517:Talk(bProcess)
   NpcAsk({"告状的话先把状纸准备好了到堂外排队去，别乱闯。",
          "最近大唐国境总有强盗山贼出没，衙门里人手快不够用了。",
          "作奸犯科可是要下大狱的。",
          "虽有石狮把门，安全还得靠人。",
          "公堂禁地，闲杂人等不许乱闯。"
          })

  SetAnswer(1,"离开")
  WaitAnswer(1)
end
--[[ 
  
  
  
   NpcSay({"",
          "",
          "",
          ""})
          
          
          
          
          
          --]]


          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00517)
