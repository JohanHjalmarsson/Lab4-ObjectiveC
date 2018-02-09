//
//  JHDiagram.m
//  Lab4-JohanHjalmarsson
//
//  Created by Johan Hjalmarsson on 2018-02-08.
//  Copyright © 2018 Johan Hjalmarsson. All rights reserved.
//

#import "JHDiagram.h"
@interface JHDiagram ()

@property (nonatomic) NSArray *array;

@end

@implementation JHDiagram

- (void)drawDiagram:(NSArray*)array {
    self.array = array;
}

- (void)drawRect:(CGRect)rect {
    float high = [self findHighestValue:self.array];
    float maxHeight = rect.size.height;

    for (int i=0;i<self.array.count;i++) {
        float input = [[[self.array objectAtIndex:i] objectForKey:@"value"] floatValue];
        NSString *text = [self getShorterString:[[self.array objectAtIndex:i] objectForKey:@"name"]];
        CGRect staple = CGRectMake(rect.size.width/self.array.count*i,
                                   maxHeight-maxHeight*input/high,
                                   rect.size.width/self.array.count,
                                   maxHeight*input/high);
        UIBezierPath *staplePath = [UIBezierPath bezierPathWithRect:staple];
        [[self getAColor:i] setFill];
        [staplePath fill];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width/self.array.count*i+2, maxHeight-20, rect.size.width/self.array.count, 20)];
        [label setText:[self getShorterString:text]];
        [label setTextColor:[UIColor whiteColor]];
        label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:label];
    }
    
    UIBezierPath *frame = [UIBezierPath bezierPathWithRect:rect];
    [[UIColor blackColor] setStroke];
    [frame stroke];
}

- (float)findHighestValue:(NSArray*)array {
    float highestValue = 0;
    for(int i = 0;i<array.count;i++) {
        if ([[[array objectAtIndex:i] objectForKey:@"value"] floatValue] >= highestValue) {
            highestValue = [[[array objectAtIndex:i] objectForKey:@"value"] floatValue];
        }
    }
    return highestValue;
}

- (UIColor*)getAColor:(int)i {
    UIColor *color;
    color = i%2 ? [UIColor redColor] : [UIColor blueColor];
    return color;
}

- (NSString*)getShorterString:(NSString*)s {
    return [NSString stringWithFormat:@"%c%c%c", [s characterAtIndex:0], [s characterAtIndex:1], [s characterAtIndex:2]];
}

@end
