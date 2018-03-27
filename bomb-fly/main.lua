local mod = RegisterMod("bombfly", 1)
local creepdip = Isaac.GetEntityTypeByName("Bomb Fly")

function mod:NPCUpdateBombFly(bombfly)
    local player = Isaac.GetPlayer(0)
    local entities = Isaac.GetRoomEntities()

    for i = 1, #entities do
        if entities[i]:IsEnemy() then
            if entities[i]:IsVulnerableEnemy() then
                local enemy = entities[i]
                if enemy:HasMortalDamage() and enemy.Type == 18 and enemy.Variant == 1 then
                    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.BOMB_EXPLOSION, 0, enemy.Position, Vector(0,0), enemy)
                    Game():BombExplosionEffects(
                        enemy.Position, 10, 0, player.TearColor,
                        enemy, 1, false, false
                    )
                end
            end
        end
    end
end

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, mod.NPCUpdateBombFly, EntityType.ENTITY_FLY)