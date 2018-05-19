-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Preload("Quest23007.lua")


Npc000274 = {							-- 苦瓜大师
	npc_id = 274,						-- NPC ID
	name = GetNpcName(274),				-- NPC 名称
	quests = {Quest23007}				-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc000274:Talk(bProcess)
	local flag417 = player:GetQuests():GetFlag(417)
	local quest23007 = player:GetQuests():GetQuest(23007)
	NpcAsk( "师者，所以传道授业解惑也。习武之人，若得名师指点，必定事半功倍。老夫听闻近来江湖新手倍出，特来此地，为有拜师收徒意愿之人士登记造册。" )
--[[	if (player:GetLevel() >= 15 and flag417 == 0) or  quest23007 then
		SetAnswer(1, "新手引导")
	end--]]
--	SetAnswer(2, "了解师徒系统")
	SetAnswer(3, "出师奖励查询")
	SetAnswer(4, "我带徒弟来举行拜师仪式")
	SetAnswer(5, "我带徒弟来举行出师仪式")
	SetAnswer(6, "背叛师门")
	SetAnswer(7, "将徒弟逐出师门")
	SetAnswer(8, "我想寻觅良师")
	SetAnswer(9, "离开")
	WaitAnswer(9)
	if GetAnswer() == 1 then --新手引导
		if player:GetLevel() >= 15 and flag417 == 0 then
			Quest23007:Take()
		else
			Quest23007:Return()
		end
	elseif GetAnswer() == 2 then --了解系统
		NpcSay( "\#P15\#W级≤等级＜\#P45\#W级的新手玩家可以拜等级≥\#P50\#W级的玩家为师，最多可以同时拥有一个师傅。" )
		NpcSay( "等级≥\#P50\#W级的玩家可以收\#P15\#W级≤等级＜\#P45\#W级的新手玩家为徒，师傅最少可以同时收2个徒弟，等级每提升20级，将增加一个收徒名额。" )
		NpcSay( "师徒关系存续期间，师傅或徒弟可以单方面到\#P京城皇宫\#W内找\#A苦瓜大师\#W处解除师徒关系。单方面解除师徒关系将不会得到任何奖励，同时会受到扣除江湖威望（徒弟扣除\#P1000\#W威望，师傅扣除\#P2000\#W威望），及\#P24\#W小时内不允许再收徒/拜师的惩罚。"  )
		NpcSay( "徒弟拜师时等级越低，出师时师傅和徒弟获得的经验奖励越高。当徒弟等级≥\#P45\#W级且有\#P4\#W个门派技能等级≥\#P50\#W级，师徒之间的好友度≥\#P300\#W时，师徒可以组队到\#P京城皇宫\#W内找\#A苦瓜大师\#W办理出师手续。出师时，师徒都将获得特殊称号奖励。" )
	
	elseif GetAnswer() == 3 then --查询奖励
		NpcAsk("根据徒弟拜师时的等级，及出师时师徒之间的好友度不同，出师时获得的奖励也是不同的。")
		SetAnswer(1, "出师奖励经验表（友好度≥300）")
		SetAnswer(2, "出师奖励经验表（友好度<300）")
		SetAnswer(3, "离开")
		WaitAnswer(3)
		
		if GetAnswer() == 1 then
			NpcSay( "当师徒之间的好友度≥\#P300\#W时，出师时师徒可获得的经验奖励如下：\\r1、15≤等级＜20的玩家拜师，出师时师傅获得经验奖励\#P3000\#W万，徒弟获得经验奖励\#P1500\#W万。\\r2、20≤等级＜30的玩家拜师，出师时师傅获得经验奖励\#P2000\#W万，徒弟获得经验奖励\#P1000\#W万。\\r3、30≤等级＜40的玩家拜师，出师时师傅获得经验奖励\#P1000\#W万，徒弟获得经验奖励\#P500\#W万。\\r4、40≤等级＜45的玩家拜师，出师时师傅获得经验奖励\#P400\#W万，徒弟获得经验奖励\#P250\#W万。" )
		elseif GetAnswer() == 2 then
			NpcSay( "当师徒之间的好友度<\#P300\#W时，出师时师徒可获得的经验奖励如下：\\r1、15≤等级＜20的玩家拜师，出师时师傅获得经验奖励\#P750\#W万，徒弟获得经验奖励\#P400\#W万。\\r2、20≤等级＜30的玩家拜师，出师时师傅获得经验奖励\#P500\#W万，徒弟获得经验奖励\#P250\#W万。\\r3、30≤等级＜40的玩家拜师，出师时师傅获得经验奖励\#P250\#W万，徒弟获得经验奖励\#P150\#W万。\\r4、40≤等级＜45的玩家拜师，出师时师傅获得经验奖励\#P100\#W万，徒弟获得经验奖励\#P80\#W万。" )
		end
	
	elseif GetAnswer() == 4 then --拜师
		local party = player:GetParty();
		if party == nil or party:GetRealMemNum() ~= 2 then
			NpcSay( { "必须师傅与徒弟两人同来才可以举行拜师仪式。" } )
			return;
		end

		if player:GetChar_id() == party:GetLeader():GetChar_id() then
			local student = party:Get(1);
			if player:GetLevel() < 50 then
				NpcSay("以施主现在的修为，还不足以成为他人的师傅，还是\#P50\#W级以后再来找老夫吧。");
				NpcSayTo(student,"很可惜，对方修为不够，还不能成为你的师傅。")
				return;
			end
			
			if student:GetLevel() < 15 or student:GetLevel() >= 45 then
				NpcSay("\#P15\#W级≤等级＜\#P45\#W级时才能拜师。");
				NpcSayTo(student,"\#P15\#W级≤等级＜\#P45\#W级时才能拜师。")
				return;
			end
			
			for i = 0, party:GetRealMemNum() - 1 do
				local member = party:GetInPartyMember(i)
				if member then
					local brothers = GetMessengers(member:GetChar_id(),5) --获取成员的结拜关系
					if member:GetSibling_id() ~= 0 then
						for a = 0, party:GetRealMemNum() - 1 do
							local brother = party:GetInPartyMember(a)
							if brother and brother:GetChar_id() ~= member:GetChar_id() then
								for a = 1, table.getn(brothers) do
									if brothers[a] == brother:GetChar_id() then
										NpcSayParty("两位少侠既已结拜，又怎能再做师徒呢？万万不可乱了辈分。")
										return 
									end
								end
							end
						end
					end
				end
			end
			
			local relationSystem = player:GetRelationSystem()
			if ( player and player:GetSex() == 0 and relationSystem:GetWifeId() == student:GetChar_id() ) or
				( player and player:GetSex() == 1 and relationSystem:GetHusbandId() == student:GetChar_id() ) then
				NpcSayParty("你们既是夫妻，又怎能再成为师徒？这辈份可不能乱了。")
				return
			end
			
			if not player:GetQuests():TimeMarkOver(720,1440) then
				NpcSay("\#P24\#W小时内不允许再收徒弟。");
				NpcSayTo(student,"很可惜，对方暂时不能收你为徒。")
				return;
			end
			
			if not student:GetQuests():TimeMarkOver(720,1440) then
				NpcSay("很可惜，对方暂时不能拜你为师。");
				NpcSayTo(student,"前脚未落，后脚又提，这么快就想改投其他门下可是不道德的行为。")
				return;
			end
	
			
			local messengers = GetMessengers(player:GetChar_id(),4);-- 参数4代表徒弟
			if table.getn(messengers) >= (2 + math.floor((player:GetLevel() - 50) / 20)) then --判断最大徒弟数
				NpcSay("你的徒弟已经满了，先把他们都教导好再说吧。");
				NpcSayTo(student,"很可惜，对方徒弟已满，不能再收徒弟了")
				return;
			end
			
			messengers = GetMessengers(student:GetChar_id(),3); --参数3代表师傅
			if table.maxn(messengers) > 0 then --判断师父数目，即是否有师傅
				NpcSay("很可惜，对方已经早有师承了");
				NpcSayTo(student,"你不是已经有师傅了吗？")
				return;
			end

			if IsFriend(player:GetChar_id(),student:GetChar_id())== 0 then
				NpcSay("你们还不是好友关系，请先加对方为好友!");
				NpcSayTo(student,"你们还不是好友关系，请先加对方为好友!")
				return;
			end
			
			NpcAskParty("你们是否愿意成为师徒?")
			SetAnswer(1, "是")
			SetAnswer(2, "否")
			WaitAnswer(2,20)
			
			for i = 0, party:GetRealMemNum() -1 do
				local ans = GetAnswer(i)
				if ans == 1 then
					if IsFriend(player:GetChar_id(),student:GetChar_id())== 0 then
						NpcSay("你们还不是好友关系，请先加对方为好友!");
						NpcSayTo(student,"你们还不是好友关系，请先加对方为好友!")
						return;
					end
				elseif ans == 2 then
					NpcSay("能成为师徒也是一种缘分，两位还是想清楚再来吧！");
					NpcSayTo(student,"能成为师徒也是一种缘分，两位还是想清楚再来吧！");
					return;
				end
			end
			
			if IsProcess() then
				script:CreatMasterAndStudent(player:GetChar_id(),student:GetChar_id());--成立师徒关系
				student:AddTitle(355);
				student:GetQuests():SetFlag(720,student:GetLevel())
				local flag_global = GetGlobalNpcFlag(274,0,110)
				if flag_global == 0 then
					player:ShowRumor(string.format("恭喜 %s \#O收了一名好徒弟，成为本服首位名师！",player:GetCharNameLink()),false)
					SetGlobalNpcFlag(274,0,110,1)
				end					
			end			
			NpcSay(string.format("恭喜你收了一个好徒弟%s",student:GetName()));
			NpcSayTo(student,string.format("恭喜你拜%s为师",player:GetName()))
		end
	
	elseif GetAnswer() == 5 then--出师
		local party = player:GetParty();
		if party == nil or party:GetRealMemNum() ~= 2 then
			NpcSay( { "必须师傅与徒弟两人同来才可以举行出师仪式。" } )
			return;
		end

		if player:GetChar_id() == party:GetLeader():GetChar_id() then
			local student = party:Get(1);
			local messengers = GetMessengers(player:GetChar_id(),4);
			local IsStudent = false;
			for i=1,table.getn(messengers) do
				if student:GetChar_id() == tonumber(messengers[i]) then
					IsStudent = true;
					break;
				end
			end
			
			if not IsStudent then
				NpcSay("你又没有徒弟，何来出师一说？");
				NpcSayTo(student,"还是和你的师傅一起来吧。")
				return;
			end
			
			if student:GetLevel() < 100 then
				NpcSay("你的徒弟修为还不够，你须得多多用心教导才是。（队员等级未到\#P45\#W级）");
				NpcSayTo(student,"你的修为还不够，还要多多努力吖。（等级未达到\#P45\#W级）")
				return;
			end
			
			if student:GetSkillCount(3,100) < 4 then
				NpcSay("你的徒弟修为还不够，你须得多多用心教导才是。（队员须有\#P4\#W个门派技能达到\#P50\#W级）");
				NpcSayTo(student,"你的修为还不够，还要多多努力呀。（须有\#P4\#W个门派技能等级未达到\#P50\#W级）")
				return;
			end
			
			--[[if GetFriendly(player:GetChar_id(),student:GetChar_id()) < 500 then
				NpcSay("师徒之间的友好度必须≥\#P500\#W才可以出师。");
				NpcSayTo(student,"师徒之间的友好度必须≥\#P500\#W才可以出师。")
				return;
			end]]--
			
			if  IsProcess() then
				script:SetSaying(true)
				script:DestroyMasterAndStudent(player:GetChar_id(),student:GetChar_id());--成功出师
				script:Rumor(string.format("\#O恭喜 %s \#O的徒弟 %s \#O顺利出师。", player:GetCharNameLink(),student:GetCharNameLink()), false)
				local f = student:GetQuests():GetFlag(720)
				--local Exp = 4500000 - 100000 * f 
				--local Exp1 = ( 4500000 - 100000 * f ) / 2
				if f >= 15 and f < 20 then
					if GetFriendly(player:GetChar_id(),student:GetChar_id()) >= 300 then
						ShowError("\#W获得经验值30000000")
						ShowError("\#W获得经验值15000000",student)
						player:ChangeExp(30000000,274)
						student:ChangeExp(15000000,274)
						student:ChangeGoodnessForScript(1000, 274)
						ShowError("\#W获得善恶值1000",student)
					else
						ShowError("\#W获得经验值7500000")
						ShowError("\#W获得经验值4000000",student)
						player:ChangeExp(7500000,274)
						student:ChangeExp(4000000,274)
						student:ChangeGoodnessForScript(350, 274)
						ShowError("\#W获得善恶值350",student)
					end
				elseif f >= 20 and f < 30 then
					if GetFriendly(player:GetChar_id(),student:GetChar_id()) >= 300 then
						ShowError("\#W获得经验值20000000")
						ShowError("\#W获得经验值10000000",student)
						player:ChangeExp(20000000,274)
						student:ChangeExp(10000000,274)
						student:ChangeGoodnessForScript(750, 274)
						ShowError("\#W获得善恶值750",student)
					else
						ShowError("\#W获得经验值5000000")
						ShowError("\#W获得经验值2500000",student)
						player:ChangeExp(5000000,274)
						student:ChangeExp(2500000,274)
						student:ChangeGoodnessForScript(100, 274)
						ShowError("\#W获得善恶值100",student)
					end
				elseif f >= 30 and f < 40 then
					if GetFriendly(player:GetChar_id(),student:GetChar_id()) >= 300 then
						ShowError("\#W获得经验值10000000")
						ShowError("\#W获得经验值5000000",student)
						player:ChangeExp(10000000,274)
						student:ChangeExp(5000000,274)
						student:ChangeGoodnessForScript(200, 274)
						ShowError("\#W获得善恶值200",student)
					else
						ShowError("\#W获得经验值2500000")
						ShowError("\#W获得经验值1500000",student)
						player:ChangeExp(2500000,274)
						student:ChangeExp(1500000,274)
						student:ChangeGoodnessForScript(100, 274)
						ShowError("\#W获得善恶值100",student)
					end
				elseif f >= 40 and f < 45 then
					if GetFriendly(player:GetChar_id(),student:GetChar_id()) >= 300 then
						ShowError("\#W获得经验值4000000")
						ShowError("\#W获得经验值2500000",student)
						player:ChangeExp(4000000,274)
						student:ChangeExp(2500000,274)
						student:ChangeGoodnessForScript(250, 274)
						ShowError("\#W获得善恶值250",student)
					else
						ShowError("\#W获得经验值1000000")
						ShowError("\#W获得经验值800000",student)
						player:ChangeExp(1000000,274)
						student:ChangeExp(800000,274)
						student:ChangeGoodnessForScript(50, 274)
						ShowError("\#W获得善恶值50",student)
					end
				end
				student:RemoveTitle(355)
				student:AddTitle(631)
				student:GetQuests():RemoveFlag(720)
				ShowError("获得称号\#P“名师出高徒”", student)
				player:GetQuests():SetFlag(274,player:GetQuests():GetFlag(274)+1)
				local Flag = player:GetQuests():GetFlag(274)
				if Flag == 1 then
					player:AddTitle(351)
					ShowError("获得一级师傅称号\#P“循循善诱”")
				elseif Flag == 9 then
					player:RemoveTitle(351)
					player:AddTitle(352)
					ShowError("获得二级师傅称号\#P“良师益友”")
				elseif Flag == 21 then
					player:RemoveTitle(352)
					player:AddTitle(353)
					ShowError("获得三级师傅称号\#P“诲人不倦”")
				elseif Flag == 36 then
					player:RemoveTitle(353)
					player:AddTitle(354)
					ShowError("获得四级师傅称号\#P“至圣先师”")
				end
				local flag_global = GetGlobalNpcFlag(274,0,111)
				if flag_global == 0 then
					player:ShowRumor(string.format("恭喜 %s \#O的徒弟 %s \#O顺利出师，成为本服首对名师高徒！",player:GetCharNameLink(),student:GetCharNameLink()),false)
					SetGlobalNpcFlag(274,0,111,1)
				end				
			end
		end
	
	elseif GetAnswer() == 6 then --背叛师门
		local masterIds = GetMessengers(player:GetChar_id(),3);
		if table.getn(masterIds) == 0 then
			NpcSay("施主并无师傅，何来背叛师门一说？");
			return;
		end
		
		local masterNames = GetMessengersName(player:GetChar_id(),3)
		NpcAsk("背叛师门将会受一定惩罚，并且24小时内不能再拜师，确定要背弃你的师父吗？")
		SetAnswer(1,"是");
		SetAnswer(2,"否");
		WaitAnswer(2);
		if GetAnswer(i) == 1 then
			if player:GetHonor() < 1000 then
				NpcSay("江湖威望不足");
				return;
			end

			if IsProcess() then
				script:DestroyMasterAndStudent(tonumber(masterIds[1]),player:GetChar_id());
				script:SendPrivateMessage(string.format("你的徒弟%s心一横,离你而去了!", player:GetName()),player:GetChar_id(),tonumber(masterIds[1]),tostring(masterNames[1]),true);
				player:ChangeHonor(-1000);
				player:GetQuests():SetTimeMark(720)
				player:RemoveTitle(355)
			end
			NpcSay("你已成功解除师徒关系。")
		end	
	
	elseif GetAnswer() == 7 then --踢除徒弟
		local studentIds = GetMessengers(player:GetChar_id(),4);
		if table.getn(studentIds) == 0 then
			NpcSay("施主似乎没有徒弟啊。");
			return;
		end
		local studentNames = GetMessengersName(player:GetChar_id(),4);
		
		NpcAsk("请选择你要逐出的徒弟:")
		for i=1,table.getn(studentNames) do
			SetAnswer(i, tostring(studentNames[i]));
		end
		SetAnswer(table.getn(studentNames)+1,"取消");
		WaitAnswer(table.getn(studentNames)+1)
		local ans = GetAnswer(i);
		if ans == table.getn(studentNames)+1 then
			return;
		end
		
		NpcAsk("驱逐徒弟将会受到一定惩罚，并且24小时内不能再收徒弟，确定要将该徒弟逐出师门吗？")
		SetAnswer(1,"是");
		SetAnswer(2,"否");
		WaitAnswer(2);
		if GetAnswer(i) == 1 then
			if player:GetHonor() < 2000 then
				NpcSay("江湖威望不足");
				return;
			end
			if IsProcess() then
				script:DestroyMasterAndStudent(player:GetChar_id(),studentIds[ans]);
				script:SendPrivateMessage(string.format("你的师傅%s心一横,离你而去了!", player:GetName()),player:GetChar_id(),tonumber(studentIds[ans]),tostring(studentNames[ans]),true);
				player:ChangeHonor(-2000);
				player:GetQuests():SetTimeMark(720)
				pStudent = script:FindCharacter(studentIds[ans]);
				if pStudent then
					pStudent:RemoveTitle(355);
				end
			end
			NpcSay("驱逐徒弟成功。")
		end			

	elseif GetAnswer() == 8 then --寻师传闻
		if player:GetLevel() >= 15 and player:GetLevel() < 30 then
			--local flag = player:GetQuests():GetFlag(274)
			if player:HasTitle(355) == true then
				NpcSay("你不是已经有师傅了吗？")
				return
			end

			if player:GetQuests():TimeMarkOver(274,360) then
				if bProcess then
					script:Rumor(string.format(" %s \#O对大家作了一揖：小可初入江湖，资历尚浅，欲寻觅良师一名，但望诸位大侠不吝赐教。如蒙不弃，感恩肺腑。", player:GetCharNameLink()), false)
					player:GetQuests():SetTimeMark(274)
				end
			else
				NpcSay("老夫已经将少侠觅师的意愿传了出去，还请少侠耐心等候。如若\#P6\#W个小时后，少侠仍未觅着良师，不妨再来找老夫。")
			end
		else
			NpcSay("老夫只为\#P15\#W级≤等级＜\#P30\#W级的新手玩家发布觅师意愿，以少侠现在的修为，老夫有心也无力帮忙，少侠请回吧。")
		end
	end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc000274)
