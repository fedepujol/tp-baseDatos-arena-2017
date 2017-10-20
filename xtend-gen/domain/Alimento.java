package domain;

import domain.Categoria;
import domain.UnidadMedida;

/* @Accessors
@Observable
 */public class Alimento {
  private int id;
  
  private double cantidad;
  
  private /* String */Object nombre;
  
  private UnidadMedida unidad;
  
  private Categoria categoria;
  
  public Alimento(final /* String */Object unNombre, final double unaCantidad, final UnidadMedida unaUnidad, final Categoria unaCategoria) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field Alimento.nombre refers to the missing type String");
  }
  
  public Object esValido() {
    throw new Error("Unresolved compilation problems:"
      + "\n!== cannot be resolved."
      + "\n!== cannot be resolved."
      + "\nThe field Alimento.nombre refers to the missing type String"
      + "\n&& cannot be resolved"
      + "\n&& cannot be resolved"
      + "\nlength cannot be resolved"
      + "\n> cannot be resolved");
  }
}
