package domain;

import domain.Alimento;

/* @Accessors
 */public class RepositorioAlimento {
  private int id = 1;
  
  private static RepositorioAlimento instance;
  
  private /* List<Alimento> */Object alimentos /* Skipped initializer because of errors */;
  
  private RepositorioAlimento() {
  }
  
  public static RepositorioAlimento getInstance() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method identityEquals(Object) is undefined for the type RepositorioAlimento");
  }
  
  public Object create(final Alimento unAlimento) {
    throw new Error("Unresolved compilation problems:"
      + "\n++ cannot be resolved."
      + "\nThe field id is not visible"
      + "\nThe field RepositorioAlimento.alimentos refers to the missing type List"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\nThe field RepositorioAlimento.alimentos refers to the missing type List"
      + "\ncontains cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public void validateCreate(final Alimento unaUnidad) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method esValido() from the type Alimento refers to the missing type Object"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\n! cannot be resolved");
  }
  
  public Object search(final /* String */Object unNombre, final /* Double */Object unaCantidad) {
    throw new Error("Unresolved compilation problems:"
      + "\n&& cannot be resolved."
      + "\nThe field RepositorioAlimento.alimentos refers to the missing type List"
      + "\nThe method match(Object, Object) from the type RepositorioAlimento refers to the missing type Object"
      + "\nfilter cannot be resolved"
      + "\nnombre cannot be resolved"
      + "\ncantidad cannot be resolved"
      + "\ntoList cannot be resolved");
  }
  
  public boolean match(final /* Object */Object expectedValue, final /* Object */Object realValue) {
    throw new Error("Unresolved compilation problems:"
      + "\n=== cannot be resolved"
      + "\n=== cannot be resolved"
      + "\ntoString cannot be resolved"
      + "\ntoLowerCase cannot be resolved"
      + "\ncontains cannot be resolved"
      + "\ntoString cannot be resolved"
      + "\ntoLowerCase cannot be resolved");
  }
  
  public boolean matchNaN(final double expectedValue, final double realValue) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method identityEquals(Object) is undefined for the type double"
      + "\nThe method identityEquals(Object) is undefined for the type double"
      + "\nThe method or field Double is undefined"
      + "\n=== cannot be resolved."
      + "\nisNaN cannot be resolved");
  }
}
