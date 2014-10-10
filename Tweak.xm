#import <objc/runtime.h>

static BOOL enabled;
/*
%hook SBDisplay
-(double)autoLockTime
{
	double timer= %orig;
	NSLog(@"time is %f",timer);
	
	return timer;
}
%end

%hook SBPowerDownController
-(double)autoLockTime
{
	double timer= %orig;
	NSLog(@"time is %f",timer);
	[self autolock];
	return timer;
}
%end*/

%hook SpringBoard
-(void)autoLock
{
	if(enabled == YES)
		nil;
	else
		%orig;
}
%end

%hook SBNowPlayingBar
-(BOOL)_isAirPlayOn
{
	enabled = %orig;
	return enabled;
}
%end

__attribute__((constructor)) static void init()
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    %init;

    [pool release];
}