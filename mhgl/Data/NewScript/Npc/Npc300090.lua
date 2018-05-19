Preload("Quest69203.lua")
Npc300453 = {							-- 龙舟接引人5
	npc_id = 300453,						-- NPC ID
	name = GetNpcName(300453),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300453:Talk(bProcess)
	if npc then
		NpcAsk("欢迎参加中国梦幻古龙游泳大赛，我是5号接引人。")
		SetAnswer(1,"开始挑战")
		SetAnswer(2,"等等，还没准备好")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			local Day = LuaI.GetRealDay(LuaI.GetServiceTime())
			local Hour = LuaI.GetRealHour(LuaI.GetServiceTime())
	--[[		if not ( Day >= 19 and Day <= 23 ) or not ( ( Hour >= 10 and Hour < 12 ) or ( Hour >= 15 and Hour < 17 ) or ( Hour >= 19 and Hour < 23 ) ) then
				NpcSayParty("对不起，你们所参加轮次的中国梦幻古龙游泳大赛已经结束，各位大侠请回吧。")
				return
			end--]]
			if not party then
				NpcSay("挑战人数不能少于\#G5\#W人。")
				return
			end
			if party:GetRealMemNum() < 5 then
				NpcSayParty("挑战人数不能少于\#G5\#W人。")
				return
			end
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				local q = member:GetQuests():GetQuest(69203)
				if q == nil then
					NpcSayParty(string.format("\#P%s\#W是哪来的观众，混在参赛选手里面捣什么乱？",member:GetName()))
					return
				end
				if q:GetTargetNpcId(1) ~= npc:GetNpc_id() then
					NpcSayParty(string.format("大侠\#P%s\#W别来捣乱了，找你该找的人去吧。",member:GetName()))
					return
				end
				if q:IsFailed() then
					NpcSayParty(string.format("大侠\#P%s\#W，你的中国梦幻古龙游泳大赛时间已经用完。",member:GetName()))
					return
				end
				if member:GetQuests():TimeMarkOver(697, 3) == false then
					NpcSayParty(string.format("大侠\#P%s\#W刚才挑战失败，需要休息一下再来吧。",member:GetName()))
					return
				else
					member:GetQuests():RemoveTimeMark(697)
				end
			end
			
			local Question ={
					{id=1, title="请分辨下“\#G红色\#W”这个词组里，字面意思的颜色是：",                 a1="红色",   a2="绿色",    a3="蓝色",     a4="紫色",r=1},
					{id=2, title="请分辨下“\#O红色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="蓝色",r=2},
					{id=3, title="请分辨下“\#P红色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="橙色",    a3="紫色",     a4="红色",r=4},
					{id=4, title="请分辨下“\#B红色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="蓝色",    a3="红色",     a4="紫色",r=3},
					--{id=5, title="请分辨下“\#R红色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="紫色",r=2},
					--{id=6, title="请分辨下“\#G绿色\#W”这个词组里，字面意思的颜色是：",                 a1="蓝色",   a2="红色",    a3="绿色",     a4="紫色",r=3},
					{id=7, title="请分辨下“\#O绿色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="蓝色",r=1},
					{id=8, title="请分辨下“\#P绿色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="紫色",r=1},
					{id=9, title="请分辨下“\#B绿色\#W”这个词组里，字面意思的颜色是：",                 a1="蓝色",   a2="绿色",    a3="橙色",     a4="紫色",r=2},
					{id=10, title="请分辨下“\#R绿色\#W”这个词组里，字面意思的颜色是：",                 a1="橙色",   a2="红色",    a3="绿色",     a4="紫色",r=3},
					{id=11, title="请分辨下“\#G蓝色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="蓝色",     a4="紫色",r=3},
					{id=12, title="请分辨下“\#O蓝色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="蓝色",r=4},
					{id=13, title="请分辨下“\#P蓝色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="蓝色",    a3="橙色",     a4="紫色",r=2},
					--{id=14, title="请分辨下“\#B蓝色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="蓝色",    a3="橙色",     a4="紫色",r=2},
					{id=15, title="请分辨下“\#R蓝色\#W”这个词组里，字面意思的颜色是：",                 a1="蓝色",   a2="红色",    a3="橙色",     a4="紫色",r=1},
					{id=16, title="请分辨下“\#G橙色\#W”这个词组里，字面意思的颜色是：",                 a1="橙色",   a2="红色",    a3="蓝色",     a4="紫色",r=1},
					--{id=17, title="请分辨下“\#O橙色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="蓝色",r=3},
					{id=18, title="请分辨下“\#P橙色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="紫色",r=3},
					{id=19, title="请分辨下“\#B橙色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="橙色",    a3="蓝色",     a4="紫色",r=2},
					{id=20, title="请分辨下“\#R橙色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="紫色",     a4="橙色",r=4},
					{id=21, title="请分辨下“\#G紫色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="蓝色",     a4="紫色",r=4},
					{id=22, title="请分辨下“\#O紫色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="紫色",     a4="蓝色",r=3},
					--{id=23, title="请分辨下“\#P紫色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="红色",    a3="橙色",     a4="紫色",r=4},
					{id=24, title="请分辨下“\#B紫色\#W”这个词组里，字面意思的颜色是：",                 a1="绿色",   a2="紫色",    a3="橙色",     a4="蓝色",r=2},
					{id=25, title="请分辨下“\#R紫色\#W”这个词组里，字面意思的颜色是：",                 a1="紫色",   a2="红色",    a3="橙色",     a4="绿色",r=1},
					{id=26, title="请分辨下“\#R红\#O白\#W绿\#P蓝\#R紫\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1},
					{id=27, title="请分辨下“\#P蓝\#R红\#W橙\#R绿\#G紫\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1},
					{id=28, title="请分辨下“\#G紫\#R红\#O白\#O绿\#P蓝\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1},
					{id=29, title="请分辨下“\#G橙\#O白\#G绿\#P蓝\#G紫\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1},
					{id=30, title="请分辨下“\#P绿\#R红\#P白\#G橙紫\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1},
					{id=31, title="请分辨下“\#R橙\#O白\#R绿\#O蓝\#R紫\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1},
					{id=32, title="请分辨下“\#G紫\#B红\#G白\#B绿\#G蓝\#W”这个词组里，字面意思表示的颜色一共有：",          a1="5种", a2="4种", a3="3种", a4="2种", r=1}
					} 
			NpcSayParty("欢迎参加游泳大赛，现在开始比赛的第五关，我来考验下大家眼里如何。")
			if not bProcess then return end
			script:SetSaying(true)
			script:SetAsking(true)
			local R = RandTable(Question)
			NpcAskParty(string.format("%s（需要队伍中所有的成员都答对才可过关）",R.title))
			SetAnswer(1, string.format("%s",R.a1))
			SetAnswer(2, string.format("%s",R.a2))
			SetAnswer(3, string.format("%s",R.a3))			
			SetAnswer(4, string.format("%s",R.a4))
			WaitAnswer(1,30)
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				local answer = GetAnswer(i)
				if answer ~= R.r then
					NpcSayParty(string.format("十分抱歉，看来\#P%s\#W看走了眼，闯关失败，请休息\#G3\#W分钟再来闯关。",member:GetName()))
					for i = 0, party:GetRealMemNum() - 1 do
						local member = party:GetInPartyMember(i)
						member:GetQuests():SetTimeMark(697)
					end
					return
				elseif i == party:GetRealMemNum() - 1 then
					NpcSayParty("五位大侠不仅武艺高强，而且也是眼睛犀利，在下佩服。你们可以到下一关挑战了。")
					Quest69203:Take()
				end
			end
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300453)