# ICE2011
이 프로젝트는 [디지털 논리회로(ICE2001)](https://abeek.inha.ac.kr/01_prof/01_portfolio/PlanPrintInfo.aspx?CurrSeq=153607&ViewState=Y) 과목의 final project 중 verilog 관련 항목에 관한 것입니다.
## 목표
Verilog를 이용하여 6 bit carry look ahead adder 설계하기
## 조건
* Gate level modeling으로 할 것
* 모든 gate input의 maximum은 4개로 제한
* Input이 FF을 한 번 거친 뒤 combination logic으로 입력되고, combinational logic output이 FF을 거친 뒤 최종 output으로 출력
* FF만 Behavioral 모델링으로 설계 (positive edge triggered, negative edge asynchronous reset, D-FF만 사용)
* Input: in_A[5:0], in_B[5:0], clk, rst
* Output: out[5:0], c_out
## 회로도
![carry-look-ahead-adder](https://github.com/Yun-YeoJun/ICE2011/assets/30434779/52b8cf40-89e2-4dbb-b805-a7b24cdcb107)
## 분석
||Carry Look Ahead Adder|
|---|---|
|Worst Delay의 gate 수|13 (D-FF 제외)|
|설계에 사용된 총 gate 수|36 (D-FF 제외)|
