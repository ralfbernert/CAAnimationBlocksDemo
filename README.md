# CAAnimationBlocksDemo

Ralf Bernert

Website: http://www.bernertmedia.com  
Twitter: [@ralfbernert](http://twitter.com/ralfbernert)  
E-Mail: ralfbernert@gmx.de   


## What is it?
CAAnimationBlocksDemo is a simple XCode demo project for the `CAAnimation+Blocks` category I wrote - a small category adding a completion block property to `CAAnimation` if you are to lazy to use the `animationDidStop:finished:` delegate methods.

## How does it work?

I think I found a pretty sleek implementation using associative references of the ObjC run-time. For more about associative references I could recommend [this tutorial](http://oleb.net/blog/2011/05/faking-ivars-in-objc-categories-with-associative-references/) by Ole Begemann.

Usage is as simple as you would expect it. Import the category

``` obj-c
#import "CAAnimation+Blocks.h"
```

and then just set the completion property with a block:

``` obj-c
CABasicAnimation *zoomOutAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomOutAnimation.fromValue = @1.2;
    zoomOutAnimation.toValue = @1.0;
    zoomOutAnimation.duration = 1.5f;
    [zoomOutAnimation setCompletion:^(BOOL finished) {
        
        // do whatever you wanna do if the animation finished
        
    }];
```
That's it - pretty easy and straight forward.


## iBeacon Scanner
Please see another iBeacon project, the [iBeaconScanner](https://github.com/ralfbernert/iBeaconScanner) that shows all iBeacons in range ordered by proximity.