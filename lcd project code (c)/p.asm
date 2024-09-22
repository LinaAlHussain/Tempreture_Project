
_main:

;p.c,18 :: 		void main() {
;p.c,19 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;p.c,20 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;p.c,21 :: 		Lcd_out(1,1,"temperature : ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_p+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p.c,22 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;p.c,24 :: 		while(1){
L_main1:
;p.c,26 :: 		temp_store=ADC_Read(2)*100; //1V=100C
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _temp_store+0
	MOVF       R0+1, 0
	MOVWF      _temp_store+1
;p.c,27 :: 		temp_store=temp_store*5/1023;
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _temp_store+0
	MOVF       R0+1, 0
	MOVWF      _temp_store+1
;p.c,29 :: 		IntToStr (temp_store,t);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _t+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;p.c,30 :: 		Lcd_out(2,2,t);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _t+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p.c,31 :: 		Lcd_out(2,10," C ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_p+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;p.c,32 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;p.c,33 :: 		}
	GOTO       L_main1
;p.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
