TRIG=5 -- pin5/D5 to Trig
ECHO=6 -- pin6/D6 to Echo
time_start = 0
time_end = 0
gpio.mode(TRIG,gpio.OUTPUT)
gpio.mode(ECHO,gpio.INPUT)

gpio.write(TRIG,gpio.LOW)
print("Waiting For Sensor To Settle...")
tmr.delay(2000000)
gpio.write(TRIG,gpio.HIGH)
tmr.delay(10)
gpio.write(TRIG,gpio.LOW)

while gpio.read(ECHO)==0 do
  time_start=tmr.now()
end

while gpio.read(ECHO)==1 do
  time_end=tmr.now()
end

time_duration=time_end-time_start
distance_cm=time_duration/58
distance_inch=time_duration/148

print(distance_cm.." cm")
print(distance_inch.." inch")
