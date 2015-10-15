Particle [] group;
PImage pic;

void setup()
{
	size(600,600);
	background(0);
	frameRate(50);
	group = new Particle[200];
	for (int i = 0; i < group.length; i++)
	{
		group[i] = new NormalParticle();
	}
	group[0] = new OddballParticle();
	group[1] = new JumboParticle();
	pic = loadImage("onigiri.png");
}
void draw()
{
	background(0);
	for (int i = 0; i < group.length; i++)
	{
		group[i].move();
		group[i].show();
	}
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	int particleColor;
	double mousePosX = 300.0;
	double mousePosY = 300.0;
	int cR = (int)(Math.random()*50)+50;
	int cG = (int)(Math.random()*150)+100;
	int cB = (int)(Math.random()*100)+155;

	NormalParticle()
	{
		x = mousePosX;
		y = mousePosY;
		speed = (Math.random()*3)+1;
		angle = Math.random()*2*Math.PI;
		particleColor = color(cR,cG,cB);
	}

	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		
		if (x < 0 || x > 600 || y < 0 || y > 600)
		{
			speed = -1*speed;
		}

		if(x == mousePosX && y == mousePosY)
		{
			speed = -1*speed;
		}

		if (mousePressed)
		{
			mousePosX = mouseX;
			mousePosY = mouseY;
			x = mousePosX;
			y = mousePosY;
			angle = Math.random()*2*Math.PI;
			speed = (Math.random()*3)+1;
		}
	}

	public void show()
	{
		noStroke();
		fill(particleColor);
		ellipse((float)x, (float)y, 7, 7);
	}
}

interface Particle
{
	public void move();
	public void show();
}

class OddballParticle implements Particle
{
	//your code here
	double x, y;
	int directionX = 1;
	int directionY = 1;

	OddballParticle()
	{
		x = Math.random()*100 + 50;
		y = Math.random()*100 + 50;
	}

	void move() 
	{
		if (x < 0)
		{
			directionX = 1;
		}

		if (x > 590)
		{
			directionX = -1;
		}

		if (y < -15)
		{
			directionY = 1;
		}

		if (y > 570)
		{
			directionY = -1;
		}

		x+= 4*directionX+3;
		y+= 4*directionY;
	}

	void show()
	{
		image(pic, (float)x, (float)y, 40, 60);
		fill(255);
		textSize(20);
		text("Weeee", (float)x-5, (float)y);
	}
}

class JumboParticle extends NormalParticle
{
	public void show() {
		fill(particleColor);
		ellipse((float)x, (float)y, 60, 60);
	}

}
