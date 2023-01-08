public class Meteorito
{
  PImage imagenMeteorito;
  float posicionInicialX;
  float posicionInicialY;
  float posicionY;
  float movY=0;
  float velocidad = 5;
  boolean impactado = false;
  int ladoImagen = 75;
  public Meteorito()
  {
    imagenMeteorito = loadImage("meteorito.png");
    imagenMeteorito.resize(ladoImagen, ladoImagen);
    posicionInicialX=random(0, width);
    posicionInicialY=random(-height, 0);
    movY= 0;
    impactado = false;
  }

  void Movimiento()
  {
    movY+=velocidad;
    if (posicionInicialY+movY-height/2>(height+150))
    {
      posicionInicialY = random(-height, 0);
      posicionInicialX=random(0, width);
      movY=0;
    }
  }
  void Aparecer()
  {
    if (impactado==false)
    {
      image(imagenMeteorito, posicionInicialX-width/2, posicionInicialY+movY-height/2);
    }
  }
  void VerificarImpacto(float balaX, float balaY)
  {
    if (balaX>posicionInicialX-width/2&&balaX<posicionInicialX-width/2+ladoImagen&&balaY>posicionInicialY+movY-height/2&&balaY<posicionInicialY+movY-height/2+75)
    {
      fill(255, 0, 0);
      impactado = true;
    } else
    {
      fill(0, 0, 255);
    }
  }
  boolean vivo()
  {
    return !(impactado);
  }

  public void setImpactado()
  {
    impactado = false;
  }
  float getPosX()
  {
    return posicionInicialX-width/2;
  }
  float getPosY()
  {
    return posicionInicialY+movY-height/2;
  }
}
