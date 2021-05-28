//
//  CameraFaceResult.h
//  CaptureAcesso
//
//  Created by Matheus Domingos on 10/05/20.
//  Copyright © 2020 Matheus  domingos. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CameraFaceResult : NSObject

@property(strong, nonatomic) NSString *base64;
@property(strong, nonatomic) NSString *processId;

@end

NS_ASSUME_NONNULL_END
