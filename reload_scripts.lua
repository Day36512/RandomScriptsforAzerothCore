function reloadElunaEngine(event, player, command)
  if command == "reload scripts" or command == "reloadscripts" then 
	if player == nil or player:IsGM() then -- console or gm
		ReloadEluna()
	else
		player:SendBroadcastMessage("Turn <GM> mode on for access to this command")
	end
  end
end

RegisterPlayerEvent(42, reloadElunaEngine)