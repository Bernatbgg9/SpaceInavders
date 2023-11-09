28/10 Añadir classe Boss, Modificar Enemi/Player/Main
06/11 Añadir Movimiento a los Enemigos mas Spawner, Poner fecha delante de cada comentario en el ReadMe
08/11 Añadir los sprites de los Enemigos 
09/11 Empezar la clase player e implementar el HUD (vida y puntos)
09/11 HUD menu pausa exit
9/11 Cambios Bala y Enemy
9/11 Movimiento y disparo del player
9/11 Spanwer y arreglos
        if v:is(Hud) then
            if v.vidas <= 0 then
                for kk, vv in pairs(actorList) do
                    if vv:is(Bala) or vv:is(BalaPlayer) or vv:is(Player) or vv:is(Enemy) then
                        table.remove(actorList, kk)
                    end
                end
            end
        end