Particle [] group;

void setup()
{
	size(600,600);
	background(0);
	group = new Particle[150];
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
	int cR = (int)(Math.random()*156);
	int cG = (int)(Math.random()*50)+80;
	int cB = (int)(Math.random()*156)+100;

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
	}

	public void show()
	{
		noStroke();
		fill(particleColor);
		ellipse((float)x, (float)y, 5, 5);
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

		x+= 6*directionX+3;
		y+= 6*directionY;
	}

	void show()
	{
		fill(particleColor);
		rect((float)x, (float)y, 20, 20);
	}
}

class JumboParticle extends NormalParticle
{
	public void show() {
		fill(particleColor);
		ellipse((float)x, (float)y, 50, 50);
	}
}
