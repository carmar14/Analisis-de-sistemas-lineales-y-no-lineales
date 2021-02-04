//Se definen las variables que se usarán en el programa
// Contador de muestras
float Samples=0;
// Estado X1(K+1)
float X_1K_1;
// Estado X2(K+1)
float X_2K_1;
// Estado X3(K+1)
float X_3K_1;
// Estado X1(K)
float X_1K=0.1;
// Estado X2(K)
float X_2K=0.1;
// Estado X3(K)
float X_3K=0.1;
float randNumber1;
float randNumber2;

float h=0.2;  

//Parametros del sistema
float a=10;
float B=14;//31;
float d1=0.1667;
float d3=0.0625;



float sistemader1(float x1,float x2,float x3);
float sistemader2(float x1,float x2,float x3);
float sistemader3(float x1,float x2,float x3);


void setup() {
 ;
  Serial.begin(9600);
  randomSeed(analogRead(0));
}

void loop() {
  // Solución númerica de las ecuaciones de estado
     
float k_11;
float k_12;
float k_13;
float k_21;
float k_22;
float k_23;
float k_31;
float k_32;
float k_33;
float k_41;
float k_42;
float k_43;
             
    k_11=h*sistemader1(X_1K,X_2K,X_3K);
    k_12=h*sistemader2(X_1K,X_2K,X_3K);
    k_13=h*sistemader3(X_1K,X_2K,X_3K);
    
    k_21=h*sistemader1(X_1K+0.5*k_11,X_2K+0.5*k_12,X_3K+0.5*k_13);
    k_22=h*sistemader2(X_1K+0.5*k_11,X_2K+0.5*k_12,X_3K+0.5*k_13);
    k_23=h*sistemader3(X_1K+0.5*k_11,X_2K+0.5*k_12,X_3K+0.5*k_13);
    
    k_31=h*sistemader1((X_1K+0.5*k_21),(X_2K+0.5*k_22),(X_3K+0.5*k_23));
    k_32=h*sistemader2((X_1K+0.5*k_21),(X_2K+0.5*k_22),(X_3K+0.5*k_23));
    k_33=h*sistemader3((X_1K+0.5*k_21),(X_2K+0.5*k_22),(X_3K+0.5*k_23));
    
    k_41=h*sistemader1((X_1K+k_31),(X_2K+k_32),(X_3K+k_33));
    k_42=h*sistemader2((X_1K+k_31),(X_2K+k_32),(X_3K+k_33));
    k_43=h*sistemader2((X_1K+k_31),(X_2K+k_32),(X_3K+k_33));

    X_1K_1=X_1K + (0.1667)*(k_11+2*k_21+2*k_31+k_41);  
    X_2K_1=X_2K + (0.1667)*(k_12+2*k_22+2*k_32+k_42);  
    X_3K_1=X_3K + (0.1667)*(k_13+2*k_23+2*k_33+k_43);


//Se actualizan el valor de los estados para la siguiente iteración
  X_1K=X_1K_1;
  X_2K=X_2K_1;
  X_3K=X_3K_1;
  

//Se manda vía serial la salida del sistema y la entrada
Serial.print("Estado 1: "); 
Serial.print( X_1K_1);  
Serial.print(" Estado 2: "); 
Serial.print( X_2K_1); 
Serial.print(" Estado 3: "); 
Serial.println( X_3K_1);
delay(0);//(5);
}

// Funciones que representan las ecuaciones diferenciales del sistema
float sistemader1(float x1,float x2,float x3){
float derX1;
derX1=a*(x2-(-d1*x1+d3*pow(x1,3)));
return derX1;
}

float sistemader2(float x1,float x2,float x3){
float derX2;
derX2=x1-x2+x3;
return derX2;
}

float sistemader3(float x1,float x2,float x3){
float derX3;
derX3=-B*x2;
return derX3;
}





