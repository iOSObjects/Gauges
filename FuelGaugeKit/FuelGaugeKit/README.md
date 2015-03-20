# Gauges
Automotive gauge style iOS custom UI controls

I have been working on creating an iOS application to calculate
the fuel level of my motorcycle. I want to display an indication
of the current fuel level using a control that looks similar to
the analog circular speedometer on my motorcycle. 
I was surprised that I wasn't able to locate
any open source iOS controls to do this. 
So I'm creating one. 
Since the difference is small in how other similar gauges 
would be created, I'm going to create those also 
(speedometer, tachometer, etc).
The fuel gauge will be first, since that is my personal
immediate need. But I'll be quickly following up with additional
gauges as shown below.


## FuelGauge

![Image of fuel gauge](/assets/FuelGauge180.png)
The FuelGauge is an automotive style fuel gauge.
It is packaged as an iOS framework that you can include in your
own projects as source code, or simply add it as a separate package.
It implements spring animations.

### Properties

* fuelLevel: Float (0.0 to 1.0)


## Speedometer

![Image of speedometer gauge](/assets/Speedometer180.png)
A speedometer gauge is in the works.

## Tachometer

![Image of tachometer gauge](/assets/Tachometer180.png)
A tachometer gauge is in the works.
