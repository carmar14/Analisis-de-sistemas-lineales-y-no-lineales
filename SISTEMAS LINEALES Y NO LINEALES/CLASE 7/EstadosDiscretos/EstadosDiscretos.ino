//Se definen las variables que se usarán en el programa
// Contador de muestras
float Samples=0;
// Salida de la planta Y(K)
float Y_K=0;
// Entrada de la planta U(K)
float U_K=0;
// Estado X1(K+1)
float X_1K_1;
// Estado X2(K+1)
float X_2K_1;
// Estado X1(K)
float X_1K=0;
// Estado X2(K)
float X_2K=0;

float randNumber;

void setup() {
  // Se inicializa la comunicación serial
  Serial.begin(9600);
}

void loop() {
  //Ciclo principal donde se calcular la actualización del estado del sistema usando las ecuaciones de estado

// Contador de muestras para saber cuando se va a cambiar la entrada al sistema
  Samples=Samples+1;

// Si el contador de muestras es 1 (uno) se modifica la entrada al sistema generando un número randómico
if (Samples==1)
{
  //Se genera un número randómico entre 0 y 50
  randNumber = random(50);
  Samples=Samples+1;
}

// Si el contador de muestras supera un valor se resetea el contador para que se vuelva a generar una nueva entrada
if (Samples>60)
{
  Samples=0;
}

// Se escala el numero randómico para que quede en el rango entre 0 y 5
U_K=(randNumber/10);

// Ecuaciones de estado y de salida del sistema
  X_1K_1=X_2K;
  X_2K_1=-0.8187*X_1K+1.753*X_2K+U_K;
  Y_K=0.02721*X_1K+0.02909*X_2K;

//Se actualizan el valor de los estados para la siguiente iteración
  X_1K=X_1K_1;
  X_2K=X_2K_1;

//Se manda vía serial la salida del sistema y la entrada
Serial.print("Salida: "); 
Serial.print( Y_K);       
Serial.print(" Entrada: "); 
Serial.println( U_K);
//Retardo o tiempo en el que el ciclo se vuelve a repetir
delay(50);
}
