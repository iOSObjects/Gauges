# Gauges
Automotive gauge style iOS custom UI controls

Status: 
* FuelGauge: working with minor issues
* Speedometer: not started yet
* Tachometer: not started yet

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

All code is being done using TDD.


## FuelGauge

![Image of fuel gauge](/assets/FuelGauge180.png)
The FuelGauge is an automotive style fuel gauge.
It is packaged as an iOS 8 framework that you can include in your
own iOS 8 projects as source code.
Alternatively, you can simply copy the source code and assets to your project.
When animationDuration is set to non-zero, the needle movement will be spring animated.

### Properties

* level: (Float 0.0 to 1.0)
* duration: (Float 0 to +infinity) specifies the length of time that it takes to animate needle movements to a new setting. 0.0 results in no animation. 1.0 is a good value and means that the needle takes about 1 second to move from its current to a new position.
* damping: (Float 0 to 1) is the spring damping for the animation. Small values result in lots of bounce. 1.0 results in no bounce.


## Speedometer

![Image of speedometer gauge](/assets/Speedometer180.png)
A speedometer gauge is in the works.

## Tachometer

![Image of tachometer gauge](/assets/Tachometer180.png)
A tachometer gauge is in the works.

## iOS 8 Framework Installation
1. Download code and drag the FuelGaugeKit project from Finder onto the project navigator pane of your project. Note that you may need to restart Xcode after doing this if subsequent steps don't work.
1. Add FuelGaugeKit framework to the target dependencies build phase setting for your app target. Restart Xcode if the FuelGaugeFramework does not appear in the list after clicking '+'
1. Add FuelGaugeKit framework to embedded binaries in app's general build settings.
1. If using a storyboard, drag a UIView onto it. Then in the identity Inspector, change the UIView's class to FuelGaugeView, and module to FuelGaugeKit. (Restart Xcode if these options are not listed).
At this point, the gauge should be visible in the storyboard, and the properties displayed in the attribute inspector when the FuelGaugeView is selected. If not, try restarting Xcode, and make sure that the FuelGaugeKit project isn't open in another window.

