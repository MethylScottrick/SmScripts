function drawChargeBar()
  state = emu.getState()
  sammov  = emu.read(0x0A1F,emu.memType.workRam)
  if sammov ~= 1 then
    return
  end
  anifrms = emu.readWord(0x0A94,emu.memType.workRam)
  samani = emu.readWord(0x0A96,emu.memType.workRam)
  spdcnt = emu.readWord(0x0B3F,emu.memType.workRam)
  if spdcnt >= 4 then
    emu.drawRectangle(58, 80, 140, 8, 0x3020FF20, true, 1)
    emu.drawRectangle(58, 80, 140, 8, 0x30FFFFFF, false, 1)
  else
  anisleft = (9-samani)
  timeleft = ((anisleft*3)+anifrms)
  pctleft = 1-(timeleft/27)
  if pctleft < 0 then
    pctleft = 0
  elseif pctleft > 1 then
    pctleft = 1
  end
  barfill = 140*pctleft
  emu.drawRectangle(58, 80, barfill, 8, 0x302060FF, true, 1)
  emu.drawRectangle(58, 80, 140, 8, 0x30FFFFFF, false, 1)
  end
end
emu.addEventCallback(drawChargeBar, emu.eventType.startFrame);