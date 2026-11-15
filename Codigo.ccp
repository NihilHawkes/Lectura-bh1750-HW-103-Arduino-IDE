#include <Wire.h>
#include <BH1750.h>

BH1750 Luxometro;
int sensorPin = A0; // Pin analógico conectado al AO del HW-103
int valorHumedad = 0;

void setup() {
  Serial.begin(9600); // Inicializa el monitor serie

  Wire.begin();

  Serial.println("Inicializando sensor...");

  if (Luxometro.begin(BH1750::CONTINUOUS_HIGH_RES_MODE)) {
    Serial.println("Sensor inicializado correctamente.");
  } else {
    Serial.println("Error al inicializar el sensor.");
  }
}

void loop() {
  float lux = Luxometro.readLightLevel();

  if (lux >= 0) {
    Serial.print("Luz (iluminancia): ");
    Serial.print(lux);
    Serial.println(" lx");
  } else {
    Serial.println("Error al leer el sensor.");
  }
  valorHumedad = analogRead(sensorPin); // Lee el valor analógico (0 a 1023)
  Serial.print("Valor del sensor HW-103: ");
  Serial.println(valorHumedad);
  
  delay(1000); // Espera un segundo
}
