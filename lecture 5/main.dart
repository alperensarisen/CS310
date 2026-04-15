//! Higher-Order Funcctions Practices
int add(int a, int b) => a+b;
int multp(int a, int b) => a*b;
void prf(int a, int b, int Function(int a, int b) w){
  int result = w(a,b);
  print("Result of the operation is: $result");
}
void main(){
  prf(10, 2, add);
  prf(2,5,multp);
  prf(4, 4, (a,b) => a-b);
}