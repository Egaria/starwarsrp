hook.Add("PlayerNoClip", "AoDNoClip", function(ply)
   if IsValid(ply) and (ply:CheckGroup("TMod") or ply:CheckGroup("Mod") or ply:CheckGroup("mod") or ply:CheckGroup("CM") or ply:CheckGroup("Head-Staff") or ply:CheckGroup("admin") or ply:CheckGroup("superadmin")) then
       return true
   end
end)