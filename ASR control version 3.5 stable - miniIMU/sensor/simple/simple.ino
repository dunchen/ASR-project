#include "OneWire.h"
#include "DallasTemperature.h"


///////////////////////////////////////////////
#include "Wire.h"

// I2Cdev and MPU6050 must be installed as libraries, or else the .cpp/.h files
// for both classes must be in the include path of your project
#include "I2Cdev.h"
#include "MPU6050.h"
MPU6050 accelgyro(0x69);
#define Gx_offset 0
#define Gy_offset 0
#define Gz_offset 0
int16_t ax, ay, az;
int16_t gx, gy, gz;
float aax,aay,aaz,ggx,ggy,ggz;//存储量化后的数据
float Ax,Ay,Az;//单位 g(9.8m/s^2)
float Gx,Gy,Gz;//单位 °/s 
float Angel_accX,Angel_accY,Angel_accZ;//存储加速度计算出的角度 
long LastTime,NowTime,TimeSpan;//用来对角速度积分的
// Data wire is plugged into port 2 on the Arduino
///////////////////////////////////////////////////



#define ONE_WIRE_BUS A0

// Setup a oneWire instance to communicate with any OneWire devices (not just Maxim/Dallas temperature ICs)
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature. 
DallasTemperature sensors(&oneWire);

// arrays to hold device address
DeviceAddress insideThermometer;

void setup(void)
{
  // start serial port
  Serial.begin(9600);
  
  ///////////////////////////////////////////////////////////////////
    Wire.begin();
    // initialize device
    //Serial.println("Initializing I2C devices...");
    accelgyro.initialize();
                                            //accelgyro.setI2CMasterModeEnabled(0);
                                            //accelgyro.setI2CBypassEnabled(1);
                                            //if((!accelgyro.getI2CMasterModeEnabled()) && accelgyro.getI2CBypassEnabled())
                                            //Serial.println("Set MPU6000 Bypass Mode success!\n");

    // verify connection
    //Serial.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
    if (!(accelgyro.testConnection()))
      {
        MPU6050 accelgyro(0x68);
        accelgyro.initialize();
      }
//////////////////////////////////////////////////////////////////////
  sensors.begin();
  //Serial.print(sensors.getDeviceCount());
  if (!sensors.getAddress(insideThermometer, 0)) Serial.print(0xFF); 
  // set the resolution to 9 bit (Each Dallas/Maxim device is capable of several different resolutions)
  sensors.setResolution(insideThermometer, 9);
}

// function to print the temperature for a device
void printTemperature(DeviceAddress deviceAddress)
{
  float tempC = sensors.getTempC(deviceAddress);
  //Serial.print("*");
  Serial.print(tempC);
  Serial.print("/");
}

void loop(void)
{ 
  
  sensors.requestTemperatures(); // Send the command to get temperatures
  printTemperature(insideThermometer); // Use a simple function to print out the data
  
  ///////////////////////////////////////////////////////////////////
    accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
    //======一下三行是对加速度进行量化，得出单位为g的加速度值   
    Ax=ax/16384.00;   
    Ay=ay/16384.00;   
    Az=az/16384.00;   
    //==========以下三行是用加速度计算三个轴和水平面坐标系之间的夹角
    //请参考：[url]http://www.geek-workshop.com/forum.php?mod=viewthread&tid=2328&page=1#pid27876[/url]
    //个人觉得原帖中case0算的不对，应该是z/sqrt（x*x+y*y），估计是江南楼主写错了   
    Angel_accX=atan(Ax/sqrt(Az*Az+Ay*Ay))*180/3.14;   
    Angel_accY=atan(Ay/sqrt(Ax*Ax+Az*Az))*180/3.14;   
    Angel_accZ=atan(Az/sqrt(Ax*Ax+Ay*Ay))*180/3.14;   
    //==========以下三行是对角速度做量化==========   
    ggx=gx/131.00;   
    ggy=gy/131.00;   
    ggz=gz/131.00;   
    //===============以下是对角度进行积分处理================  
    NowTime=millis();
    //获取当前程序运行的毫秒数  
    TimeSpan=NowTime-LastTime;
    //积分时间这样算不是很严谨
    //下面三行就是通过对角速度积分实现各个轴的角度测量，当然假设各轴的起始角度都是0  
    Gx=Gx+(ggx-Gx_offset)*TimeSpan/1000;  
    Gy=Gy+(ggy-Gy_offset)*TimeSpan/1000;  
    Gz=Gz+(ggz-Gz_offset)*TimeSpan/1000;   
    LastTime=NowTime;   
    //==============================  
    Serial.print(Angel_accX);  Serial.print(",");  
    Serial.print(Angel_accY);  Serial.print(",");  
    Serial.print(Angel_accZ);  Serial.print(",");  
    Serial.print(Ax);  Serial.print(",");  
    Serial.print(Ay);  Serial.print(",");  
    Serial.println(Az);  //Serial.print(",");
    //Serial.print(Gx);  Serial.print(",");  
    //Serial.print(Gy);  Serial.print(",");  
    //Serial.println(Gz);
 ////////////////////////////////////////////////////////
}




///////////////////////////////////////////////////////////////////////
// class default I2C address is 0x68
// specific I2C addresses may be passed as a parameter here
// AD0 low = 0x68 (default for InvenSense evaluation board)
// AD0 high = 0x69
//////////////////////////////////////////////////////////////////////


// function to print a device address
void printAddress(DeviceAddress deviceAddress)
{
  for (uint8_t i = 0; i < 8; i++)
  {
    if (deviceAddress[i] < 16) Serial.print("0");
    Serial.print(deviceAddress[i], HEX);
  }
}
