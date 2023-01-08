public class finDeJuego
{
  public finDeJuego()
  {
  }
  void MostrarVictoria()
  {
    background(0);
    fill(255);
    textSize(40);
    text("¡VICTORIA!", 290, 350);
    textSize(20);
    text("(Click para volver)", 285, 500);
    delay(100);
  }

  void MostrarDerrota()
  {
    background(0);
    fill(255);
    textSize(40);
    text("¡DERROTA!", 300, 350);
    textSize(20);
    text("(Click para volver)", 300, 500);
    delay(100);
  }
}
