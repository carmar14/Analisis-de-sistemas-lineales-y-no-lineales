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
const int NeuronasEntrada = 2;
const int NeuronasSalida = 1;

float Samples=0;
float randNumber;

float Y_K_1=0;
float U_K_1=0;

// Estos valores son necesarios para la normalización de los datos cuando entran y salen de la red
// Rango de normalización
const float YMin = -1;
const float YMax = 1;

// Valores para normalizar la entrada de la red
const float X1Min = 0;
const float X1Max = 1.1990;
const float X2Min = 0.0385;
const float X2Max = 4.9552;


// Valores para normalizar la salida de la red
const float DMin =0.0328;
const float DMax =1.1850;

    
   
// Los pesos de la red fueron obtenidos en Matlab y se copiaron a este programa
// Pesos capa oculta
const float PesosOculta[NeuronasOculta][NeuronasEntrada+1]= {
    {-4.1447,    1.1442 ,   3.9176},
   {-3.6714 ,  -2.4884 ,   2.5810},
    {0.7905  ,  0.0919  , -0.3261},
    {4.0983  , -0.6157  , -0.1039},
   {-2.1336   , 2.1357  ,  0.5218},
    {1.6121  ,  0.2969  ,  0.5169},
   {-4.1850  ,  0.7398  , -1.6205},
   {-0.6448  , -4.4568  , -1.8291},
   {-1.8483  ,  3.9403  , -3.2094},
    {3.4241  ,  1.6317 ,   4.1212}
   };



// Pesos capa de salida
const float PesosSalida[NeuronasSalida][NeuronasOculta+1] = {
{  0.0133  , -0.0005,    0.9778,    0.0162 ,   0.0068 ,   0.1717 ,  -0.0619 ,  -0.0002,    0.0090  ,  0.1895   , 0.0631
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

Entrada=(randNumber/100);

// Normalización de las entradas que se usará en la red neuronal
CapaEntrada[0]=YMin+ ((Y_K_1-X1Min)*((YMax-YMin)/(X1Max-X1Min)));
CapaEntrada[1]=YMin+ ((U_K_1-X2Min)*((YMax-YMin)/(X2Max-X2Min)));

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

Y_K_1=Salida;
U_K_1=Entrada;

Serial.print("Salida: "); 
Serial.print( Salida);      
Serial.print("  Entrada: "); 
Serial.println( Entrada);

delay(50);  
}

