//
//  ViewController.m/Users/issc411_2021/Desktop/apps/2DO PARCIAL/Parcial_II/Parcial_II/MapViewController.h
//  Parcial_II
//
//  Created by ISSC411_2021 on 16/05/21.
//

#import "ViewController.h"
#import "alumno.h"

@implementation ViewController
-(IBAction)agregar:(id)sender {
    NSAlert *alerta = [[NSAlert alloc]init];
    [alerta addButtonWithTitle:@"Ok"];
    [alerta setAlertStyle:NSAlertStyleWarning];
    //NSModalResponse res;
    
    BOOL x=true;
    if([[_txtNombre stringValue]isEqualToString:@""]){
        x=false;
        [alerta setMessageText:@"Favor de introducir un nombre"];
        [alerta runModal];
    }
    if([[_cbGrupo stringValue]isEqualToString:@""] || [[_cbGrupo stringValue] intValue]==0){
        x=false;
        [alerta setMessageText:@"Favor de introducir el grupo"];
        [alerta runModal];
    }
    if(x){
        alumno *objalumno = [alumno new];
        [objalumno setNombre:[_txtNombre stringValue]];
        [objalumno setGrupo:[[_cbGrupo stringValue]intValue]];
        [objalumno setSemestre:[_cbSemestre stringValue]];
        [objalumno setAprobado:[_checkAprobado state]];
        [lista addObject:objalumno];
        [_lstAlumno reloadData];
        [alerta setMessageText:@"Alumno agregado"];
        [alerta runModal];
    }
    
    [_txtNombre setStringValue:@""];
    [_cbGrupo setStringValue:@""];
    [_cbSemestre setStringValue:@""];
    [_checkAprobado setState:true];
    
}

-(IBAction)eliminar:(id)sender {
    @try {
        
        NSAlert *alerta = [[NSAlert alloc] init];
        
        if(lista.count > 0){
        
            [alerta addButtonWithTitle:@"Aceptar"];
            [alerta addButtonWithTitle:@"Cancelar"];
            [alerta setMessageText:@"ELIMINAR REGISTRO"];
            [alerta setInformativeText:@"¿Deseas eliminar el registro seleccionado?"];
            [alerta setAlertStyle:NSAlertStyleWarning];
            NSModalResponse res = [alerta runModal];
            
            if(res == NSAlertFirstButtonReturn){
                NSInteger row = [_lstAlumno selectedRow];
                [lista removeObjectAtIndex:row];
                [_lstAlumno reloadData];
            }else {
                if(res == NSAlertSecondButtonReturn){
                    NSLog(@"Cancelar");
                }
            }
        }else{
            [alerta addButtonWithTitle:@"Aceptar"];
            [alerta setAlertStyle:NSAlertStyleWarning];
            [alerta setMessageText:@"No hay ningun alumno agregado"];
            [alerta runModal];
        }
    } @catch (NSException *exception) {
        NSLog (@"ocurrio un error");
    } @finally {
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return lista.count;
}
-(nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    alumno *al = [lista objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    NSString *columna = [al valueForKey:identifier];
    return columna;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _cbGrupo.delegate = self; //ignorar advertencia, funciona bien
    
    lista = [[NSMutableArray alloc]init];
    grupos = [[NSMutableArray alloc]initWithObjects:@"211",@"411",@"611",@"811", nil];
    
    [_cbGrupo removeAllItems];
    [_cbSemestre removeAllItems];
    
    [_cbGrupo setPlaceholderString:@"Seleccionar"];
    [_cbSemestre setPlaceholderString:@"Semestre"];
    
    NSArray *semestres = [[NSArray alloc]initWithObjects:@"Primero",@"Cuarto",@"Sexto",@"Octavo", nil];
    
    [_cbGrupo addItemsWithObjectValues:grupos];
    [_cbSemestre addItemsWithObjectValues:semestres];
    
    alumno *al = [[alumno alloc]init];

    [al setNombre:@"prueba"];
    [al setGrupo:411];
    [al setSemestre:@"cuarto"];
    [al setAprobado:true];
    
    [lista addObject:al];
    [_lstAlumno reloadData];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification{
    NSInteger strValue = [_cbGrupo indexOfSelectedItem];
    switch (strValue) {
        case 0:
            [_cbSemestre selectItemAtIndex:0];
            break;
        case 1:
            [_cbSemestre selectItemAtIndex:1];
            break;
        case 2:
            [_cbSemestre selectItemAtIndex:2];
            break;
        case 3:
            [_cbSemestre selectItemAtIndex:3];
            break;
            
        default:
            NSLog(@"error");
            break;
    }
}


@end
