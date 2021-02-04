/******************************************************************
 * 
 * 
 * 
 * 
 ******************************************************************/

#include <math.h>

/******************************************************************
 * Configuración de la Red
 ******************************************************************/

const int NeuronasOculta = 10;
const int NeuronasEntrada = 4;
const int NeuronasSalida = 1;

float Samples=0;
float randNumber;

float Y_K_1=0;
float Y_K_2=0;
float U_K_1=0;
float U_K_2=0;

// Estos valores son necesarios para la normalización de los datos cuando entran y salen de la red
// Rango de normalización
const float YMin = -1;
const float YMax = 1;

// Valores para normalizar la entrada de la red
const float X1Min = 0.0214;
const float X1Max = 0.8237;
const float X2Min = 0;
const float X2Max = 0.8237;
const float X3Min = 0.0385;
const float X3Max = 4.6735;
const float X4Min = 0.0385;
const float X4Max = 4.6735;


// Valores para normalizar la salida de la red
const float DMin =0.0420;
const float DMax =0.8237;

    
   
// Los pesos de la red fueron obtenidos en Matlab y se copiaron a este programa
// Pesos capa oculta
const float PesosOculta[NeuronasOculta][NeuronasEntrada+1]= {
   {1.6776,    1.9915,   -1.0726,   -0.3089,   -2.0028},
   {1.8318,    1.4235,   -0.2156,   -1.0313,   -1.7444},
   {-0.5942,    0.2197,    0.0166,   -0.0113,    0.6514},
   {1.0805,    1.6720,    1.4575,    0.5680,   -0.6992},
   {-1.2542,    0.8886,   -1.1361,   -1.8020,    0.2263},
   {0.7234,   -1.8905,    0.7305,    1.0795,   -0.1719},
   {1.7204,    1.0235,   -0.0396,   -1.5390,    0.7127},
   {-0.6526,    0.2587,   -0.0748,    0.0451,   -0.7223},
   {-0.4911,    2.1223,   -1.0111,   -0.8154,   -1.8902},
   {-0.8972,   -1.7307,    0.7894,    1.1016,   -2.7229}
   };



// Pesos capa de salida
const float PesosSalida[NeuronasSalida][NeuronasOculta+1] = {
{  -0.0074  ,  0.0089 ,  -2.0838 ,   0.0002   , 0.0001, 0.0002   , 0.0024,   -1.8651  , -0.0001 ,  -0.0048 ,0.0424
}
};  
   
int i, j, p, q, r;
float Neta;
float CapaOculta[NeuronasOculta];
float CapaSalida[NeuronasSalida];
float CapaEntrada[NeuronasEntrada];
 
 

void setup(){
  //start serial connection
  Serial.begin(9600);
  randomSeed(analogRead(0));

}

void loop(){
  
  float Entrada;
  float Salida;
  float Tiempo;

Samples=Samples+1;

if (Samples==1)
{
  randNumber = random(500);
  //randNumber = 200;
  Samples=Samples+1;
}

if (Samples>60)
{
  Samples=0;
}

Entrada=4.7;

// Normalización de las entradas que se usará en la red neuronal
CapaEntrada[0]=YMin+ ((Y_K_1-X1Min)*((YMax-YMin)/(X1Max-X1Min)));
CapaEntrada[1]=YMin+ ((Y_K_2-X2Min)*((YMax-YMin)/(X2Max-X2Min)));
CapaEntrada[2]=YMin+ ((U_K_1-X3Min)*((YMax-YMin)/(X3Max-X3Min)));
CapaEntrada[3]=YMin+ ((U_K_2-X4Min)*((YMax-YMin)/(X4Max-X4Min)));

/******************************************************************
* Calculo de la salida de la capa oculta
******************************************************************/

    for( i = 0 ; i < NeuronasOculta ; i++ ) {    
      Neta = PesosOculta[i][NeuronasEntrada] ;
      for( j = 0 ; j < NeuronasEntrada ; j++ ) {
        Neta += PesosOculta[i][j]*CapaEntrada[j];
      }
      CapaOculta[i] = (2.0/(1.0 + exp(-2*Neta)))-1.0; 
    }

/******************************************************************
* Calculo de la salida de la red
******************************************************************/
    for( i = 0 ; i < NeuronasSalida ; i++ ) {    
      Neta = PesosSalida[i][NeuronasOculta] ;
      for( j = 0 ; j < NeuronasOculta ; j++ ) {
        Neta +=  PesosSalida[i][j]*CapaOculta[j];
      }
    CapaSalida[i] = Neta; 
    }


// La salida da la red esta nromalizada, para que quede en el rango original hay que desnormalizar
// Desnormalización de la salida de la red neuronal
Salida=DMin+ ((CapaSalida[0]-YMin)*((DMax-DMin)/(YMax-YMin)));

Y_K_2=Y_K_1;
Y_K_1=Salida;
U_K_2=U_K_1;
U_K_1=Entrada;

Serial.print("Salida: "); 
Serial.print( Salida);      
Serial.print("  Entrada: "); 
Serial.println( Entrada);

delay(50);  
}

