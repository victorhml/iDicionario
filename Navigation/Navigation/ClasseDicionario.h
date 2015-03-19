//
//  ClasseDicionario.h
//  Navigation
//
//  Created by Victor Lisboa on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClasseDicionario : NSObject{
}
@property NSArray* letras;
@property NSArray* imagens;
@property NSArray* palavras;
@property int cont;

+ (ClasseDicionario*)sharedInstance;
@end
