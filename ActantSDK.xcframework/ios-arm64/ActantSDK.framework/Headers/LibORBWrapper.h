//
//  ORBextractorWrapper.h
//  Actant
//
//  Created by Sergey Muravev on 20.12.2020.
//  Copyright © 2020 Actant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LibORBWrapper: NSObject

- (instancetype)init
    :(int) maxFeaturePoints
    :(float) scaleFactor
    :(int) nLevels
    :(int) iniThFast
    :(int) minThFast
    :(bool) enableGaussianBlur
;

- (void)dealloc;

- (NSArray *)detectAndCompute
    :(NSData *) yPlaneBufferData
    :(int) yPlaneWidth
    :(int) yPlaneHeight
    :(int) yPlaneBytesPerRow
    :(float) decreaseImageResolutionInNTimes
    :(bool) excludeEmptyKeyPoints
;

@end

NS_ASSUME_NONNULL_END
