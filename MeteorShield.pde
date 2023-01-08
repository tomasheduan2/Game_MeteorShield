Desarrollo desarrollo;
Pantalla pantalla;
finDeJuego finJuego;

public boolean mostrarPantallaDesarrollo=false;
public boolean mostrarPantallaInicio=true;
public boolean mostrarpantallaCreditos=false;
import processing.sound.*;
SoundFile fileDisparo;
SoundFile fileImpacto;
SoundFile fileWin;
PFont myFont;

void setup()
{
  size(800, 800);
  myFont = createFont("Interstellar.ttf", 32);
  fileDisparo = new SoundFile(this, "shoot.mp3");
  fileImpacto = new SoundFile(this, "hit.wav");
  fileWin = new SoundFile(this, "musicWin.mp3");

  pantalla = new Pantalla();
  desarrollo = new Desarrollo();
  finJuego = new finDeJuego();
}
void draw()
{
  if (desarrollo.getPerdio()==true)
  {
    finJuego.MostrarDerrota();
    if (mousePressed)
    {
      desarrollo.setPerdio(false);
    }
  } else if (desarrollo.getGano()==true)
  {
    finJuego.MostrarVictoria();
    if (mousePressed)
    {
      desarrollo.setGano(false);
    }
  } else
  {
    if (pantalla.botonInicioPulsado())
    {
      mostrarPantallaDesarrollo=false;
      mostrarPantallaInicio=true;
      mostrarpantallaCreditos=false;
    }
    if (pantalla.botonDesarrolloPulsado())
    {
      mostrarPantallaDesarrollo = true;
      mostrarPantallaInicio = false;
      mostrarpantallaCreditos = false;
      fileWin.stop();
      delay(50);
    }
    if (pantalla.botonCreditosPulsado())
    {
      mostrarPantallaDesarrollo = false;
      mostrarPantallaInicio = false;
      mostrarpantallaCreditos = true;
    }

    if (mostrarPantallaDesarrollo&&mostrarPantallaInicio==false&&mostrarpantallaCreditos==false)
    {
      desarrollo.Mostrar();
    } else if (mostrarpantallaCreditos&&mostrarPantallaInicio==false&&mostrarPantallaDesarrollo==false)
    {
      pantalla.MostrarCreditos();
    } else
    {
      pantalla.MostrarInicio();
    }
  }
}
