//Se definen las variables que se usarán en el programa
// Salida de la planta Y(K)
double Y_K=0;
// Entrada de la planta U(K)
double U_K=0;
// Estado X1(K+1)
double X1_K_1;
// Estado X2(K+1)
double X2_K_1;
// Estado X3(K+1)
double X3_K_1;
// Estado X1(K)
double X1_K=0;
// Estado X2(K)
double X2_K=0;
// Estado X3(K)
double X3_K=0;
//contador
double Contador=1;

void setup() {
  // Se inicializa la comunicación serial
  Serial.begin(9600);
  
}

void loop() {

//primera iteracion uk=0
//Iteración cuando condiciones iniciales son 0
if(Contador<=2){
  // Ecuaciones de estado 

 U_K=0;

 // Ecuaciones de estado 
 X1_K_1= 2.8383*X1_K - 1.3443*X2_K + 0.8500*X3_K + 0.5*U_K;
 X2_K_1= 2*X1_K;
 X3_K_1= 0.5*X2_K;

 //Ecuacion de salida
 
Y_K= -0.121*X1_K + 0.1151*X2_K - 0.1096*X3_K + 1*U_K ;

//Se actualizan el valor de los estados para la siguiente iteración
  X1_K = X1_K_1;
  X2_K = X2_K_1;
  X3_K = X3_K_1;

  Contador=Contador+1;
}

//Iteracion cuando entrada toma valor de escalon unitario
if(Contador>2){
  U_K=1;
// Ecuaciones de estado 
 X1_K_1= 2.8383*X1_K - 1.3443*X2_K + 0.8500*X3_K + 0.5*U_K;

 X2_K_1= 2*X1_K;
 
 X3_K_1= 0.5*X2_K;

 //Ecuacion de salida
 Y_K= -0.121*X1_K + 0.1151*X2_K - 0.1096*X3_K + 1*U_K ;

//Se actualizan el valor de los estados para la siguiente iteración
  X1_K = X1_K_1;
  X2_K = X2_K_1;
  X3_K = X3_K_1;
  Contador=Contador+1;
}
  
 
//Se manda vía serial la salida del sistema y la entrada
Serial.print("Salida: "); 
Serial.print( Y_K);       
Serial.print(" Entrada: "); 
Serial.println( U_K);
//Retardo tiempo en el que el ciclo se vuelve a repetir
delay(50);
}
