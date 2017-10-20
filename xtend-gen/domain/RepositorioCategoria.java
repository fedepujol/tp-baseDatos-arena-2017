package domain;

import domain.Categoria;

/* @Accessors
 */public class RepositorioCategoria {
  private int id;
  
  private /* Collection<Categoria> */Object categorias /* Skipped initializer because of errors */;
  
  private static RepositorioCategoria instance;
  
  private RepositorioCategoria() {
  }
  
  public static RepositorioCategoria getInstance() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method identityEquals(Object) is undefined for the type RepositorioCategoria");
  }
  
  public Object create(final Categoria unaCategoria) {
    throw new Error("Unresolved compilation problems:"
      + "\n++ cannot be resolved."
      + "\nThe field id is not visible"
      + "\nThe field RepositorioCategoria.categorias refers to the missing type Collection"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\nThe field RepositorioCategoria.categorias refers to the missing type Collection"
      + "\ncontains cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public void validateCreate(final Categoria unaCategoria) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method esValida() from the type Categoria refers to the missing type Object"
      + "\nThe constructor BusinessException(String) refers to the missing type String"
      + "\n! cannot be resolved");
  }
}
