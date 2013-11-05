#import "Utility.h"

@implementation Utility

// Gives you a random color
+(UIColor *)randomColor{
    
    float red = [self randomNumberBetweenZeroAnd:100] * 0.01;
    float green = [self randomNumberBetweenZeroAnd:100] * 0.01;
    float blue = [self randomNumberBetweenZeroAnd:100] * 0.01;
    float alpha = [self randomNumberBetweenZeroAnd:100] * 0.01;
    
    UIColor * tempColor =  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return tempColor;
}

// Gives you a number from 0 to maxnumber and returns an int
+(int)randomNumberBetweenZeroAnd:(int)maxNumber{
    
    int randomNum = arc4random() % maxNumber;
    return randomNum;
}


@end
