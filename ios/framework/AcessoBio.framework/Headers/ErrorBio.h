//
//  ErrorBio.h
//  AcessoBio
//
//  Created by Matheus Domingos on 14/05/21.
//  Copyright © 2021 Matheus Domingos Acesso. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ErrorBio : NSObject

@property (assign, nonatomic) NSInteger Code;
@property (strong, nonatomic) NSString *Method;
@property (strong, nonatomic) NSString *Description;

- (id)initCode:(NSInteger)code method:(NSString *)method description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
