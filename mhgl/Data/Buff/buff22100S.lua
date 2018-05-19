--玉剑山庄陷道毒气

function buff22100Repeat(buff, Char, finish)
	if finish == nil or finish == 0 then
		if Char:HasBuff(22106) then
			local msg = "酒能暂时抵御毒烟"
			Char:ShowAwardMsg(msg);
		else
			local mapid = Char:GetMap_id();
			local charhp = Char:GetHP() ;
			local DotDam = Char:GetMaxHP()* 0.2;
			if mapid == 61001 then
				if charhp ~= 0 then
					if charhp > DotDam then
						Char:ChangeHp(-1* DotDam);
					else
						Char:ChangeHp(-1* charhp + 1);
					end	
					--Char:BuffActive()
					local msg = "中毒时间过久，损失气血";
					Char:ShowAwardMsg(msg);
				end
			end	
		end	
	else
		--这里是移除buff的处理
  	end
end
 