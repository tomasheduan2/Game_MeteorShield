public class Desarrollo
{
  PImage fondo;
  float objetivoBarra = 0;
  int CANTIDADENEMIGOS = 5;
  Meteorito[] meteoritos = new Meteorito[CANTIDADENEMIGOS];
  JugadorPrincipal jugador;
  Vida vida;
  int cantidadVidas=5;
  int enemigosRestantes=CANTIDADENEMIGOS;
  boolean block = true;
  boolean en_choque = false;
  boolean block2 = true;
  boolean perdio = false;
  boolean gano = false;
  public Desarrollo()
  {
    fileWin.loop();
    for (int i=0; i<CANTIDADENEMIGOS; i++)
    {
      meteoritos[i] = new Meteorito();
    }
    jugador = new JugadorPrincipal();
    fondo = loadImage("m42.jpg");
    fondo.resize(800, 800);
    vida = new Vida();
  }
  void Mostrar()
  {
    if (en_choque)
    {
      tint(125, 20, 20);
    } else
    {
      fileImpacto.stop();
    }
    image(fondo, 0, 0);
    textSize(30);
    fill(0, 0, 255);
    translate(width/2, height/2);
    jugador.Movimiento();
    jugador.Disparo();
    float balaX = jugador.disparoX();
    float balaY = jugador.disparoY();
    enemigosRestantes=0;
    for (int i=0; i<CANTIDADENEMIGOS; i++)
    {
      meteoritos[i].Movimiento();
      meteoritos[i].Aparecer();
      meteoritos[i].VerificarImpacto(balaX, balaY);

      if (meteoritos[i].vivo())
      {
        enemigosRestantes++;
        if (choque(meteoritos[i].getPosX(), meteoritos[i].getPosY(), 75, jugador.getPosX(), jugador.retornoInicioY(), 150))
        {
          if (block==true)
          {
            fileImpacto.loop();
            cantidadVidas--;
            if (cantidadVidas == -1)
            {
              cantidadVidas=0;
            }
            block = false;
          }
        }
      }
    }
    en_choque = false;
    for (int i=0; i<CANTIDADENEMIGOS; i++)
    {
      if (meteoritos[i].vivo())
      {
        if ((choque(meteoritos[i].getPosX(), meteoritos[i].getPosY(), 75, jugador.getPosX(), jugador.retornoInicioY(), 150)))
        {
          en_choque=true;
        }
      }
    }
    if (en_choque==true)
    {

      block = false;
    } else
    {
      block = true;
    }

    noStroke();
    fill(138, 149, 151);
    tint(255, 126);
    rect(0-width/2, 0-height/2, width, 70);
    vida.mostrar(cantidadVidas, 0-width/2, 0-height/2+35);
    noTint();
    if (objetivoBarra<500)
    {
      fill(239, 184, 16);
      rect(0-width/2+50*3+100, 0-height/2+15, objetivoBarra, 20);
      textSize(20);
      text("Meteoritos restantes", 420-width/2, 30-height/2);
      textSize(30);
      text(enemigosRestantes, 590-width/2, 65-height/2);
    }

    if (enemigosRestantes == 0)
    {
      fileWin.loop();
      fileDisparo.stop();
      fileImpacto.stop();
      textSize(40);
      mostrarPantallaDesarrollo=false;
      mostrarPantallaInicio=true;
      mostrarpantallaCreditos=false;
      enemigosRestantes=CANTIDADENEMIGOS+1;
      gano = true;
      cantidadVidas=5;
      for (int i=0; i<CANTIDADENEMIGOS; i++)
      {
        meteoritos[i].impactado=false;
      }
    }
    if (cantidadVidas == 0)
    {
      fileDisparo.stop();
      fileImpacto.stop();
      mostrarPantallaDesarrollo=false;
      mostrarPantallaInicio=true;
      mostrarpantallaCreditos=false;
      perdio = true;
      enemigosRestantes=CANTIDADENEMIGOS;
      cantidadVidas=5;
      for (int i=0; i<CANTIDADENEMIGOS; i++)
      {
        meteoritos[i].impactado=false;
      }
      fileWin.loop();
    }
  }

  boolean choque(float upCuad1X, float upCuad1Y, float lon1, float doCuad2X, float doCuad2Y, float lon2)
  {
    if ((upCuad1Y+lon1)>doCuad2Y && upCuad1Y<(doCuad2Y+lon2) && (upCuad1X+lon1)>doCuad2X && (upCuad1X)<(doCuad2X+lon2))
    {
      return true;
    } else
    {
      return false;
    }
  }
  public boolean getPerdio()
  {
    return perdio;
  }
  public boolean setPerdio(boolean estado)
  {
    return perdio=estado;
  }
  public boolean getGano()
  {
    return gano;
  }
  public boolean setGano(boolean estado)
  {
    return gano=estado;
  }
}
