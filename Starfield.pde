Particle [] group;

void setup()
{
	//your code here
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
	boolean out;
	int cR = (int)(Math.random()*156);
	int cG = (int)(Math.random()*100)+50;
	int cB = (int)(Math.random()*156)+100;

	NormalParticle()
	{
		x = 300.00;
		y = 300.00;
		speed = (Math.random()*5)+5;
		angle = Math.random()*2*Math.PI;
		particleColor = color(cR,cG,cB);
		out = true;
	}

	public void move()
	{
		
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		System.out.println("x: " + x + " y: " + y);
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
	//your code here
	public void move();
	public void show();
}

class OddballParticle implements Particle
{
	//your code here
	double x, y;
	int particleColor;

	OddballParticle()
	{
		x = 300;
		y = 300;
		particleColor = color(255);
	}

	void move() 
	{
		//if (y <= 0)
		{
			y+=10;
		}
		//else if  (y >= 600 )
		{
			y-=10;
		}
		//else
		{
			y++;	
		}
		
		//if (x <= 0)
		{
			x+=10;
		}
		//else if (x >= 600)
		{
			x-=10;
		}
	}//this code doesn't work fix!!

	void show()
	{
		fill(particleColor);
		rect((float)x, (float)y, 10, 10);
	}
}

class JumboParticle extends NormalParticle
{
	//your code here
	public void show() {
		fill(particleColor);
		ellipse((float)x, (float)y, 50, 50);
	}
}
