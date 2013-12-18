//
//  CAAnimation+Blocks.h
//  CAAnimationBlocks
//
//  Created by Ralf Bernert on 12/2/13.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (Blocks)

@property (nonatomic, copy) void (^completion)(BOOL finished);

- (void)setCompletion:(void (^)(BOOL finished))completion;

@end
