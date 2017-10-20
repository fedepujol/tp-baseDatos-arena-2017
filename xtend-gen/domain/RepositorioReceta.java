package domain;

import domain.Receta;

/* @Accessors
 */public class RepositorioReceta {
  private int id;
  
  private /* Collection<Receta> */Object recetas /* Skipped initializer because of errors */;
  
  private static RepositorioReceta instance;
  
  private RepositorioReceta() {
  }
  
  public static RepositorioReceta getInstance() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method identityEquals(Object) is undefined for the type RepositorioReceta");
  }
  
  public Object create(final Receta unaReceta) {
    throw new Error("Unresolved compilation problems:"
      + "\n++ cannot be resolved."
      + "\nThe field id is not visible"
      + "\nThe field RepositorioReceta.recetas refers to the missing type Collection"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\nThe field RepositorioReceta.recetas refers to the missing type Collection"
      + "\ncontains cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public void validateCreate(final Receta unaReceta) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method esValida() from the type Receta refers to the missing type Object"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\n! cannot be resolved");
  }
}
