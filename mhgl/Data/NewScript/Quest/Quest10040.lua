--HULA
Quest10040 = {
	quest_id = 10040,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",			-- 大类名称
	name = "寻找侯医生",
	descript = "\#A法明长老\#W受了一点伤,听说需要\#A定神香\#W做药引子,\#A花果山\#W的\#A侯医生\#W有此药,敢快过去问问看~！",
	tips = "按下\#PAlt+Q\#W打开任务栏，点击任务目标里带下划线的人名“\#A侯医生\#W”就可以自动寻路至\#A侯医生\#W跟前了。",
	require = {
		flag = { {10031, 0} },
	},
	target_npc = { {npc_id=76, map_id=8} },
	end_npc = {npc_id=76, map_id=8},
	feature = {"nocancel"},	
}

function Quest10040:Take()
	if not player:GetQuests():HasQuest(10040) then
		local pname = player:GetName()
		if IsProcess() then
		  ISay("事不宜迟,敢快到花果山找侯医生问问看~！")
			AddQuest(Quest10040)			
		end
		return true
	else
		return false
	end
end

function Quest10040:Return()
	local pname = player:GetName()
	if QuestCompleted(self) then
	  NpcSay("你们是来寻定神香的呀,这药实在是难得~！只能用罕见的仙草#Y餐风饮露#W才能够炼制出来~！")
	  ISay("餐风饮露?我这就去为你找来~！")
		if IsProcess() then
			player:GetQuests():RemoveQuest(10040)
		end
		return true	
	else
		ISay("得赶快找到\#A侯医生\#W。")
		return false
	end
end

AddQuestTable(Quest10040)
