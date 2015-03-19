//
//  ClasseDicionario.m
//  Navigation
//
//  Created by Victor Lisboa on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ClasseDicionario.h"

@interface ClasseDicionario (){}
@end

@implementation ClasseDicionario

static ClasseDicionario *SINGLETON = nil;
static bool isFirstAccess = YES;

@synthesize letras,imagens,palavras,cont;

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}
- (instancetype)init {
    self = [super init];
    if(self)
    {
        
    if(cont == letras.count){
        cont = 0;
    }
    letras = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    imagens = @[@"abelha.png",@"bola.png",@"cachorro.png",@"dado.png",@"elefante.png",@"flor.png",@"gato.png",@"helicoptero.png",@"indio.png",@"jornal.png",@"kart.png",@"livro.png",@"maca.png",@"nuvem.png",@"oculos.png",@"pato.png",@"queijo.png",@"rato.png",@"sapo.png",@"tomate.png",@"uva.png",@"vaca.png",@"wafer.png",@"xicara.png",@"yakult.png",@"zebra.png"];
    palavras = @[@"Abelha",@"Bola",@"Cachorro",@"Dado",@"Elefante",@"Flor",@"Gato",@"Helicóptero",@"Índio",@"Jornal",@"Kart",@"Livro",@"Maçã",@"Nuvem",@"Óculos",@"Pato",@"Queijo",@"Rato",@"Sapo",@"Tomate",@"Uva",@"Vaca",@"Wafer",@"Xícara",@"Yakult",@"Zebra"];
    }
    return self;
    }
- (void)didReceiveMemoryWarning {
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
