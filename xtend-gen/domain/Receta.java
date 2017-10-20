package domain;

import domain.Alimento;

/* @Accessors
@Observable
 */public class Receta {
  private int id;
  
  private /* String */Object nombre;
  
  private /* String */Object descripcion;
  
  private /* Map<Alimento, Double> */Object ingredientes /* Skipped initializer because of errors */;
  
  public Receta(final /* String */Object unNombre, final /* String */Object unaDescripcion, final /* Map<Alimento, Double> */Object unosIngredientes) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field Receta.nombre refers to the missing type String"
      + "\nThe field Receta.descripcion refers to the missing type String"
      + "\nThe field Receta.ingredientes refers to the missing type Map");
  }
  
  public Object esValida() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field Receta.nombre refers to the missing type String"
      + "\nThe field Receta.descripcion refers to the missing type String"
      + "\nlength cannot be resolved"
      + "\n> cannot be resolved"
      + "\n&& cannot be resolved"
      + "\nlength cannot be resolved"
      + "\n> cannot be resolved");
  }
  
  public /* String */Object toString() {
    throw new Error("Unresolved compilation problems:"
      + "\nStringBuilder cannot be resolved."
      + "\nThe field Receta.ingredientes refers to the missing type Map"
      + "\nkeySet cannot be resolved"
      + "\nforEach cannot be resolved"
      + "\nappend cannot be resolved"
      + "\nnombre cannot be resolved"
      + "\ntoString cannot be resolved");
  }
}
