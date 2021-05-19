//
//  ViewController.h
//  Parcial_II
//
//  Created by ISSC411_2021 on 16/05/21.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTableViewDataSource, NSComboBoxDataSource>
{
    NSMutableArray *lista;
    NSMutableArray *grupos;
}

@property (strong) IBOutlet NSTextField *txtNombre;
@property (weak) IBOutlet NSComboBox *cbGrupo;
@property (strong) IBOutlet NSComboBox *cbSemestre;
@property (strong) IBOutlet NSButton *checkAprobado;
@property (strong) IBOutlet NSTableView *lstAlumno;


- (IBAction)agregar:(id)sender;
- (IBAction)eliminar:(id)sender;

@end

