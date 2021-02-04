//Se definen las variables que se usarán en el programa
// Contador de muestras
float Samples=0;
// Estado X1(K+1)
float X_1K_1;
// Estado X2(K+1)
float X_2K_1;
// Estado X1(K)
float X_1K=0;
// Estado X2(K)
float X_2K=0;
float randNumber1;
float randNumber2;

float h=0.02;

float sistemader1(float x1,float x2);
float sistemader2(float x1,float x2);


void setup() {
  // Se inicializa la comunicación serial
  Serial.begin(9600);
  randomSeed(analogRead(0));
}

void loop() {
  //Ciclo principal donde se calcular la actualización del estado del sistema usando las ecuaciones de estado

// Contador de muestras para saber cuando se va a cambiar los estados iniciales al sistema
  Samples=Samples+1;

// Si el contador de muestras es 1 (uno) se modifica la entrada al sistema generando un número randómico
if (Samples==1)
{
  //Se generan número randómico entre 0 y 50 para cambiar las condiciones iniciales
  randNumber1 = random(50);
  randNumber2 = random(50);
  // Se escala el numero randómico para que quede en el rango entre 0 y 5
  X_1K =(randNumber1/10);
  X_2K =(randNumber2/10);
  Samples=Samples+1;
}

// Si el contador de muestras supera un valor se resetea el contador para que se vuelva a generar una nueva condición inicial
if (Samples>1000)
{
  Samples=0;
}



// Solución númerica de las ecuaciones de estado
     
float k_11;
float k_12;
float k_21;
float k_22;
float k_31;
float k_32;
float k_41;
float k_42;
             
    k_11=h*sistemader1(X_1K,X_2K);
    k_12=h*sistemader2(X_1K,X_2K);
    
    k_21=h*sistemader1(X_1K+0.5*k_11,X_2K+0.5*k_12);
    k_22=h*sistemader2(X_1K+0.5*k_11,X_2K+0.5*k_12);
    
    k_31=h*sistemader1((X_1K+0.5*k_21),(X_2K+0.5*k_22));
    k_32=h*sistemader2((X_1K+0.5*k_21),(X_2K+0.5*k_22));
    
    k_41=h*sistemader1((X_1K+k_31),(X_2K+k_32));
    k_42=h*sistemader2((X_1K+k_31),(X_2K+k_32));

    X_1K_1=X_1K + (0.1667)*(k_11+2*k_21+2*k_31+k_41);  
    X_2K_1=X_2K + (0.1667)*(k_12+2*k_22+2*k_32+k_42);  


//Se actualizan el valor de los estados para la siguiente iteración
  X_1K=X_1K_1;
  X_2K=X_2K_1;

//Se manda vía serial la salida del sistema y la entrada
Serial.print("Estado 1: "); 
Serial.print( X_1K_1);  
Serial.print(" Estado 2: "); 
Serial.println( X_2K_1);       

//Retardo o tiempo en el que el ciclo se vuelve a repetir
delay(5);
}

// Funciones que representan las ecuaciones diferenciales del sistema
float sistemader1(float x1,float x2){
float derX1;
derX1=x2;
return derX1;
}

float sistemader2(float x1,float x2){
float derX2;
derX2=-x1+1.0*(1-x1*x1)*x2;
return derX2;
}





