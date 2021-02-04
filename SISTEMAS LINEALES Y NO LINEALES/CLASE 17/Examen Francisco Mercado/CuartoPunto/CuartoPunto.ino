#include <math.h>

/******************************************************************
 * Configuración de la Red
 ******************************************************************/

const int NeuronasOculta = 10;
const int NeuronasEntrada = 8;
const int NeuronasSalida = 1;

float Samples=0;
float randNumber;

float Y_K_1=0;
float Y_K_2=0;
float Y_K_3=0;
float Y_K_4=0;
float U_K_1=0;
float U_K_2=0;
float U_K_3=0;
float U_K_4=0;

// Rango de normalización
const float YMin = -1;
const float YMax = 1;


// Valores para normalizar la entrada de la red
const float X1Min = 0.0613;
const float X1Max = 1.2006;
const float X2Min = 0.0287;
const float X2Max = 1.2006;
const float X3Min = 0.0080;
const float X3Max = 1.2006;
const float X4Min =      0;
const float X4Max = 1.2006;
const float X5Min = 0.1080;
const float X5Max = 1.0721;
const float X6Min = 0.1080;
const float X6Max = 1.0721;
const float X7Min = 0.1080;
const float X7Max = 1.0721;
const float X8Min = 0.1080;
const float X8Max = 1.0721;


// Valores para normalizar la salida de la red
const float DMin =0.0938;
const float DMax =1.2006;

const float PesosOculta[NeuronasOculta][NeuronasEntrada+1]={
   {  0.5086,  -1.1813 ,   0.1201 ,   0.2402  , -0.3147 ,  -0.7794 ,   0.3601 ,   0.5924  , -1.9001},
   {  0.8977,   1.0207 ,  -0.7150 ,  -0.6989  , -0.1991 ,   0.3551 ,  -0.3439 ,  -0.4400  , -1.5393},
   { -0.8089,   0.9087,    0.7298,   -0.1826 ,  -0.0400,   -0.0126,    0.1734,   0.1512  ,  1.3673},
   {  1.1065,  -0.2665 ,   0.4882 ,  -0.5908  ,  0.1100 ,  -0.1028 ,  -0.0121 ,   -0.0282 ,  -1.3780},
   {  0.5480,  -0.1464 ,   0.4116 ,  -0.3964  ,  0.0844 ,  -0.0755 ,  -0.0014 ,  -0.0193  ,  0.0382},
   { -0.8559,  -0.2051,    0.5827,    0.1708 ,   0.0235,    0.0085,    0.0419,    0.0172 ,  -0.0266},
   { -0.0343,  -0.8821,    0.1962,    0.6455 ,  -0.1078,    0.1507,    0.0417,    0.0382 ,  -0.0858},
   {  0.2086,   1.2025  , -0.2477  , -0.4152   , 0.8126  , -0.2846  , -0.5785  , -0.3592   , 1.1661},
   {  0.7159,   0.2769 ,  -0.0241 ,   0.7215  , -0.1843 ,  -0.0533 ,  -0.3309 ,   0.0844  ,  1.5962},
   {  1.1270,   0.9066 ,  -0.6325 ,  -0.6555  ,  0.2551 ,  -0.1909 ,  -0.0930 ,  -0.1244  ,  1.8778}
};

const float PesosSalida[NeuronasSalida][NeuronasOculta+1] = {
{-0.0063 ,  -0.0210  ,  0.1303   , 0.6511  ,  1.5608  , -0.7308  ,  1.2604  , -0.0150  ,  0.0026  ,  0.6587  , -0.1855}
};

int i, j, p, q, r;
float Neta;
float CapaOculta[NeuronasOculta];
float CapaSalida[NeuronasSalida];
float CapaEntrada[NeuronasEntrada];


void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
 randomSeed(analogRead(0));
}

void loop() {
   float Entrada;
  float Salida;
  float Tiempo;

Samples=Samples+1;

if (Samples==1)
{
  randNumber = random(114);
  //randNumber = 200;
  Samples=Samples+1;
}

if (Samples>60)
{
  Samples=0;
}
//Entrada Variable
Entrada=(randNumber/100);

//Entrada fija
//Entrada=0.8;


// Normalización de las entradas que se usará en la red neuronal
CapaEntrada[0]=YMin+ ((Y_K_1-X1Min)*((YMax-YMin)/(X1Max-X1Min)));
CapaEntrada[1]=YMin+ ((Y_K_2-X2Min)*((YMax-YMin)/(X2Max-X2Min)));
CapaEntrada[2]=YMin+ ((Y_K_3-X3Min)*((YMax-YMin)/(X3Max-X3Min)));
CapaEntrada[3]=YMin+ ((Y_K_4-X4Min)*((YMax-YMin)/(X4Max-X4Min)));
CapaEntrada[4]=YMin+ ((U_K_1-X5Min)*((YMax-YMin)/(X5Max-X5Min)));
CapaEntrada[5]=YMin+ ((U_K_2-X6Min)*((YMax-YMin)/(X6Max-X6Min)));
CapaEntrada[6]=YMin+ ((U_K_3-X7Min)*((YMax-YMin)/(X7Max-X7Min)));
CapaEntrada[7]=YMin+ ((U_K_4-X8Min)*((YMax-YMin)/(X8Max-X8Min)));

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

Y_K_4=Y_K_3;
Y_K_3=Y_K_2;
Y_K_2=Y_K_1;
Y_K_1=Salida;
U_K_4=U_K_3;
U_K_3=U_K_2;
U_K_2=U_K_1;
U_K_1=Entrada;

Serial.print("Salida: "); 
Serial.print( Salida);      
Serial.print("  Entrada: "); 
Serial.println( Entrada);

delay(50);

}
