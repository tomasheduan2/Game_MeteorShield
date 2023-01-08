public class JugadorPrincipal
{
  PImage imagenAvionJugador;
  float movAvionJugadorX=0;
  float inicioX = 325-width/2;
  float inicioY = 575-height/2;
  float posX;
  Disparo disparo;
  Vida vida;
  public JugadorPrincipal()
  {
    imagenAvionJugador = loadImage("ship.png");
    imagenAvionJugador.resize(150, 150);
    disparo = new  Disparo(movAvionJugadorX);
  }
  void Movimiento()
  {
    posX = inicioX + movAvionJugadorX;
    image(imagenAvionJugador, posX, inicioY);

    if (keyPressed&&(key)==CODED)
    {
      if (keyCode==LEFT||keyCode=='A'||keyCode=='a')
      {
        movAvionJugadorX-=3;
        if (posX<=0-width/2)
        {
          movAvionJugadorX+=3;
        }
      }
      if (keyCode==RIGHT||keyCode=='D'||keyCode=='d')
      {
        movAvionJugadorX+=3;
        if (posX>=width/2-150)
        {
          movAvionJugadorX-=3;
        }
      }
    }
  }
  void Disparo()
  {
    disparo.Movimiento(movAvionJugadorX);
  }
  float disparoX()
  {
    return disparo.PosicionX(movAvionJugadorX);
  }
  float disparoY()
  {
    return disparo.PosicionY();
  }
  float getPosX()
  {
    return posX;
  }
  float retornoInicioY()
  {
    return inicioY;
  }
}
