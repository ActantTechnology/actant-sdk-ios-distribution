//
//  ARNativeTools.h
//  ARData
//
//  Created by Vladimir Knyazev on 27.01.2020.
//  Copyright © 2020 Георгий. All rights reserved.
//

@import Compression;

#import <Foundation/Foundation.h>
#import <ARKit/ARKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARNativeTools : NSObject

+(NSString *) getOpenCVVersion;

+(NSData *) resizePixelBuffer
    :(int) yPlaneWidth
    :(int) yPlaneHeight
    :(NSData *) yPlaneData
    :(float) decreaseImageResolutionInNTimes
    :(bool) compress;
@end

NS_ASSUME_NONNULL_END
