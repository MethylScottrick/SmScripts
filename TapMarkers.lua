wasMoving = false
lineOffsets = {40,100,200}
linePos = {}
function drawTapMarkers()
  state = emu.getState()
  samusMoving  = emu.read(0x0A1F,emu.memType.workRam)
  samusPosX = emu.readWord(0x0AF6,emu.memType.workRam)
  samusPosXSub = emu.readWord(0x0AF8,emu.memType.workRam)
  samusPosY = emu.readWord(0x0AFA,emu.memType.workRam)
  samusPosYSub = emu.readWord(0x0AFC,emu.memType.workRam)
  samusSpdX = emu.readWord(0x0B42,emu.memType.workRam)
  samusSpdXSub = emu.readWord(0x0B44,emu.memType.workRam)
  samusSpdY = emu.readWord(0x0B2E,emu.memType.workRam)
  samusSpdYSub = emu.readWord(0x0B2C,emu.memType.workRam)
  samusMomX = emu.readWord(0x0B46,emu.memType.workRam)
  samusMomXSub = emu.readWord(0x0B48,emu.memType.workRam)
  samusAnim = emu.readWord(0x0A96,emu.memType.workRam)
  samusState = emu.readWord(0x0A1C,emu.memType.workRam)
  samusDir = emu.read(0x0A1E,emu.memType.workRam)
  samusMoveType = emu.read(0x0A1F,emu.memType.workRam)
  samusSpeedLevel = emu.readWord(0x0B3F,emu.memType.workRam)
  screenX = emu.readWord(0x0A96,emu.memType.workRam)
  screenY = emu.readWord(0x0A96,emu.memType.workRam)
  framesToAnim = emu.readWord(0x0A94,emu.memType.workRam)
  if samusMoving == 1 then
    if not wasMoving then
      --calc line pos's
      facingMult = {}
      if samusDir == 4 then
        facingMult = -1
      else
        facingMult = 1
      end
      --TODO
    end
    --draw lines
    
    wasMoving = true
  else
    wasMoving = false
  end
end
emu.addEventCallback(drawTapMarkers, emu.eventType.startFrame);