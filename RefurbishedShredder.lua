local RShredder = {};

function RShredder.OnSpawn(event, creature)
	creature:CastSpell(creature, 17683, true)
end

function RShredder.OnDied(event, creature)
	creature:RemoveCorpse()
    creature:RemoveEvents()
end

RegisterCreatureEvent(400044, 4, RShredder.OnDied)
RegisterCreatureEvent(400044, 5, RShredder.OnSpawn)
