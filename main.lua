local physics = require ("physics")
physics.start()
physics.setGravity(0, 0)

display.setStatusBar(display.HiddenStatusBar)

math.randomseed(os.time())

local spriteOpcao = {
    frames = {
        {
            -- asteroide 1
            x = 0,
            y = 0,
            width = 102,
            height = 85,
        },
        {
            -- asteroide 2
            x = 0,
            y = 85,
            width = 90,
            height = 83,
        },
        {
            -- asteroide 3
            x = 0,
            y = 168,
            width = 100,
            height = 97,
        },
        {
            -- nave
            x = 0,
            y = 265,
            width = 98,
            height = 79,
        },
        {
            -- laser
            x = 98,
            y = 265,
            width = 14,
            height = 40,
        },
    },
}

local sprite = graphics.newImageSheet("./images/sprite.png", spriteOpcao)

local vidas = 3
local pontos = 0
local morte = false

local asteroidesTabela = {}

local bg
local nave
local vidaTexto
local pontosTexto
local jogoLoop

local bgGrupo = display.newGroup()
local grupoJogo = display.newGroup()
local uiGrupo = display.newGroup()

-- jogador
nave = display.newImageRect(grupoJogo, sprite, 4, 98, 79)
nave.x = display.contentCenterX
nave.y = display.contentCenterY + 350

-- fundo de tela
bg = display.newImageRect(bgGrupo, "./images/bg.png", 800, 1400)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

-- interface de usuario
vidaTexto = display.newText(uiGrupo, "Vidas: " .. vidas, display.contentCenterX - 110, 80, native.systemFont, 36)
pontosTexto = display.newText(uiGrupo, "Pontuação: " .. pontos, display.contentCenterX + 110, 80, native.systemFont,36)