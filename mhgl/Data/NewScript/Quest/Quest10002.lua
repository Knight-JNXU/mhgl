--HULA
Quest10002 = {
	quest_id = 10002,				-- quest ID
	type_id = 1,					-- type ID
	type_name = "主线任务",
	name = "初出江湖",
	descript = "\#A野猪王又出去捣蛋了\#W好像就在附近，赶紧去叫它回来。",
	require = { 
	},
	end_npc = {npc_id=1, map_id=1},
	feature = {"nocancel"},		
}

function Quest10002:Take()
	if not player:GetQuests():HasQuest(10002) then
		NpcSay("你来到这世上的时候就带有一个\#B随身锦囊\#W，这是你生身父母留下给你的，该是时候教你怎么去使用它了。从现在开始，每过\#G5\#W级，你就可以打开锦囊，里面马上会有一些你需要的东西。")
		NpcSay("使用\#PAlt+C\#W可查看角色状态，只要当战斗经验满足要求，点击经验条旁边的“\#P升级\#W”按钮就可以升级了。适才的试炼让你得了不少经验，你尝试着去升级看看效果吧。")
	 
	  NpcSay("你的武功虽有些根基，但这江湖险恶，什么事都会有，什么人都会碰上。你去把\#A野猪王\#W叫来，我嘱咐它与你同行，一路上也好有个照应！快去快回！")
		if IsProcess() then
			self.target_npc = { {npc_id=583, map_id=1} }
			self.descript = "\#A野猪王\#W好像就在附近，赶紧去叫他回来。"
			self.target_partner = { {mob_id=358, count=1} }--后面从新添加一个怪物作为新手宝宝，暂时用新手试练野猪王代替
		end
		if IsProcess() then
			AddQuest(Quest10002)
		end
		return true				
	else
		return false
	end			
end

function Quest10002:Return()
	local pname = player:GetName()
	local q = player:GetQuests():GetQuest(10002) 
	if QuestCompleted(self) then
		NpcSay("动作挺快的吗！奖励你经验值400。")
		ShowError("\#W获得经验值400")
		if IsProcess() then
			player:ChangeExp(400,1)
	--		player:ChangeMoney(20,1)
			player:GetQuests():RemoveQuest(10002)
		end
		return true	

	elseif q and  q:GetTargetPartnerNum(1) == 0 and npc:GetNpc_id() == 583 then
		q:FindTargetNPC(1)
		NpcSay("你这家伙！不来好好练功，整天到处游荡！一到吃饭时间，跑得倒快！")
		ISay("莫要说笑！我已求得宠物仙子让我出岛游历江湖，还说要你与我一同上路，也好有个照应！你不是一直也想出岛去？快跟我走！")
		NpcSay("凭你这点功夫也能出去丢人现眼？岂不笑掉江湖侠士的牙！不如我们比划比划，只要你能逼得我动上一步，我就跟你去见宠物仙子。不然带你出岛，也是个累赘!")	
		if IsProcess() then
			player:EncounterBattle(582)
		end	
		return false
	elseif q and q:GetTargetPartnerNum(1) == 1 and npc:GetNpc_id() == 583 then
		NpcSay("我们这就去见宠物仙子吧。")
		return false	
	else
		NpcSay("快去快回，我还有东西要教你。")
		return false
	end
end

AddQuestTable(Quest10002)
