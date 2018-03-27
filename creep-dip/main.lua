local mod = RegisterMod("creepdip", 1)
local creepdip = Isaac.GetEntityTypeByName("Creep Dip")

function mod:NPCUpdateCreepDip(creepdip)
    local player = Isaac.GetPlayer(0)
    local entities = Isaac.GetRoomEntities()

    for i = 1, #entities do
        if entities[i]:IsEnemy() then
            if entities[i]:IsVulnerableEnemy() then
                local enemy = entities[i]
                if enemy.Type == 217 and enemy.Variant == 3 then
                    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.CREEP_RED, 0, enemy.Position, Vector(0,0), enemy)
                end
            end
        end
    end
end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.NPCUpdateCreepDip, EntityType.ENTITY_DIP)