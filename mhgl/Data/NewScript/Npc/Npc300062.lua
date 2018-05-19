Preload("Quest50007.lua")
Npc300062 = {							-- 爱吃机器人
	npc_id = 300062,						-- NPC ID
	name = GetNpcName(300062),				-- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300062:Talk(bProcess)
	NpcAsk("准备好开始答题了吗？")
    SetAnswer(1, "开始答题")
	SetAnswer(2, "再等等")
	WaitAnswer(2)
	
	if GetAnswer() == 1 then
	    local Quest = player:GetQuests():GetQuest(50007)
        if Quest == nil	then
		    NpcSay("请去建邺城比找乡试考官开始科举考试。")
		elseif Quest:IsFailed() and player:GetQuests():TimeMarkOver(50007, 300) == false then 
			NpcSay("请去找1号文考官重新答题吧。")
        elseif Quest:GetTargetNpcId(1) ~= self.npc_id then
		    local npc = {
			[300061] = 2,
			[300062] = 3,
			[300063] = 4,
			[300064] = 5,
			[300065] = 6,
			[300066] = 7,
			[300067] = 8,
			[300068] = 9,
			[300069] = 10,
			[300070] = 11,
			[300071] = 12,
			[300072] = 13,
			[300073] = 14,
			[300074] = 15,
			[300075] = 16,
			[300076] = 17,
			[300077] = 18,
			[300078] = 19,
			[300079] = 20
			}
			local num = Quest:GetTargetNpcId(1)
			local i = npc[num]
		    NpcSay(string.format("你应该去找%d号考官继续答题。",i))
		elseif Quest:IsFailed() then 
			NpcSay("请去皇宫魏征除取消任务再次科举吧。")
		else
		    Quest50007:Take()
        end		
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300062)
