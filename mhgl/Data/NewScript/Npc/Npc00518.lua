
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00518 = {							-- 孙小红
	npc_id = 518,						-- NPC ID
	name = GetNpcName(518),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00518:Talk(bProcess)
   NpcAsk({"做官就是舒服，好过平头百姓奔波操劳。",
          "俺老娘也真是的，好吃好喝伺候着，还总是想东想西！",
          "俗话说“左眼跳财，右眼跳灾”，为什么我最近老是跳右眼呢，肯定是跳错了。",
          "善恶到头终有报，我的报应是也快到了。"
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
AddNpcTable(Npc00518)
