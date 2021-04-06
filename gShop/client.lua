ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local SupermarketMenu = false
local LTDMenu = false
local RobsMenu = false

--- 247 Supermarket

RMenu.Add("grinch", "main", RageUI.CreateMenu("247 Supermarket", "~s~~o~2~r~4~g~7 Supermarket~s~"))
RMenu:Get("grinch", "main").Closed = function()
    SupermarketMenu = false
end

RMenu.Add("grinch", "ltd", RageUI.CreateMenu("LTD Gasoline", "~s~~b~LTD ~r~Gasoline~s~"))
RMenu:Get("grinch", "ltd").Closed = function()
    LTDMenu = false
end

RMenu.Add("grinch", "robs", RageUI.CreateMenu("Robs Liquor", "~s~~y~Robs ~r~Liquor~s~"))
RMenu:Get("grinch", "robs").Closed = function()
    RobsMenu = false
end

--- 247
RMenu.Add("grinch", "eat", RageUI.CreateSubMenu(RMenu:Get("grinch", "main"),"247 Supermarket", "~s~~o~2~r~4~g~7 Supermarket~s~"))
RMenu.Add("grinch", "drink", RageUI.CreateSubMenu(RMenu:Get("grinch", "main"),"247 Supermarket", "~s~~o~2~r~4~g~7 Supermarket~s~"))
RMenu.Add("grinch", "utils", RageUI.CreateSubMenu(RMenu:Get("grinch", "main"),"247 Supermarket", "~s~~o~2~r~4~g~7 Supermarket~s~"))

--- LTD Gasoline
RMenu.Add("grinch", "eat2", RageUI.CreateSubMenu(RMenu:Get("grinch", "ltd"),"LTD Gasoline", "~s~~b~LTD ~r~Gasoline~s~"))
RMenu.Add("grinch", "drink2", RageUI.CreateSubMenu(RMenu:Get("grinch", "ltd"),"LTD Gasoline", "~s~~b~LTD ~r~Gasoline~s~"))
RMenu.Add("grinch", "utils2", RageUI.CreateSubMenu(RMenu:Get("grinch", "ltd"),"LTD Gasoline", "~s~~b~LTD ~r~Gasoline~s~"))

--- Robs Liquor
RMenu.Add("grinch", "eat3", RageUI.CreateSubMenu(RMenu:Get("grinch", "robs"),"Robs Liquor", "~s~~y~Robs ~r~Liquor~s~"))
RMenu.Add("grinch", "drink3", RageUI.CreateSubMenu(RMenu:Get("grinch", "robs"),"Robs Liquor", "~s~~y~Robs ~r~Liquor~s~"))
RMenu.Add("grinch", "utils3", RageUI.CreateSubMenu(RMenu:Get("grinch", "robs"),"Robs Liquor", "~s~~y~Robs ~r~Liquor~s~"))

function openSupermarket()
    if SupermarketMenu then
        SupermarketMenu = false
    else
        SupermarketMenu = true
        RageUI.Visible(RMenu:Get("grinch", "main"), true)
        CreateThread(function()
            while SupermarketMenu do           
                RageUI.IsVisible(RMenu:Get("grinch","main"),true,true,true,function()     
                        RageUI.Separator("↓ Nos Rayons ↓")
                        RageUI.ButtonWithStyle("Nourritures", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","eat"))
                        RageUI.ButtonWithStyle("Boissons", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","drink"))
                        RageUI.ButtonWithStyle("Utils", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","utils"))
                end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","eat"),true,true,true,function()
                    RageUI.Separator("↓ Rayons de nourritures ↓")
                    for k,v in pairs(Config.Eat) do
                        RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                            v.Index = Index
                        if s then
                            TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                        end
                    end)
                end
            end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","drink"),true,true,true,function()
                    RageUI.Separator("↓ Rayons de boissons ↓")
                    for k,v in pairs(Config.Drink) do
                        RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                            v.Index = Index
                        if s then
                            TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                        end
                    end)
                end
            end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","utils"),true,true,true,function()
                    RageUI.Separator("↓ Rayons utils ↓")
                    for k,v in pairs(Config.Utils) do
                            RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                                v.Index = Index
                            if s then
                                TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                            end
                        end)
                    end
                end, function()end, 1)
                Wait(0)
            end
        end)
    end
end

function openLTD()
    if LTDMenu then
        LTDMenu = false
    else
        LTDMenu = true
        RageUI.Visible(RMenu:Get("grinch", "ltd"), true)
        CreateThread(function()
            while LTDMenu do           
                RageUI.IsVisible(RMenu:Get("grinch","ltd"),true,true,true,function()     
                        RageUI.Separator("↓ Nos Rayons ↓")
                        RageUI.ButtonWithStyle("Nourritures", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","eat2"))
                        RageUI.ButtonWithStyle("Boissons", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","drink2"))
                        RageUI.ButtonWithStyle("Utils", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","utils2"))
                end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","eat2"),true,true,true,function()
                    RageUI.Separator("↓ Rayons de nourritures ↓")
                    for k,v in pairs(Config.Eat2) do
                        RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                            v.Index = Index
                        if s then
                            TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                        end
                    end)
                end
            end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","drink2"),true,true,true,function()
                    RageUI.Separator("↓ Rayons de boissons ↓")
                    for k,v in pairs(Config.Drink2) do
                        RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                            v.Index = Index
                        if s then
                            TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                        end
                    end)
                end
            end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","utils2"),true,true,true,function()
                    RageUI.Separator("↓ Rayons utils ↓")
                    for k,v in pairs(Config.Utils2) do
                            RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                                v.Index = Index
                            if s then
                                TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                            end
                        end)
                    end
                end, function()end, 1)
                Wait(0)
            end
        end)
    end
