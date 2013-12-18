//
//  CAAnimation+Blocks.m
//  CAAnimationBlocks
//
//  Created by Ralf Bernert on 12/2/13.
//
//

#import <objc/runtime.h>
#import "CAAnimation+Blocks.h"

static char const * const kCompletionBlockKey = "CompletionBlock";

@implementation CAAnimation (Blocks)

- (void (^)(BOOL))completion {
    return objc_getAssociatedObject(self, kCompletionBlockKey);
}

- (void)setCompletion:(void (^)(BOOL))completion {
    objc_setAssociatedObject(self, kCompletionBlockKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = self;
}


#pragma mark - CAAnimation delegate methods

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    void (^completion)(BOOL finished) = [self completion];
    
    if (completion) {
        completion(flag);
    }
}



@end
