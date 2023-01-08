public class Boton
{
  int inicioX;
  int inicioY;
  int largoX;
  int largoY;
  public Boton(int inicioX, int inicioY, int largoX, int largoY)
  {
    this.inicioX = inicioX;
    this.inicioY = inicioY;
    this.largoX = largoX;
    this.largoY = largoY;
  }
  public void Dibujo(int R, int G, int B)
  {
    fill(R, G, B);
    strokeWeight(5);
    stroke(R-30, G-30, B-30);
    rect(inicioX, inicioY, largoX, largoY);
    noStroke();
  }
  public boolean Pulsado(int inicioX, int inicioY, int largoX, int largoY)
  {
    if (mouseX>inicioX&&mouseX<(inicioX+largoX)&&mouseY>inicioY&&mouseY<(inicioY+largoY))
    {
      if (mousePressed)
      {
        return true;
      }
    }
    return false;
  }
}
