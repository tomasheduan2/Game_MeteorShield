
public class Disparo
{
  PImage imagenCohete;
  float movBalaX;
  float movBalaY;
  float posicionInicioDisparo;
  float velocidadDisparo = 10;
  boolean nuevo = false;
  public Disparo(float posicionInicioDisparo)
  {
    imagenCohete = loadImage("disparo.png");
    imagenCohete.resize(20, 25);
    this.posicionInicioDisparo = posicionInicioDisparo;
  }

  void Movimiento(float inicioX)
  {
    movBalaY+=velocidadDisparo;
    if (((575-height/2)-movBalaY)<-400)
    {
      fileDisparo.loop();
      nuevo = true;
      movBalaY=0;
      movBalaX=0;
    }
    image(imagenCohete, (400-width/2)+movBalaX+inicioX-7, (575-height/2)-movBalaY);
  }

  float PosicionX(float inicioX)
  {
    return (400-width/2)+movBalaX+inicioX;
  }
  float PosicionY()
  {
    return (575-height/2)-movBalaY;
  }
}
