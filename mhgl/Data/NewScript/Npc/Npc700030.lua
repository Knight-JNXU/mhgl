Npc00085 = {
	npc_id = 85,
	name = GetNpcName(85),
	wgSkill = {
		302,
		329,
		307,
		296,		
		333,
		289		
	},
	mgSkill = {
		307,
		308,
		317,
		318,		
		316,		
		312
	},
	-- stype 1:第一排技能 2：第二排技能  req 需要条件 reqActive 是否需要条件
	-- {s_id=5600, s_type=1, s_name="", req={money_req=100000, item_id_req=41403, item_num_req=1, item_name =""}, reqAcitve=true},
	btSkill = {
		
		{s_id=5279, s_type=2, s_name="\228\185\157\232\189\172\231\166\187\233\173\130", req={money_req=10000000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=6238, s_type=2, s_name="\228\184\128\229\137\145\232\165\191\230\157\165", req={money_req=10000000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5227, s_type=2, s_name="\230\176\148\231\150\151\230\156\175", req={money_req=10000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=false},
		{s_id=5278, s_type=2, s_name="\229\164\167\228\190\160\229\174\136\230\138\164", req={money_req=10000000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5279, s_type=2, s_name="\228\185\157\232\189\172\231\166\187\233\173\130", req={money_req=10000000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5280, s_type=2, s_name="\232\129\154\229\141\142\229\140\150\228\188\164", req={money_req=10000000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},		
		{s_id=5601, s_type=1, s_name="\230\138\151\229\176\129\230\138\151\230\175\146", req={money_req=10000000, item_id_req=41404, item_num_req=255, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5602, s_type=1, s_name="\233\171\152\231\186\167\229\185\184\232\191\144\194\183\230\148\185", req={money_req=100000000, item_id_req=41404, item_num_req=666, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5603, s_type=1, s_name="\233\171\152\231\186\167\231\165\158\228\189\145\194\183\230\148\185", req={money_req=100000000, item_id_req=41404, item_num_req=666, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5605, s_type=1, s_name="\230\138\151\229\176\129\230\138\151\230\175\146\230\138\151\233\154\144\232\186\171", req={money_req=100000000, item_id_req=41404, item_num_req=666, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},		
		{s_id=5607, s_type=1, s_name="\233\171\152\232\191\158\233\171\152\229\191\133\229\144\136\228\184\128", req={money_req=100000000, item_id_req=41404, item_num_req=666, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true},
		{s_id=5608, s_type=1, s_name="\233\171\152\232\191\158\233\171\152\231\136\134\229\144\136\228\184\128", req={money_req=100000000, item_id_req=41404, item_num_req=666, item_name ="\233\135\145\233\147\129\231\178\190\232\139\177"}, reqAcitve=true}
		
	}
}

Npc00085.Talk = function(l_1_0, l_1_1)
	--获取出战的同伴
	local p = player:GetCurPartner()
    NpcAsk("#H如果你是本服#RVIP#H玩家，那么我可以为你的同伴免费打上6技能，普通玩家当然也是可以的不过手续费不能少的！收费1000W银两")  
	--SetAnswer(1, "攻宠6强身")
    --SetAnswer(2, "法宠6强身")
    --SetAnswer(2, "免费版法术系")
    --SetAnswer(3, "免费版物理系")
	SetAnswer(4, "VIP物理系")
	SetAnswer(5, "VIP法术系")
    SetAnswer(6, "随机删除一个技能（内丹除外）")
    SetAnswer(7, "全部删除（内丹除外）")
	SetAnswer(8, "删除所有内丹")
    SetAnswer(9, "离开")
    WaitAnswer(10)
    if l_1_1 then
	   script:SetSaying(true)
    if not p then
		NpcSay("把召唤兽出战")
		return
    end
	
	--打五强身
	elseif GetAnswer() == 1 then
    if player:GetMoney() < 30000000 then--银两
       ShowHint("银两不足3000W")
       return 
    end
		local num_1 = 0
		
		for i=4600, 4642 do
			if p:HasSkill(i) then
				num_1 = num_1 + 1
			end
			if num_1 >= 6 then
				NpcSay("#R\228\189\160\229\174\157\229\174\157\229\183\178\231\187\143\230\156\137\55\229\188\186\232\186\171\239\188\140\228\189\160\229\136\171\232\191\153\228\185\136\232\180\170\229\165\189\228\184\141\229\165\189")
				return
			end
		end
		
		for i=4600, 4642 do
			if p:HasSkill(i) then
				p:RemoveSkill(i)
			end
		end
		if not p:HasSkill(4600) then
			p:AddSkill(4600)
		end
		if not p:HasSkill(4601) then
			p:AddSkill(4601)
		end
		if not p:HasSkill(4602) then
			p:AddSkill(4602)
		end
		if not p:HasSkill(4603) then
			p:AddSkill(4603)
		end
		if not p:HasSkill(4604) then
			p:AddSkill(4604)
		end
		if not p:HasSkill(4605) then
			p:AddSkill(4605)
		end		
		player:ChangeMoney(-30000000)
		NpcSay("操作成功")
	--打五强身
	elseif GetAnswer() == 2 then
      script:SetSaying(true)
	  	    if player:GetMoney() < 5000000 then
        NpcSay("有5000000银子吗")
        return 
      end
		if	p:GetNormalSkillCount() == 0 then
		 if p:HasSkill(4510) then
			p:RemoveSkill(4510)
		 end
		 for i, skill_id in ipairs(l_1_0.mgSkill) do
			if not p:HasSkill(skill_id) then
				p:AddSkill(skill_id)
			end
		 end
		 		player:ChangeMoney(-5000000)
		 --script:Rumor(string.format("#OVIP#O\231\148\168\230\136\183#W%s#O\228\189\191\231\148\168\231\137\185\230\157\131\229\176\134\233\153\170\228\188\180\232\135\170\229\183\177\229\164\154\229\185\180\231\154\132\229\144\140\228\188\180\230\137\147\228\186\134\231\187\157\230\151\160\228\187\133\230\156\137\231\154\132\228\184\131\231\165\158\230\138\128\239\188\140\229\164\167\229\174\182\231\156\188\231\186\162\229\152\155\239\188\159\232\181\182\231\180\167\229\138\160\229\133\165\230\136\145\228\187\172\231\154\132\86\73\80\229\144\167\239\188\129！#007", player:GetName()), false)
		 NpcSay("\231\137\169\231\144\134\230\148\187\229\135\187\230\138\128\232\131\189\229\183\178\231\187\143\230\137\147\228\184\138\228\186\134")
		else
			NpcSay("\229\144\140\228\188\180\231\172\172\228\184\128\230\142\146\230\156\137\230\138\128\232\131\189")
		end
	--打五强身
	elseif GetAnswer() == 3 then
      script:SetSaying(true)
	  	    if player:GetMoney() < 5000000 then
        NpcSay("有5000000银子吗")
        return 
      end
		if	p:GetNormalSkillCount() == 0 then
		 if p:HasSkill(4510) then
			p:RemoveSkill(4510)
		 end
		 for i, skill_id in ipairs(l_1_0.wgSkill) do
			if not p:HasSkill(skill_id) then
				p:AddSkill(skill_id)
			end
		 end
		 		player:ChangeMoney(-5000000)
		 --script:Rumor(string.format("#OVIP#O\231\148\168\230\136\183#W%s#O\228\189\191\231\148\168\231\137\185\230\157\131\229\176\134\233\153\170\228\188\180\232\135\170\229\183\177\229\164\154\229\185\180\231\154\132\229\144\140\228\188\180\230\137\147\228\186\134\231\187\157\230\151\160\228\187\133\230\156\137\231\154\132\228\184\131\231\165\158\230\138\128\239\188\140\229\164\167\229\174\182\231\156\188\231\186\162\229\152\155\239\188\159\232\181\182\231\180\167\229\138\160\229\133\165\230\136\145\228\187\172\231\154\132\86\73\80\229\144\167\239\188\129！#007", player:GetName()), false)
		 NpcSay("\231\137\169\231\144\134\230\148\187\229\135\187\230\138\128\232\131\189\229\183\178\231\187\143\230\137\147\228\184\138\228\186\134")
		else
			NpcSay("\229\144\140\228\188\180\231\172\172\228\184\128\230\142\146\230\156\137\230\138\128\232\131\189")
		end
	elseif GetAnswer() == 4 then
      script:SetSaying(true)
      if player:GetItems():GetItemCount(51403) < 1 then
        NpcSay("你不是VIP")
        return 
      end
	  	    if player:GetMoney() < 0 then
        NpcSay("\233\147\182\229\173\144\228\184\141\229\164\159\51\48\48\87\228\184\164\239\188\140\229\184\136\229\130\133\228\184\141\230\132\191\230\132\143\229\184\174\228\189\160\239\188\129")
        return 
      end
		if	p:GetNormalSkillCount() == 0 then
		 if p:HasSkill(4510) then
			p:RemoveSkill(4510)
		 end
		 for i, skill_id in ipairs(l_1_0.wgSkill) do
			if not p:HasSkill(skill_id) then
				p:AddSkill(skill_id)
			end
		 end
		 --script:Rumor(string.format("#OVIP#O\231\148\168\230\136\183#W%s#O\228\189\191\231\148\168\231\137\185\230\157\131\229\176\134\233\153\170\228\188\180\232\135\170\229\183\177\229\164\154\229\185\180\231\154\132\229\144\140\228\188\180\230\137\147\228\186\134\231\187\157\230\151\160\228\187\133\230\156\137\231\154\132\228\184\131\231\165\158\230\138\128\239\188\140\229\164\167\229\174\182\231\156\188\231\186\162\229\152\155\239\188\159\232\181\182\231\180\167\229\138\160\229\133\165\230\136\145\228\187\172\231\154\132\86\73\80\229\144\167\239\188\129！#007", player:GetName()), false)
		 NpcSay("\231\137\169\231\144\134\230\148\187\229\135\187\230\138\128\232\131\189\229\183\178\231\187\143\230\137\147\228\184\138\228\186\134")
		else
			NpcSay("\229\144\140\228\188\180\231\172\172\228\184\128\230\142\146\230\156\137\230\138\128\232\131\189")
		end
		
	--打7技能魔功宝宝
	elseif GetAnswer() == 5 then
	      script:SetSaying(true)
      if player:GetItems():GetItemCount(51403) < 1  then
        NpcSay("你不是VIP")
        return 
      end
	  	    if player:GetMoney() < 0 then
        NpcSay("\233\147\182\229\173\144\228\184\141\229\164\159\51\48\48\87\228\184\164\239\188\140\229\184\136\229\130\133\228\184\141\230\132\191\230\132\143\229\184\174\228\189\160\239\188\129")
        return 
      end
		if	p:GetNormalSkillCount() == 0 then
			if p:HasSkill(4504) then
				p:RemoveSkill(4504)
			end
			for i, skill_id in ipairs(l_1_0.mgSkill) do
				if not p:HasSkill(skill_id) then
					p:AddSkill(skill_id)
				end
			end
			--script:Rumor(string.format("#OVIP#O\231\148\168\230\136\183#W%s#O\228\189\191\231\148\168\231\137\185\230\157\131\229\176\134\233\153\170\228\188\180\232\135\170\229\183\177\229\164\154\229\185\180\231\154\132\229\144\140\228\188\180\230\137\147\228\186\134\231\187\157\230\151\160\228\187\133\230\156\137\231\154\132\228\184\131\231\165\158\230\138\128\239\188\140\229\164\167\229\174\182\231\156\188\231\186\162\229\152\155\239\188\159\232\181\182\231\180\167\229\138\160\229\133\165\230\136\145\228\187\172\231\154\132\86\73\80\229\144\167\239\188\129！#007", player:GetName()), false)
			NpcSay("\233\173\148\230\179\149\230\148\187\229\135\187\230\138\128\232\131\189\229\183\178\231\187\143\230\137\147\228\184\138\228\186\134")
		else
			NpcSay("\229\144\140\228\188\180\231\172\172\228\184\128\230\142\146\230\156\137\230\138\128\232\131\189")
		end
    elseif GetAnswer() == 6 then
		
		if p:GetNormalSkillCount() == 0 then
			NpcSay("\229\144\140\228\188\180\231\172\172\228\184\128\230\142\146\229\183\178\231\187\143\230\178\161\230\138\128\232\131\189\228\186\134")	
		else
			p:RemoveSkill(p:GetRandomSkillID(0))
			NpcSay("\230\136\144\229\138\159\229\136\160\233\153\164")			
		end
	--删除全部技能 过滤强身技能
	elseif GetAnswer() == 7 then
    --NpcSay()
		for i=1,501 do
			if p:HasSkill(i) then
				p:RemoveSkill(i)
			end
		end
		for i=4700,5050 do
			if p:HasSkill(i) then
				p:RemoveSkill(i)
			end
		end
		NpcSay("\230\138\128\232\131\189\229\183\178\231\187\143\229\136\160\233\153\164")
	elseif GetAnswer() == 8 then
    --NpcSay()
		for i=4600,4642 do
			if p:HasSkill(i) then
				p:RemoveSkill(i)
			end
		end
		for i=4642,4600 do
			if p:HasSkill(i) then
				p:RemoveSkill(i)
			end
		end
		NpcSay("\229\144\140\228\188\180\229\188\186\232\186\171\229\183\178\229\136\160\233\153\164")
	else
		
	end
	end
eof
=
AddNpcTable(Npc00085)
