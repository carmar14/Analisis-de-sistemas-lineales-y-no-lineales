//Se definen las variables que se usarán en el programa
// Contador de muestras
double Samples = 0;
// Salida de la planta Y(K)
double Y1_K = 0;
double Y2_K = 0;

// Entrada de la planta U(1K)
double U_K1 = 1;
// Entrada de la planta U2(K)
double U_K2 = 1;

//Estados X(k+1)
// Estado X1(K+1)
double X_1K_1;
// Estado X2(K+1)
double X_2K_1;
// Estado X3(K+1)
double X_3K_1;
// Estado X4(K+1)
double X_4K_1;
// Estado X5(K+1)
double X_5K_1;
// Estado X6(K+1)
double X_6K_1;
// Estado X7(K+1)
double X_7K_1;
//Variables de estado X(k)
// Estado X1(K)
double X_1K = 0;
// Estado X2(K)
double X_2K = 0;
// Estado X3(K)
double X_3K = 0;
// Estado X4(K)
double X_4K = 0;
// Estado X5(K)
double X_5K = 0;
// Estado X6(K)
double X_6K = 0;
// Estado X7(K)
double X_7K = 0;

double randNumber;

void setup() {
  // Se inicializa la comunicación serial
  Serial.begin(9600);
}

void loop() {
  //Ciclo principal donde se calcular la actualización del estado del sistema usando las ecuaciones de estado

  // Contador de muestras para saber cuando se va a cambiar la entrada al sistema
  Samples = Samples + 1;

  // Si el contador de muestras es 1 (uno) se modifica la entrada al sistema generando un número randómico
  if (Samples == 1)
  {
    //Se genera un número randómico entre 0 y 50
    randNumber = random(50);
    Samples = Samples + 1;
  }

  // Si el contador de muestras supera un valor se resetea el contador para que se vuelva a generar una nueva entrada
  if (Samples > 360)
  {
    Samples = 0;
  }

  // Se escala el numero randómico para que quede en el rango entre 0 y 5
  U_K1=randNumber;
  U_K2=U_K1;

  // Ecuaciones de estado y de salida del sistema
  X_1K_1 = 0.0362 * U_K1 + 0.9631 * X_1K + 0.0007 * X_2K - 0.0356 * X_3K - 0.0007 * X_4K - 0.0007 * X_5K;
  X_2K_1 = 0.0007 * X_1K + 0.9993 * X_2K + 0.0362 * X_3K + 0.0007 * X_4K + 0.0007 * X_5K;
  X_3K_1 = 0.0007 * U_K1 + 0.0356 * X_1K - 0.0356 * X_2K + 0.9631 * X_3K + 0.0356 * X_4K + 0.0356 * X_5K + 0.0006 * X_7K;
  X_4K_1 = 0.0007 * X_2K + 0.0007 * X_3K + 0.9993 * X_4K + 0.0356 * X_5K + 0.0006 * X_7K;
  X_5K_1 = 0.0006 * U_K2 + 0.0007 * X_1K + 0.0349 * X_2K + 0.0356 * X_3K - 0.0349 * X_4K + 0.9295 * X_5K - 0.0006 * X_6K + 0.0343 * X_7K;
  X_6K_1 = 0.0007 * U_K2 + 0.0006 * X_5K + 0.9993 * X_6K + 0.0356 * X_7K;
  X_7K_1 = 0.0356 * U_K2 + 0.0006 * X_2K + 0.0006 * X_3K - 0.0006 * X_4K + 0.0343 * X_5K - 0.0356 * X_6K + 0.9288 * X_7K;

  Y1_K = X_1K;
  Y2_K = X_6K;

  //Se actualizan el valor de los estados para la siguiente iteración
  X_1K = X_1K_1;
  X_2K = X_2K_1;
  X_3K = X_3K_1;
  X_4K = X_4K_1;
  X_5K = X_5K_1;
  X_6K = X_6K_1;
  X_7K = X_7K_1;

  //Se manda vía serial la salida del sistema y la entrada
  Serial.print("Corriente: ");
  Serial.print(Y2_K);
  Serial.print(" Posicion m3: ");
  Serial.print(Y1_K);
  Serial.print(" Entrada: ");
  Serial.println(U_K1);
  //Retardo o tiempo en el que el ciclo se vuelve a repetir
  delay(37);
}
