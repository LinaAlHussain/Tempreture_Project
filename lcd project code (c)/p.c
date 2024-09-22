sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;

sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;

char t[10];
unsigned int temp_store;

void main() {
   TRISA=0xFF;
   Lcd_Init();
   Lcd_out(1,1,"temperature : ");
   delay_ms(500);

   while(1){
      temp_store=ADC_Read(2)*100; //1V=100C
      temp_store=temp_store*5/1023;

      IntToStr (temp_store,t);
      Lcd_out(2,2,t);
      Lcd_out(2,10," C ");
      delay_ms(500);
      }
}