Particle [] group;

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
	int cR = (int)(Math.random()*50)+50;
	int cG = (int)(Math.random()*100)+70;
	int cB = (int)(Math.random()*100)+156;

	NormalParticle()
	{
		x = 300.00;
		y = 300.00;
		speed = (Math.random()*4)+1;
		angle = Math.random()*2*Math.PI;
		particleColor = color(cR,cG,cB);
	}

	public void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		//System.out.println("x: " + x + " y: " + y);
		if (x%2 >= 1)
		{
			angle+=10;
		}
		if (mousePressed)
		{
			x = mouseX;
			y = mouseY;
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
	int particleColor;
	int directionX = 1;
	int directionY = 1;

	OddballParticle()
	{
		x = Math.random()*100 + 50;
		y = Math.random()*100 + 50;
		particleColor = color(255);
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

		if (y < 0)
		{
			directionY = 1;
		}

		if (y > 590)
		{
			directionY = -1;
		}

		x+= 4*directionX+3;
		y+= 4*directionY;
	}

	void show()
	{
		fill(particleColor);
		rect((float)x, (float)y, 20, 20);
		textSize(20);
		text("Me weird tofu. Tofu iz gud 4 u.", (float)x-120, (float)y-10);
	}
}

class JumboParticle extends NormalParticle
{
	public void show() {
		fill(particleColor);
		ellipse((float)x, (float)y, 60, 60);
	}
}