end

function openRobs()
    if RobsMenu then
        RobsMenu = false
    else
        RobsMenu = true
        RageUI.Visible(RMenu:Get("grinch", "robs"), true)
        CreateThread(function()
            while RobsMenu do           
                RageUI.IsVisible(RMenu:Get("grinch","robs"),true,true,true,function()     
                        RageUI.Separator("↓ Nos Rayons ↓")
                        RageUI.ButtonWithStyle("Bières", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","eat3"))
                        RageUI.ButtonWithStyle("Vin", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","drink3"))
                        RageUI.ButtonWithStyle("Liqueur", nil, {RightLabel = "→→"}, true,function(h,a,s)
                        end,RMenu:Get("grinch","utils3"))
                end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","eat3"),true,true,true,function()
                    RageUI.Separator("↓ Rayons Bières ↓")
                    for k,v in pairs(Config.Eat3) do
                        RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                            v.Index = Index
                        if s then
                            TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                        end
                    end)
                end
            end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","drink3"),true,true,true,function()
                    RageUI.Separator("↓ Rayons Vin ↓")
                    for k,v in pairs(Config.Drink3) do
                        RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                            v.Index = Index
                        if s then
                            TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                        end
                    end)
                end
            end, function()end, 1)
                RageUI.IsVisible(RMenu:Get("grinch","utils3"),true,true,true,function()
                    RageUI.Separator("↓ Rayons Liqueur ↓")
                    for k,v in pairs(Config.Utils3) do
                            RageUI.List("~g~"..v.Price*v.Index.."$~s~ → "..v.Label, {1,2,3,4,5,6,7,8,9,10}, v.Index, nil, {}, true, function(_,_,s,Index)
                                v.Index = Index
                            if s then
                                TriggerServerEvent("GrinchBuy", v.Price,v.Item,v.Label,v.Index)
                            end
                        end)
                    end
                end, function()end, 1)
                Wait(0)
            end
        end)
    end
end

CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        for _,v in pairs(Config.PositionSupermarket) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                    RageUI.Text({ message = "Appuyez sur ~b~E~s~ pour parler à l'~g~Épicier", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    if SupermarketMenu == false then
                    openSupermarket()
                    end
                end
            elseif #(pCoords2 - v.pos) < 4.5 then
                activerfps = true
                RageUI.CloseAll()
                SupermarketMenu = false
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500)
        end
    end
end)

CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        for _,v in pairs(Config.PositionLTD) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                    RageUI.Text({ message = "Appuyez sur ~b~E~s~ pour parler au ~r~Vendeur", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    if LTDMenu == false then
                    openLTD()
                    end
                end
            elseif #(pCoords2 - v.pos) < 4.5 then
                activerfps = true
                RageUI.CloseAll()
                LTDMenu = false
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500)
        end
    end
end)

CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        for _,v in pairs(Config.PositionRobs) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                    RageUI.Text({ message = "Appuyez sur ~b~E~s~ pour parler au ~y~Vendeur d'alcool", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    if RobsMenu == false then
                    openRobs()
                    end
                end
            elseif #(pCoords2 - v.pos) < 4.5 then
                activerfps = true
                RageUI.CloseAll()
                RobsMenu = false
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500)
        end
    end
end)

---Create Blips
--- 247
Citizen.CreateThread(function()
	for k,v in pairs(Config.PositionSupermarket) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite (blip, 52)
        SetBlipScale  (blip, 0.6)
        SetBlipColour (blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('247 Supermarket')
        EndTextCommandSetBlipName(blip)
	end
end)
--- LTD Gasoline
Citizen.CreateThread(function()
	for k,v in pairs(Config.PositionLTD) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite (blip, 52)
        SetBlipScale  (blip, 0.6)
        SetBlipColour (blip, 1)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('LTD Gasoline')
        EndTextCommandSetBlipName(blip)
	end
end)
--- Robs Liquor
Citizen.CreateThread(function()
	for k,v in pairs(Config.PositionRobs) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite (blip, 52)
        SetBlipScale  (blip, 0.6)
        SetBlipColour (blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Robs Liquor')
        EndTextCommandSetBlipName(blip)
	end
end)

---Create Ped

CreateThread(function()
    Wait(5)
    for _,peed in pairs(Config.PedCoords) do
        RequestModel(GetHashKey(peed.name))
        while not HasModelLoaded(GetHashKey(peed.name)) do
            Wait(1)
        end
        local createpeds = CreatePed(4, peed.hash, peed[1], peed[2], peed[3]-1, 3374176, false, true)
        SetEntityHeading(createpeds, peed.heading)
        FreezeEntityPosition(createpeds, true)
        SetEntityInvincible(createpeds, true)
        SetBlockingOfNonTemporaryEvents(createpeds, true)
    end
end)