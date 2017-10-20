package domain;

import domain.UnidadMedida;

/* @Accessors
 */public class RepositorioUnidadMedida {
  private int id = 1;
  
  private static RepositorioUnidadMedida instance;
  
  private /* Collection<UnidadMedida> */Object unidades /* Skipped initializer because of errors */;
  
  private RepositorioUnidadMedida() {
  }
  
  public static RepositorioUnidadMedida getInstance() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method identityEquals(Object) is undefined for the type RepositorioUnidadMedida");
  }
  
  public Object create(final UnidadMedida unaUnidad) {
    throw new Error("Unresolved compilation problems:"
      + "\n++ cannot be resolved."
      + "\nThe field id is not visible"
      + "\nThe field RepositorioUnidadMedida.unidades refers to the missing type Collection"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\nThe field RepositorioUnidadMedida.unidades refers to the missing type Collection"
      + "\ncontains cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public void validateCreate(final UnidadMedida unaUnidad) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method esValida() from the type UnidadMedida refers to the missing type Object"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\n! cannot be resolved");
  }
}
