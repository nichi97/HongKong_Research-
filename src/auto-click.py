import pyautogui as m 
import time
import winsound

#       i = 0
#   while i < 10:
#       x1 = 743; y1 = 603
#       m.moveTo(x1, y1)
#       m.click()
#       m.scroll(-3000)
#       m.scroll(-1000)
#       m.vscroll(-1000)
#       time.sleep(0.5)
#       x2 = 2081; y2 = 1372
#       m.moveTo(x2, y2)
#       m.click()
#       time.sleep(4)
#       i += 1

while True:
    m.vscroll(-3000)
    m.vscroll(-1000)
    m.moveTo(1305, 1382)
    m.click()
    time.sleep(2)
# winsound.Beep(1200, 500)

