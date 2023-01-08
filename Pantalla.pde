public class Pantalla
{

  int botonInicioX;
  int botonInicioY;
  int botonCreditosX=30;
  int botonCreditosY=650;
  int wX;
  int hY;
  float movY = 0;
  PImage playBoton;
  Boton botonInicio;
  Boton botondDesarrollo;
  Boton botonCreditos;
  PImage fondo;

  public Pantalla()
  {
    botonInicioX=350;
    botonInicioY=650;
    wX=80;
    hY=70;
    botonInicio = new Boton(botonInicioX, botonInicioY, wX, hY);
    playBoton = loadImage("playImage.png");
    playBoton.resize(50, 50);
    fondo = loadImage("CapturaULT.JPG");
    wX=100;
    hY=70;
    botonInicioX=670;
    botonInicioY=650;
    botondDesarrollo = new Boton(botonInicioX, botonInicioY, wX, hY);
    botonCreditos = new Boton(botonCreditosX, botonCreditosY, wX, hY);
  }
  void MostrarCreditos()
  {
    mostrarFondo();
    textSize(50);
    fill(255, 0, 0);
    text("CREDITOS", 262, 120);
    textSize(35);
    fill(75*3, 50*2, 25*3);
    text("BY TOMAS HEDUAN", 212, 263);
    textSize(35);
    fill(75*3, 50*2, 25*3);
    //text("------------------------", 261, 328);
    textSize(40);
    fill(75*2, 50*2, 25*4);
    text("contact:", 80, 438);
    textSize(40);
    fill(75*2, 50*2, 25*4);
    text("tomasheduan@gmail.com", 78, 520);
    textSize(50);
    fill(75*2, 50*3, 25*4);
    //text("@HeduanDevs", 210, 600);
    botonInicio.Dibujo(250, 130, 130);
    image(playBoton, 366, 660);
  }
  void MostrarInicio()
  {
    background(0);
    image(fondo, 0, 0);
    noTint();
    textSize(50);
    fill(0, 0, 0);
    fill(75*3, 50*4, 25*4, 120);
    textFont(myFont, 50);
    //text("TRABAJO PRACTICO 5", 89, 110);
    textSize(75);
    fill(75*3, 50*3, 25*3, 180);
    text("METEOR SHIELD", 40, 110);
    botondDesarrollo.Dibujo(124, 130, 198);
    textSize(30);
    fill(124, 130, 198);
    fill(0, 0, 0);
    botonCreditos.Dibujo(124, 130, 198);
    image(playBoton, 696, 662);
    fill(0, 0, 0);
    text("INFO", 45, 698);
  }
  public boolean botonInicioPulsado()
  {
    botonInicioX=350;
    botonInicioY=650;
    if (botonInicio.Pulsado(botonInicioX, botonInicioY, wX, hY))
    {
      return true;
    } else
      return false;
  }
  public boolean botonDesarrolloPulsado()
  {
    wX=100;
    hY=70;
    botonInicioX=670;
    botonInicioY=650;
    if (botondDesarrollo.Pulsado(botonInicioX, botonInicioY, wX, hY))
    {
      return true;
    } else
      return false;
  }
  public boolean botonCreditosPulsado()
  {
    wX=100;
    hY=70;
    if (botonCreditos.Pulsado(botonCreditosX, botonCreditosY, wX, hY))
    {
      return true;
    } else
      return false;
  }
  void mostrarFondo()
  {
    background(0);
    fill(255, 255, 255, 175);
    for (int i=0; i<30; i++)
    {
      ellipse(random(0, 800), movY-600, random(0, 20), random(0, 20));
      ellipse(random(0, 800), movY-400, random(0, 20), random(0, 20));
      ellipse(random(0, 800), movY-200, random(0, 20), random(0, 20));
      ellipse(random(0, 800), movY, random(0, 20), random(0, 20));
    }
    movY+=4;
    if (movY>height+600)
    {
      movY=0;
    }
  }
}
